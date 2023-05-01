using MyShop.Views.ContentView;
using System;
using System.Collections.Generic;
using System.Configuration;
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
            string userControl = ConfigurationManager.AppSettings["CurrentUserControl"]!;
            if (userControl.Length != 0 )
            {
                if (userControl == "Home")
                {
                    this.CurView.Content = new HomeView();
                }
                else if (userControl == "Order")
                {
                    this.CurView.Content = new OrderManagementView();
                }
                else if (userControl == "Product")
                {
                    this.CurView.Content = new ProductManagementView();
                }
                else if (userControl == "Revenue")
                {
                    this.CurView.Content = new RevenueReportView();
                }
                else if (userControl == "Statistics")
                {
                    this.CurView.Content = new StatisticsReportView();
                }
                else if (userControl == "Trending")
                {
                    this.CurView.Content = new TrendingProductView();
                }
            }
            else this.CurView.Content = new HomeView();
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
            var config = ConfigurationManager.OpenExeConfiguration(
                        ConfigurationUserLevel.None);
            config.AppSettings.Settings["CurrentUserControl"].Value = "Home";
            config.Save(ConfigurationSaveMode.Full);
            ConfigurationManager.RefreshSection("appSettings");
        }
        private void NavigateOrderManagementView(object sender, RoutedEventArgs e)
        {
            OrderManagementView homeView = new OrderManagementView();
            this.CurView.Content = homeView;
            var config = ConfigurationManager.OpenExeConfiguration(
                        ConfigurationUserLevel.None);
            config.AppSettings.Settings["CurrentUserControl"].Value = "Order";
            config.Save(ConfigurationSaveMode.Full);
            ConfigurationManager.RefreshSection("appSettings");
        }
        private void NavigateProductManagementView(object sender, RoutedEventArgs e)
        {
            ProductManagementView homeView = new ProductManagementView();
            this.CurView.Content = homeView;
            var config = ConfigurationManager.OpenExeConfiguration(
                        ConfigurationUserLevel.None);
            config.AppSettings.Settings["CurrentUserControl"].Value = "Product";
            config.Save(ConfigurationSaveMode.Full);
            ConfigurationManager.RefreshSection("appSettings");
        }
        private void NavigateRevenueReportView(object sender, RoutedEventArgs e)
        {
            RevenueReportView homeView = new RevenueReportView();
            this.CurView.Content = homeView;
            var config = ConfigurationManager.OpenExeConfiguration(
                        ConfigurationUserLevel.None);
            config.AppSettings.Settings["CurrentUserControl"].Value = "Revenue";
            config.Save(ConfigurationSaveMode.Full);
            ConfigurationManager.RefreshSection("appSettings");
        }
        private void NavigateStatisticsReport(object sender, RoutedEventArgs e)
        {
            StatisticsReportView homeView = new StatisticsReportView();
            this.CurView.Content = homeView;
            var config = ConfigurationManager.OpenExeConfiguration(
                        ConfigurationUserLevel.None);
            config.AppSettings.Settings["CurrentUserControl"].Value = "Statistics";
            config.Save(ConfigurationSaveMode.Full);
            ConfigurationManager.RefreshSection("appSettings");
        }
        private void NavigateTrendingProduct(object sender, RoutedEventArgs e)
        {
            TrendingProductView homeView = new TrendingProductView();
            this.CurView.Content = homeView;
            var config = ConfigurationManager.OpenExeConfiguration(
                        ConfigurationUserLevel.None);
            config.AppSettings.Settings["CurrentUserControl"].Value = "Trending";
            config.Save(ConfigurationSaveMode.Full);
            ConfigurationManager.RefreshSection("appSettings");
        }
    }
}
