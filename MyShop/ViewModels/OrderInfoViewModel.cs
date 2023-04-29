using Microsoft.EntityFrameworkCore;
using MyShop.Models;
using MyShop.Models.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace MyShop.ViewModels
{
    internal class OrderInfoViewModel : BaseViewModel
    {
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
                GetBookNameAndQuantity(value.Id);
                TotalPrice = _orderDAO.TotalPrice(value.Id);
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
        private List<BookNameQuantity> _listProduct = new List<BookNameQuantity>();
        public List<BookNameQuantity> ListProduct {
            get => _listProduct;
            set
            {
                _listProduct = value;
                OnPropertyChanged("ListProduct");
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
            });
            DeleteCommand = new RelayCommand<BookNameQuantity>(p =>
            {
                _orderDAO.DeleteOrderItem(Order.Id, p.BookId);
                Order.UpdatedAt = DateTime.Now;
                _orderDAO.UpdateOrder(Order);
                ListProduct.RemoveAll(item => item.BookId == p.BookId);
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
                    OnPropertyChanged("ListProduct");
                    MessageBox.Show("Decrease successful");
                }
                else
                {
                    MessageBox.Show("The minimum quantity of an item is 1.");
                }
                OnPropertyChanged("Order");
            });
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
        public ICommand SaveCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand IncreaseCommand { get; set; }
        public ICommand DecreaseCommand { get; set; }
        public class BookNameQuantity
        {
            public Guid BookId { get; set; }
            public string BookName { get; set;}
            public int Quantity { get; set;}

            public BookNameQuantity(Guid bookId, string bookName, int quantity)
            {
                this.BookId = bookId;
                BookName = bookName;
                Quantity = quantity;
            }
        }
    }
}
