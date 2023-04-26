using MyShop.Models;
using MyShop.Models.DAL;
using MyShop.Views;
using System;
using System.Collections.Generic;
using System.Configuration;
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
        private bool _rememberMe;
        private AccountDAO _accountDao = new AccountDAO();
        private List<Account> _accounts;

        public string Username { get => _username; set { _username = value; OnPropertyChanged("Username"); } }
        public string Password { get => _password; set { _password = value; OnPropertyChanged("Password"); } }
        public bool RememberMe { get => _rememberMe; set { _rememberMe = value; OnPropertyChanged("RememberMe"); } }

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
                    var config = ConfigurationManager.OpenExeConfiguration(
                        ConfigurationUserLevel.None);
                    config.AppSettings.Settings["Username"].Value = Username;

                    var passwordInBytes = Encoding.UTF8.GetBytes(p.Password);
                    var entropy = new byte[20];
                    using (var rng = RandomNumberGenerator.Create())
                    {
                        rng.GetBytes(entropy);
                    }

                    var cypherText = ProtectedData.Protect(
                        passwordInBytes,
                        entropy,
                        DataProtectionScope.CurrentUser
                    );

                    var passwordIn64 = Convert.ToBase64String(cypherText);
                    var entropyIn64 = Convert.ToBase64String(entropy);
                    config.AppSettings.Settings["Password"].Value = passwordIn64;
                    config.AppSettings.Settings["Entropy"].Value = entropyIn64;

                    config.Save(ConfigurationSaveMode.Full);
                    ConfigurationManager.RefreshSection("appSettings");

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
