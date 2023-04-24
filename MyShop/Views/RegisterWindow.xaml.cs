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
    /// <summary>
    /// Interaction logic for RegisterWindow.xaml
    /// </summary>
    public partial class RegisterWindow : Window
    {
        public RegisterWindow()
        {
            InitializeComponent();
        }

        private void Back_Login_Window(object sender, RoutedEventArgs e)
        {
            LoginWindow loginWindow = new LoginWindow();
            loginWindow.Show();
            this.Close();
        }



        private void Register_Click(object sender, RoutedEventArgs e)
        {
            string username = Username.Text;
            string password = Password.Text;
            string rewritePassword = RewritePassword.Text;
            string fullname = Fullname.Text;
            string email = Email.Text;
            string phone = PhoneNumber.Text;
            string address = Address.Text;
            bool gender = (MaleRadio.IsChecked == true);
            DateTime? birthDate = BirthPick.SelectedDate;
            
            if (!checkUsername(username)) { return; }
            if (!checkPassword(password)) { return; }
            if (!checkTwoPassword(password, rewritePassword)) { return; }
            if (!IsValidAddress(address)) { return; }
            if (birthDate.HasValue)
            {
                DateTime result = birthDate.Value;
            }
            else
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin đăng ký.", "Thông báo");
                return;
            }
            if (!IsValidFullName(fullname)) { return; }
            if (!IsValidEmail(email)) { return; }
            if (!IsValidPhoneNumber(phone)) { return; }

            AccountViewModel.register()

        }

        private void Back_Login_Window(object sender, MouseButtonEventArgs e)
        {

        }
        private bool checkUsername(string username)
        {
            if (username.Length < 6 || username.Length > 20)
            {
                MessageBox.Show("Tên người dùng cần có độ dài từ 6 đến 20 ký tự");
                return false;
            }
            if (!System.Text.RegularExpressions.Regex.IsMatch(username, "^[a-zA-Z0-9_]*$"))
            {
                MessageBox.Show("Tên người dùng chỉ có thể chứa chữ cái, chữ số và dấu gạch dưới");
                return false;
            }
            if (Char.IsDigit(username[0]))
            {
                MessageBox.Show("Tên người dùng không được bắt đầu bằng chữ số");
                return false;
            }
            return true;
        }
        private bool checkPassword(string password)
        {
            if (password.Length < 8 || password.Length > 20)
            {
                MessageBox.Show("Mật khẩu cần có độ dài từ 8 đến 20 ký tự", "Thông báo");
                return false;
            }
            return true;
        }
        private bool checkTwoPassword(string password, string rewritePassword)
        {
            if (!password.Equals(rewritePassword))
            {
                MessageBox.Show("Mật khẩu không trùng khớp", "Thông báo");
                return false;
            }
            return true;
        }
        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                if(addr.Address == email || email.Length == 0)
                {
                    return true;
                }
                else
                {
                    MessageBox.Show("Địa chỉ email không hợp lệ", "Thông báo");
                    return false;
                }
            }
            catch
            {
                MessageBox.Show("Địa chỉ email không hợp lệ", "Thông báo");
                return false;
            }
        }
        private bool IsValidFullName(string fullName)
        {
            string[] nameParts = fullName.Split(' ');
            if (nameParts.Length < 2)
            {
                MessageBox.Show("Tên đầy đủ không hợp lệ", "Thông báo");
                return false;
            }

            return true;
        }

        private bool IsValidPhoneNumber(string phoneNumber)
        {
            if (phoneNumber.Length != 10 || !IsAllDigits(phoneNumber))
            {
                MessageBox.Show("Số điện thoại không hợp lệ", "Thông báo");
                return false;
            }

            return true;
        }

        private bool IsAllDigits(string input)
        {
            foreach (char c in input)
            {
                if (!char.IsDigit(c))
                {
                    return false;
                }
            }

            return true;
        }

        private bool IsValidAddress(string address)
        {
            if (!address.Contains(" ") || !HasLetter(address))
            {
                MessageBox.Show("Địa chỉ không hợp lệ", "Thông báo");
                return false;
            }

            return true;
        }

        private bool HasLetter(string input)
        {
            foreach (char c in input)
            {
                if (char.IsLetter(c))
                {
                    return true;
                }
            }

            return false;
        }
    }
}
