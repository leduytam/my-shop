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
using static System.Reflection.Metadata.BlobBuilder;

namespace MyShop.ViewModels
{
    internal class OrderInfoViewModel : BaseViewModel
    {
        private bool isSave = false;
        public bool isAdd = false;
        private Order _order;
        private List<string> _users = new List<string>();
        private BookDAO _bookDao = new BookDAO();
        private OrderDAO _orderDAO = new OrderDAO();
        private AccountDAO _accountDAO = new AccountDAO();
        private decimal _totalPrice = 0;
        private int _totalItems = 0;
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
                ListAddableProduct = FiltedBooks(Keyword, CurrentPage);
                _totalItems = ListAddableProduct.Count;
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
        public ObservableCollection<BookNameQuantity> ListProduct
        {
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
        private int _itemPerPage = 5;

        public int ItemPerPage
        {
            get { return _itemPerPage; }
            set
            {
                _itemPerPage = value;
                OnPropertyChanged(nameof(ItemPerPage));
            }
        }
        private int _totalPages = 0;
        private int _curPage = 0;
        private string _curKeyword = "";
        public string Keyword
        {
            get => _curKeyword;
            set
            {
                _curPage = 0;
                PageItems = _curPage;
                _curKeyword = value;
                OnPropertyChanged("Keyword");
                ListAddableProduct = FiltedBooks(value, _curPage);
            }
        }
        public int PageItems { get => _curPage; set { _curPage = value; OnPropertyChanged("PageItems"); } }
        public ICommand SaveCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand IncreaseCommand { get; set; }
        public ICommand DecreaseCommand { get; set; }
        public ICommand AddCommand { get; set; }
        public ICommand CloseCommand { get; set; }
        public ICommand FirstPageCommand { get; set; }
        public ICommand PreviousPageCommand { get; set; }
        public ICommand NextPageCommand { get; set; }
        public ICommand LastPageCommand { get; set; }
        public ObservableCollection<BookNameQuantity> FiltedBooks(string keyword, int currentPage)
        {
            IEnumerable<Book> list;
            List<Book> listBooksGenre = new List<Book>();

            if (currentPage >= 0)
            {
                listBooksGenre = _bookDao.GetBooksNotInOrder(Order.Id);

                list = listBooksGenre.Where(
                        item => item.Name.Contains(keyword))
                    .Where(item => item.IsDeleted == false);
                _totalPages = (list.Count() % _itemPerPage == 0 ? 0 : 1) + list.Count() / _itemPerPage;
                list = list.Skip(currentPage * _itemPerPage).Take(_itemPerPage);

                return new ObservableCollection<BookNameQuantity>(
                    list.Select(book => new BookNameQuantity(book.Id, book.Name, book.Quantity)));
            }
            else
            {
                listBooksGenre = _bookDao.GetBooksNotInOrder(Order.Id);

                list = listBooksGenre.Where(
                        item => item.Name.Contains(keyword))
                    .Where(item => item.IsDeleted == false);
                int lastPage = (list.Count() % _itemPerPage == 0 ? 0 : 1) + list.Count() / _itemPerPage;
                list = list.Skip((lastPage - 1) * _itemPerPage).Take(_itemPerPage);
                _curPage = lastPage - 1;
                _totalPages = lastPage - 1;

                return new ObservableCollection<BookNameQuantity>(
                    list.Select(book => new BookNameQuantity(book.Id, book.Name, book.Quantity)));
            }
        }
        public class BookNameQuantity : INotifyPropertyChanged
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
        private int _itemsPerPage = 5;
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
                Keyword = "";
                CurrentPage = 0;
                ListAddableProduct = FiltedBooks(Keyword, CurrentPage);
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
                Keyword = "";
                CurrentPage = 0;
                ListAddableProduct = FiltedBooks(Keyword, CurrentPage);
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
            FirstPageCommand = new RelayCommand<object>(p =>
            {
                _curPage = 0;
                ListAddableProduct = FiltedBooks(_curKeyword, _curPage);
                _totalItems = ListAddableProduct.Count;
                _totalPages = (_totalItems % _itemPerPage == 0 ? 0 : 1) + _totalItems / _itemPerPage;
                PageItems = _curPage;
            });
            LastPageCommand = new RelayCommand<Button>(p =>
            {
                ListAddableProduct = FiltedBooks(_curKeyword, -1);

                _totalItems = ListAddableProduct.Count;
                _totalPages = (_totalItems % _itemPerPage == 0 ? 0 : 1) + _totalItems / _itemPerPage;

                PageItems = _curPage;
            });
            PreviousPageCommand = new RelayCommand<Button>(p =>
            {
                --_curPage;
                if (_curPage < 0) { ++_curPage; return; }
                ListAddableProduct = FiltedBooks(_curKeyword, _curPage);
                PageItems = _curPage;
            });
            NextPageCommand = new RelayCommand<Button>(p =>
            {
                ++_curPage;
                if (_curPage > _totalPages - 1) { --_curPage; return; }
                ListAddableProduct = FiltedBooks(_curKeyword, _curPage);
                PageItems = _curPage;
            });
        }
    }
}
