using MyShop.Models;
using MyShop.Models.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.ViewModels
{
    public class HomeViewModel: BaseViewModel
    {
        private BookDAO bookDAO = new BookDAO();
        private List<Book> books = new List<Book>();
        private List<Book> lowQuantityBooks = new List<Book>();

        private OrderDAO orderDAO = new OrderDAO();
        private List<Order> orders = new List<Order>();

        private int _productCount;
        private int _orderWeekCount;
        private int _orderMonthCount;
        public int ProductCount { get => _productCount; set { _productCount = value; OnPropertyChanged("ProductCount"); } }
        public int OrderWeekCount { get => _orderWeekCount; set { _orderWeekCount = value; OnPropertyChanged("OrderWeekCount"); } }
        public int OrderMonthCount { get => _orderMonthCount; set { _orderMonthCount = value; OnPropertyChanged("OrderMonthCount"); } }
        public List<Book> LowQuantityBooks { get => lowQuantityBooks; set { lowQuantityBooks = value; OnPropertyChanged("LowQuantityBooks"); } }
        private string _backGroundPath = "/images/general/background.jpg";
        public string BackGroundPath
        {
            get { return _backGroundPath; }
            set
            {

                _backGroundPath = value;
                OnPropertyChanged(nameof(BackGroundPath));

            }
        }
        public HomeViewModel() { 
            books = bookDAO.GetAllBooks();
            lowQuantityBooks = bookDAO.GetBooksWithQuantityLessThan5();

            ProductCount = books.Count;
            OrderWeekCount = orderDAO.GetOrderCountForCurrentWeek();
            OrderMonthCount = orderDAO.GetOrderCountForCurrentMonth();


        }
    }
}
