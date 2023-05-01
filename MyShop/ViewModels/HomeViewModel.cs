using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Win32;
using MyShop.Models;
using MyShop.Models.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace MyShop.ViewModels
{
    public class HomeViewModel: BaseViewModel
    {
        private BookDAO bookDAO = new BookDAO();
        private List<Book> books = new List<Book>();
        private List<Book> lowQuantityBooks = new List<Book>();

        private OrderDAO orderDAO = new OrderDAO();
        private List<Order> orders = new List<Order>();

        private int _productCount;
        private int _orderWeekCount;
        private int _orderMonthCount;
        public int ProductCount { get => _productCount; set { _productCount = value; OnPropertyChanged("ProductCount"); } }
        public int OrderWeekCount { get => _orderWeekCount; set { _orderWeekCount = value; OnPropertyChanged("OrderWeekCount"); } }
        public int OrderMonthCount { get => _orderMonthCount; set { _orderMonthCount = value; OnPropertyChanged("OrderMonthCount"); } }
        public List<Book> LowQuantityBooks { get => lowQuantityBooks; set { lowQuantityBooks = value; OnPropertyChanged("LowQuantityBooks"); } }
        private string _backGroundPath = "/images/general/background.jpg";
        public string BackGroundPath
        {
            get { return _backGroundPath; }
            set
            {

                _backGroundPath = value;
                OnPropertyChanged(nameof(BackGroundPath));

            }
        }
        public ICommand BackupDatabaseCommand { get; set; }
        public ICommand RestoreDatabaseCommand { get; set; }
        public HomeViewModel() { 
            books = bookDAO.GetAllBooks();
            lowQuantityBooks = bookDAO.GetBooksWithQuantityLessThan5();

            ProductCount = books.Count;
            OrderWeekCount = orderDAO.GetOrderCountForCurrentWeek();
            OrderMonthCount = orderDAO.GetOrderCountForCurrentMonth();

            BackupDatabaseCommand = new RelayCommand<object>(p =>
            {
                try
                {
                    using (var context = new MyShopDbContext())
                    {
                        var connectionString = context.Database.GetDbConnection().ConnectionString;
                        var builder = new SqlConnectionStringBuilder(connectionString);
                        var databaseName = builder.InitialCatalog;

                        var dialog = new SaveFileDialog();
                        dialog.Filter = "Backup Files (*.bak)|*.bak";
                        dialog.FileName = $"{databaseName}_{DateTime.Now.ToString("yyyy-MM-dd_HH-mm-ss")}.bak";
                        if (dialog.ShowDialog() == true)
                        {
                            var backupPath = dialog.FileName;

                            using (var connection = new SqlConnection(connectionString))
                            {
                                connection.Open();

                                var backupQuery = $"BACKUP DATABASE [{databaseName}] TO DISK = '{backupPath}'";
                                using (var command = new SqlCommand(backupQuery, connection))
                                {
                                    command.ExecuteNonQuery();
                                }

                                connection.Close();
                            }

                            MessageBox.Show("Backup created successfully.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error creating backup: {ex.Message}");
                }
            });
            RestoreDatabaseCommand = new RelayCommand<object>(p =>
            {
                try
                {
                    using (var context = new MyShopDbContext())
                    {
                        var connectionString = context.Database.GetDbConnection().ConnectionString;
                        var builder = new SqlConnectionStringBuilder(connectionString);
                        var databaseName = builder.InitialCatalog;

                        var dialog = new OpenFileDialog();
                        dialog.Filter = "Backup Files (*.bak)|*.bak";
                        if (dialog.ShowDialog() == true)
                        {
                            var backupPath = dialog.FileName;

                            using (var connection = new SqlConnection(connectionString))
                            {
                                connection.Open();

                                var restoreQuery = $"USE master RESTORE DATABASE [{databaseName}] FROM DISK='{backupPath}' WITH REPLACE;";
                                using (var command = new SqlCommand(restoreQuery, connection))
                                {
                                    command.ExecuteNonQuery();
                                }

                                connection.Close();
                            }

                            MessageBox.Show("Backup restored successfully.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error restoring backup: {ex.Message}");
                }
            });
        }
    }
}
