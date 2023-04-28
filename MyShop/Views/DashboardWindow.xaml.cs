using MyShop.Views.ContentView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace MyShop.Views
{
    /// <summary>
    /// Interaction logic for DashboardWindow.xaml
    /// </summary>
    public partial class DashboardWindow : Window
    {
        public DashboardWindow()
        {
            InitializeComponent();
            HomeView homeView = new HomeView();
            this.CurView.Content = homeView;
        }

        private void Main_W_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                DragMove();
            }
        }

        private void closeW_btn(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void maxW_btn(object sender, RoutedEventArgs e)
        {
            if (this.WindowState == WindowState.Normal)
            {
                this.WindowState = WindowState.Maximized;
            }
            else this.WindowState = WindowState.Normal;
        }

        private void miniW_btn(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void SB_OnPreviewMouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            var dependencyObject = Mouse.Captured as DependencyObject;

            while (dependencyObject != null)
            {
                if (dependencyObject is ScrollBar) return;
                dependencyObject = VisualTreeHelper.GetParent(dependencyObject);
            }

            MenuToggleButton.IsChecked = false;
        }

        private void NavigateHomeView(object sender, RoutedEventArgs e)
        {
            HomeView homeView = new HomeView();
            this.CurView.Content = homeView;
        }
        private void NavigateOrderManagementView(object sender, RoutedEventArgs e)
        {
            OrderManagementView homeView = new OrderManagementView();
            this.CurView.Content = homeView;
        }
        private void NavigateProductManagementView(object sender, RoutedEventArgs e)
        {
            ProductManagementView homeView = new ProductManagementView();
            this.CurView.Content = homeView;
        }
        private void NavigateRevenueReportView(object sender, RoutedEventArgs e)
        {
            RevenueReportView homeView = new RevenueReportView();
            this.CurView.Content = homeView;
        }
        private void NavigateStatisticsReport(object sender, RoutedEventArgs e)
        {
            StatisticsReportView homeView = new StatisticsReportView();
            this.CurView.Content = homeView;
        }

        private void NavigateCustomerManagement(object sender, RoutedEventArgs e)
        {
            CustomerView customerView = new CustomerView();
            this.CurView.Content = customerView;
        }

        private void NavigateTrendingProduct(object sender, RoutedEventArgs e)
        {
            TrendingProductView homeView = new TrendingProductView();
            this.CurView.Content = homeView;
        }
    }
}
