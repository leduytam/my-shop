using MyShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using MyShop.ViewModels;

namespace MyShop.Views
{
    public partial class RegisterWindow : Window
    {
        public static RegisterWindow register;
        public RegisterWindow()
        {
            InitializeComponent();
            register = this;
        }

        private void PasswordBox_PasswordChanged(object sender, RoutedEventArgs e)
        {
            if (this.DataContext != null)
            { 
                ((RegisterViewModel)this.DataContext).Password = ((PasswordBox)sender).Password;
            }
        }

        private void RewritePasswordBox_PasswordChanged(object sender, RoutedEventArgs e)
        {
            if (this.DataContext != null)
            {
                ((RegisterViewModel)this.DataContext).RewritePassword = ((PasswordBox)sender).Password;
            }
        }
        private void Back_Login_Window(object sender, MouseButtonEventArgs e)
        {
            LoginWindow loginWindow = new LoginWindow();
            loginWindow.Show();
            this.Close();
        }
    }
}
