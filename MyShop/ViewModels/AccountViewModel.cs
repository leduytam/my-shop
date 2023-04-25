using MyShop.Models;
using MyShop.Models.DAL;
using MyShop.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace MyShop.ViewModels
{
    public class AccountViewModel : BaseViewModel
    {
        private string _username;
        private string _password;
        private AccountDAO _accountDao = new AccountDAO();
        private List<Account> _accounts;

        public string Username { get => _username; set { _username = value; OnPropertyChanged("Username"); } }
        public string Password { get => _password; set { _password = value; OnPropertyChanged("Password"); } }

        public ICommand LoginCommand { get; set; }

        public AccountViewModel()
        {
            _accounts = _accountDao.GetAllAccounts();
            LoginCommand = new RelayCommand<PasswordBox>(p =>
            {
                SHA512 sha512 = SHA512.Create();
                byte[] passwordBytes = Encoding.UTF8.GetBytes(p.Password);
                byte[] hashBytes = sha512.ComputeHash(passwordBytes);
                string hashString = Convert.ToBase64String(hashBytes);

                var account = _accounts.FirstOrDefault(a => a.Username == Username);

                if (account != null && account.Password.SequenceEqual(hashBytes))
                {
                    MessageBox.Show("Đăng nhập thành công");
                    DashboardWindow dashboardWindow = new DashboardWindow();
                    dashboardWindow.Show();
                    LoginWindow.login.Close();
                }
                else
                {
                    MessageBox.Show("Đăng nhập không thành công");
                }
            });
        }
    }
}
