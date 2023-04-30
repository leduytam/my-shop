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
        private Order order;
        public OrderInfoWindow()
        {
            InitializeComponent();
        }
        public OrderInfoWindow(Order o)
        {
            InitializeComponent();
            this.order = o;
            DataContext = new OrderInfoViewModel();
            ((OrderInfoViewModel)DataContext).Order = o;
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
