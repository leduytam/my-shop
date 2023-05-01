using MyShop.Models;
using MyShop.Models.DAL;
using MyShop.Views.ModalView;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Documents;
using System.Windows.Input;
using static System.Reflection.Metadata.BlobBuilder;

namespace MyShop.ViewModels
{
    public class OrderManagementViewModel : BaseViewModel
    {
        private OrderDAO _orderDAO = new OrderDAO();
        private int _curPage = 0;
        private ObservableCollection<Order> _showOrder = new ObservableCollection<Order>();
        private int _totalPages = 0;
        private int _totalItems = 0;
        private DateTime _fromDate = DateTime.Now.AddYears(-1);
        private DateTime _toDate = DateTime.Now;
        private int _itemPerPage = 5;

        public int ItemPerPage
        {
            get { return _itemPerPage; }
            set
            {
                _itemPerPage = value;
                OnPropertyChanged(nameof(ItemPerPage));
                ListOrder = FilterOrder(_curPage, FromDate, ToDate);
            }
        }
        public List<int> PageSizes { get; } = new List<int> { 5, 10, 15, 20 };
        public ObservableCollection<Order> ListOrder { get => _showOrder; set { _showOrder = value; OnPropertyChanged("ListOrder"); } }
        public int CurrentPage
        {
            get => _curPage; set
            {
                _curPage = value;
                OnPropertyChanged("CurrentPage");
            }
        }
        public DateTime FromDate
        {
            get => _fromDate; set
            {
                _fromDate = value;
                OnPropertyChanged("FromDate");
                ListOrder = FilterOrder(_curPage, FromDate, ToDate);
            }
        }
        public DateTime ToDate
        {
            get => _toDate; set
            {
                _toDate = value;
                OnPropertyChanged("ToDate");
                ListOrder = FilterOrder(_curPage, FromDate, ToDate);
            }
        }
        public ICommand SelectCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand CreateNewOrder { get; set; }
        public ICommand PreviousPageCommand { get; set; }
        public ICommand NextPageCommand { get; set; }
        public ICommand AddOrderCommand { get; set; }
        public ObservableCollection<Order> FilterOrder(int curPage, DateTime fromDate, DateTime toDate)
        {
            int perPage = _itemPerPage;
            int startIndex = curPage * perPage;
            using (var context = new MyShopDbContext())
            {
                IEnumerable<Order> orders = context.Orders
                    .Where(o => o.CreatedAt >= fromDate && o.CreatedAt <= toDate)
                    .OrderByDescending(o => o.CreatedAt);
                _totalPages = (orders.Count() % _itemPerPage == 0 ? 0 : 1) + orders.Count() / _itemPerPage;
                orders = orders.Skip(startIndex).Take(perPage);
                return new ObservableCollection<Order>(orders);
            }
        }
        public OrderManagementViewModel()
        {
            _totalItems = _orderDAO.GetAllOrders().Count;
            _totalPages = (_totalItems % _itemPerPage == 0 ? 0 : 1) + _totalItems / _itemPerPage;
            _showOrder = FilterOrder(_curPage, FromDate, ToDate);
            NextPageCommand = new RelayCommand<object>(p =>
            {
                _curPage++;
                if (_curPage > _totalPages - 1) { --_curPage; return; }
                ListOrder = FilterOrder(_curPage, FromDate, ToDate);
                CurrentPage = _curPage;
            });
            PreviousPageCommand = new RelayCommand<object>(p =>
            {
                _curPage--;
                if (CurrentPage >= 0)
                {
                    ListOrder = FilterOrder(_curPage, FromDate, ToDate);
                    CurrentPage = _curPage;
                }
                else
                {
                    _curPage++;
                }
            });
            SelectCommand = new RelayCommand<Order>(order =>
            {
                if (order != null)
                {
                    OrderInfoWindow orderInfoWindow = new OrderInfoWindow(order);
                    orderInfoWindow.ShowDialog();
                }
            });
            AddOrderCommand = new RelayCommand<object>(p =>
            {

                OrderInfoWindow orderInfoWindow = new OrderInfoWindow();
                orderInfoWindow.ShowDialog();

            });
            DeleteCommand = new RelayCommand<Order>(p =>
            {

                _orderDAO.DeleteOrder(p.Id);
                _curPage = 0;
                ListOrder = FilterOrder(_curPage, FromDate, ToDate);
                CurrentPage = _curPage;
                MessageBox.Show("Delete success");

            });
        }
    }
}
