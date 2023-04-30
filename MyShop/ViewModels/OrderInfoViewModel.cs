using Microsoft.EntityFrameworkCore;
using MyShop.Models;
using MyShop.Models.DAL;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using static OfficeOpenXml.ExcelErrorValue;

namespace MyShop.ViewModels
{
    internal class OrderInfoViewModel : BaseViewModel
    {
        private bool isSave = false;
        public bool isAdd = false;
        private Order _order;
        private List<string> _users = new List<string>();
        private OrderDAO _orderDAO = new OrderDAO();
        private AccountDAO _accountDAO = new AccountDAO();
        private decimal _totalPrice = 0;
        public decimal TotalPrice
        {
            get => _totalPrice; set
            {
                _totalPrice = value;
                OnPropertyChanged("TotalPrice");
            }
        }
        public Order Order
        {
            get => _order; set
            {
                _order = value;
                GetAddableBookNameAndQuantity(value.Id);
                GetBookNameAndQuantity(value.Id);
                TotalPrice = _orderDAO.TotalPrice(value.Id);
                _orderDAO.UpdateOrder(value);
                OnPropertyChanged("Order");
            }
        }
        public List<string> Users
        {
            get => _users; set
            {
                _users = value; OnPropertyChanged("Users");
            }
        }

        private string _selectedUser;
        public string SelectedUser
        {
            get => _selectedUser;
            set
            {
                _selectedUser = value;
                var (address, phone) = _accountDAO.GetRecipientDetails(value);
                Order.RecipientAddress = address;
                Order.RecipientPhone = phone;
                OnPropertyChanged("Order");
            }
        }
        private ObservableCollection<BookNameQuantity> _listProduct = new ObservableCollection<BookNameQuantity>();
        public ObservableCollection<BookNameQuantity> ListProduct {
            get => _listProduct;
            set
            {
                _listProduct = value;
                OnPropertyChanged("ListProduct");
            }
        }

        private ObservableCollection<BookNameQuantity> _listAddableProduct = new ObservableCollection<BookNameQuantity>();
        public ObservableCollection<BookNameQuantity> ListAddableProduct
        {
            get => _listAddableProduct;
            set
            {
                _listAddableProduct = value;
                OnPropertyChanged("ListAddableProduct");
            }
        }
        public void GetBookNameAndQuantity(Guid orderId)
        {
            ListProduct.Clear();
            var db = new MyShopDbContext();

            var orderItems = from oi in db.OrderItems
                             where oi.OrderId == orderId
                             select new { BookName = oi.Book.Name, Quantity = oi.Quantity, oi.BookId };

            foreach (var item in orderItems)
            {
                //MessageBox.Show($"Book Name: {item.BookName}, Quantity: {item.Quantity}");
                ListProduct.Insert(0, new BookNameQuantity(item.BookId, item.BookName, item.Quantity));
            }
        }
        public void GetAddableBookNameAndQuantity(Guid orderId)
        {
            ListAddableProduct.Clear();
            using (var db = new MyShopDbContext())
            {

                // Get all book names and IDs
                var allBooks = from b in db.Books
                               select new { b.Name, b.Id };

                // Get book IDs in the given order
                var orderBookIds = from oi in db.OrderItems
                                   where oi.OrderId == orderId
                                   select oi.BookId;

                // Get book names and IDs that are not in the order
                var newBooks = allBooks.Where(b => !orderBookIds.Contains(b.Id));

                // Add all book names and IDs to the list
                foreach (var item in newBooks)
                {
                    ListAddableProduct.Insert(0, new BookNameQuantity(item.Id, item.Name, 1));
                }
            }
        }
        public ICommand SaveCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand IncreaseCommand { get; set; }
        public ICommand DecreaseCommand { get; set; }
        public ICommand AddCommand { get; set; }
        public ICommand CloseCommand { get; set; }
        public class BookNameQuantity: INotifyPropertyChanged
        {
            public Guid BookId { get; set; }
            private string _bookName;
            public string BookName
            {
                get { return _bookName; }
                set { _bookName = value; OnPropertyChanged(nameof(BookName)); }
            }
            private int _quantity;
            public int Quantity
            {
                get { return _quantity; }
                set { _quantity = value; OnPropertyChanged(nameof(Quantity)); }
            }

