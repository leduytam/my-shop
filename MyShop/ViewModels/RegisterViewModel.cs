using MyShop.Models.DAL;
using MyShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using System.Security;
using System.Security.Cryptography;
using MyShop.Views;

namespace MyShop.ViewModels
{
    public class RegisterViewModel: BaseViewModel
    {
        private AccountDAO _accountDao = new AccountDAO();
        private List<Account> _accounts;

        private string _username;
        private string _password;
        private string _rewritePassword;
        private string _fullname;
        private string _email;
        private string _phone;
        private string _address;
        private bool _gender;
        DateTime? _birthDate;

        public string Username { get => _username; set { _username = value; OnPropertyChanged("Username"); } }
        public string Password { get => _password; set { _password = value; OnPropertyChanged("Password"); } }
        public string RewritePassword { get => _rewritePassword; set { _rewritePassword = value; OnPropertyChanged("RewritePassword"); } }
        public string Fullname { get => _fullname; set { _fullname = value; OnPropertyChanged("Fullname"); } }
        public string Email { get => _email; set { _email = value; OnPropertyChanged("Email"); } }
        public string PhoneNumber { get => _phone; set { _phone = value; OnPropertyChanged("PhoneNumber"); } }
        public string Address { get => _address; set { _address = value; OnPropertyChanged("Address"); } }
        public bool Gender { get => _gender; set { _gender = value; OnPropertyChanged("MaleRadio"); } }
        public DateTime? BirthDate { get => _birthDate; set { _birthDate = value; OnPropertyChanged("BirthPick"); } }

        public ICommand RegisterCommand { get; set; }
        public RegisterViewModel()
        {
            _accounts = _accountDao.GetAllAccounts();
            RegisterCommand = new RelayCommand<object>(p =>
            {
                if (!checkUsername(Username)) { return; }
                if (!checkPassword(Password)) { return; }
                if (!checkTwoPassword(Password, RewritePassword)) { return; }
                if (!IsValidAddress(Address)) { return; }
                if (BirthDate.HasValue)
                {
                    DateTime result = BirthDate.Value;
                }
                else
                {
                    MessageBox.Show("Vui lòng nhập đầy đủ thông tin đăng ký.", "Thông báo");
                    return;
                }
                if (!IsValidFullName(Fullname)) { return; }
                if (!IsValidEmail(Email)) { return; }
                if (!IsValidPhoneNumber(PhoneNumber)) { return; }

                //register
                SHA512 sha512 = SHA512.Create();
                byte[] passwordBytes = Encoding.UTF8.GetBytes(Password);
                byte[] hashBytes = sha512.ComputeHash(passwordBytes);

                var account = new Account
                {
                    Id = Guid.NewGuid(),
                    Username = Username,
                    FullName = Fullname,
                    Password = hashBytes,
                    Gender = Gender,
                    Email = Email,
                    Phone = PhoneNumber,
                    Address = Address,
                    DateOfBirth = BirthDate,
                    CreatedAt = DateTime.Now,
                    UpdatedAt = DateTime.Now,
                    IsDeleted = false
                };
                if (_accountDao.AddAccount(account))
                {
                    MessageBox.Show("Đăng ký thành công", "Thông báo");
                    LoginWindow loginWindow = new LoginWindow();
                    loginWindow.Show();
                    RegisterWindow.register.Close();
                }
                else
                {
                    MessageBox.Show("Tên đăng nhập đã tồn tại", "Thông báo");
                }

            });
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
                if (addr.Address == email || email.Length == 0)
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
