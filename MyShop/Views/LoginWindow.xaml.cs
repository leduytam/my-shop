using System;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Windows;

namespace MyShop.Views
{
    public partial class LoginWindow : Window
    {
        public static LoginWindow login;
        public LoginWindow()
        {
            InitializeComponent();
            login = this;
        }
        private void Register_Click(object sender, RoutedEventArgs e)
        {
            RegisterWindow registerWindow = new RegisterWindow();
            registerWindow.Show();
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            string username = ConfigurationManager.AppSettings["Username"]!;
            string passwordIn64 = ConfigurationManager.AppSettings["Password"]!;
            string entropyIn64 = ConfigurationManager.AppSettings["Entropy"]!;
            if (passwordIn64.Length != 0)
            {
                byte[] entropyInBytes = Convert.FromBase64String(entropyIn64);
                byte[] cypherTextInBytes = Convert.FromBase64String(passwordIn64);
                byte[] passwordInBytes = ProtectedData.Unprotect(cypherTextInBytes,
                    entropyInBytes,
                    DataProtectionScope.CurrentUser
                );

                string password = Encoding.UTF8.GetString(passwordInBytes);

                Username.Text = username;
                Password.Password = password;
                RememberMe.IsChecked = true;
            }
        }
    }
}