            public BookNameQuantity(Guid bookId, string bookName, int quantity)
            {
                this.BookId = bookId;
                BookName = bookName;
                Quantity = quantity;
            }
            public event PropertyChangedEventHandler PropertyChanged;

            protected void OnPropertyChanged(string propertyName)
            {
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
            }
        }
        private int _currenPage = 0;
        private int _itemsPerPage = 6;
        public int CurrentPage
        {
            get => _currenPage; set
            {
                _currenPage = value;
                OnPropertyChanged("CurrentPage");
            }
        }

        public OrderInfoViewModel()
        {
            _order = new Order();
            _users = _orderDAO.GetAllUsersName();
            SaveCommand = new RelayCommand<object>(p =>
            {
                _orderDAO.UpdateOrder(Order);
                Order.UpdatedAt = DateTime.Now;
                MessageBox.Show("Update successful");
                OnPropertyChanged("Order");
                isSave = true;
            });
            DeleteCommand = new RelayCommand<BookNameQuantity>(p =>
            {
                _orderDAO.DeleteOrderItem(Order.Id, p.BookId);
                Order.UpdatedAt = DateTime.Now;
                _orderDAO.UpdateOrder(Order);
                GetBookNameAndQuantity(Order.Id);
                GetAddableBookNameAndQuantity(Order.Id);
                TotalPrice = _orderDAO.TotalPrice(Order.Id);
                MessageBox.Show("Delete successful");
                OnPropertyChanged("Order");
                OnPropertyChanged("ListProduct");
            });
            IncreaseCommand = new RelayCommand<BookNameQuantity>(p =>
            {
                _orderDAO.IncreaseOrderItemQuantity(Order.Id, p.BookId);
                Order.UpdatedAt = DateTime.Now;
                _orderDAO.UpdateOrder(Order);
                TotalPrice = _orderDAO.TotalPrice(Order.Id);
                var item = ListProduct.FirstOrDefault(x => x.BookId == p.BookId);
                if (item != null)
                {
                    item.Quantity++;
                    OnPropertyChanged("ListProduct");
                }
                MessageBox.Show("Increase successful");
                OnPropertyChanged("Order");
            });
            DecreaseCommand = new RelayCommand<BookNameQuantity>(p =>
            {
                var item = ListProduct.FirstOrDefault(x => x.BookId == p.BookId);
                if (item != null && item.Quantity > 1)
                {
                    _orderDAO.DecreaseOrderItemQuantity(Order.Id, p.BookId);
                    Order.UpdatedAt = DateTime.Now;
                    _orderDAO.UpdateOrder(Order);
                    TotalPrice = _orderDAO.TotalPrice(Order.Id);
                    item.Quantity--;
                    MessageBox.Show("Decrease successful");
                    OnPropertyChanged("ListProduct");
                }
                else
                {
                    MessageBox.Show("The minimum quantity of an item is 1.");
                }
                OnPropertyChanged("Order");
            });
            AddCommand = new RelayCommand<BookNameQuantity>(p =>
            {
                _orderDAO.AddOrderItem(Order.Id, p.BookId);
                Order.UpdatedAt = DateTime.Now;
                _orderDAO.UpdateOrder(Order);
                GetBookNameAndQuantity(Order.Id);
                GetAddableBookNameAndQuantity(Order.Id);
                TotalPrice = _orderDAO.TotalPrice(Order.Id);
                MessageBox.Show("Add successful");
                OnPropertyChanged("Order");
                OnPropertyChanged("ListProduct");
            });
            CloseCommand = new RelayCommand<Window>(p =>
            {
                if (isSave == true)
                {
                    p.Close();
                }
                else
                {
                    if (isAdd == true)
                    {
                        _orderDAO.DeleteOrder(Order.Id);
                    }
                    p.Close();
                }
            });
        }
    }
}
