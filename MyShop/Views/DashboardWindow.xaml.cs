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
                    ControlName.Text = "Home";
                    this.CurView.Content = new HomeView();
                }
                else if (userControl == "Order")
                {
                    ControlName.Text = "Order Management";
                    this.CurView.Content = new OrderManagementView();
                }
                else if (userControl == "Product")
                {
                    ControlName.Text = "Product Management";
                    this.CurView.Content = new ProductManagementView();
                }
                else if (userControl == "Statistics")
                {
                    ControlName.Text = "Statistics Report";
                    this.CurView.Content = new StatisticsReportView();
                }
                else if (userControl == "Trending")
                {
                    ControlName.Text = "Trending Product";
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
            ControlName.Text = "Home";
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
            ControlName.Text = "Order Management";
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
            ControlName.Text = "Product Management";
            ProductManagementView homeView = new ProductManagementView();
            this.CurView.Content = homeView;
            var config = ConfigurationManager.OpenExeConfiguration(
                        ConfigurationUserLevel.None);
            config.AppSettings.Settings["CurrentUserControl"].Value = "Product";
            config.Save(ConfigurationSaveMode.Full);
            ConfigurationManager.RefreshSection("appSettings");
        }
        private void NavigateStatisticsReport(object sender, RoutedEventArgs e)
        {
            ControlName.Text = "Statistics Report";
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
            ControlName.Text = "Trending Product";
            TrendingProductView homeView = new TrendingProductView();
            this.CurView.Content = homeView;
            var config = ConfigurationManager.OpenExeConfiguration(
                        ConfigurationUserLevel.None);
            config.AppSettings.Settings["CurrentUserControl"].Value = "Trending";
            config.Save(ConfigurationSaveMode.Full);
            ConfigurationManager.RefreshSection("appSettings");
        }

        private void logout_btn(object sender, RoutedEventArgs e)
        {
            LoginWindow loginWindow = new LoginWindow();
            this.Close();
            loginWindow.Show();
            MessageBox.Show("Logout Successful");
        }
    }
}
