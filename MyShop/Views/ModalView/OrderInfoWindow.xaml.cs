using MyShop.Models;
using MyShop.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace MyShop.Views.ModalView
{
    /// <summary>
    /// Interaction logic for OrderInfoWindow.xaml
    /// </summary>
    public partial class OrderInfoWindow : Window
    {
        public OrderInfoWindow()
        {
            InitializeComponent();
            DataContext = new OrderInfoViewModel();
            using (var db = new MyShopDbContext())
            {
                ((OrderInfoViewModel)DataContext).Order = new Order
                {
                    Id = Guid.NewGuid(),
                    Status = "pending",
                    CustomerId = db.Customers.Select(c => c.Id).FirstOrDefault(),
                    RecipientName = string.Empty,
                    RecipientAddress = string.Empty,
                    RecipientPhone = string.Empty,
                    CreatedAt = DateTime.UtcNow,
                    UpdatedAt = DateTime.UtcNow,
                    Customer = null,
                    OrderItems = new List<OrderItem>()
                };
                ((OrderInfoViewModel)DataContext).isAdd = true;
            }
        }
        public OrderInfoWindow(Order o)
        {
            InitializeComponent();
            DataContext = new OrderInfoViewModel();
            ((OrderInfoViewModel)DataContext).Order = o;
            ((OrderInfoViewModel)DataContext).isAdd = false;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            double currentWidth = Width;

            Width = currentWidth + 1;
            Width = currentWidth;

        }
        private void Button_Click1(object sender, RoutedEventArgs e)
        {
            //this.Close();
            //Thread.Sleep(500);
            //// Open a new window
            //OrderInfoWindow newWindow = new OrderInfoWindow(order);
            //newWindow.Show();
            double currentWidth = Width;

            Width = currentWidth + 1;
            Width = currentWidth;
        }
    }
}
