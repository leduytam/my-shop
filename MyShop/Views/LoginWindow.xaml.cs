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

namespace MyShop.Views
{
    /// <summary>
    /// Interaction logic for LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void Login_Click(object sender, RoutedEventArgs e)
        {
            string username = Username.Text;
            string password = Password.Text;

            using (var db = new MyShopDbContext())
            {
                using (SHA512 sha512 = SHA512.Create())
                {
                    byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
                    byte[] hashBytes = sha512.ComputeHash(passwordBytes);
                    string hashString = Convert.ToBase64String(hashBytes);
                    var account = db.Accounts.FirstOrDefault(a => a.Username == username);

                    if (account != null && account.Password != null && account.Password.SequenceEqual(hashBytes))
                    {
                        MessageBox.Show("Đăng nhập thành công");
                        DashboardWindow dashboardWindow = new DashboardWindow();
                        dashboardWindow.Show();
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show("Đăng nhập không thành công");

                    }
                }
            }

        }
        private void Register_Click(object sender, RoutedEventArgs e)
        {
            RegisterWindow registerWindow = new RegisterWindow();
            registerWindow.Show();
            this.Close();
        }
    }
}
