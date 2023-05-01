using LiveCharts;
using LiveCharts.Wpf;
using Microsoft.EntityFrameworkCore;
using MyShop.Models;
using MyShop.Models.DAL;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace MyShop.ViewModels
{
    public class StastisticsReportViewModel : BaseViewModel
    {
        private OrderDAO? _orderDAO = new OrderDAO();
        private BookDAO? _bookDAO = new BookDAO();

        public Func<double, string> Values { get; set; }
        public List<string>? Dates { get; set; }
        public SeriesCollection SeriesCollection { get; set; }
        public List<string>? Dates1 { get; set; }
        public SeriesCollection SeriesCollection1 { get; set; }
        public List<string>? Dates2 { get; set; }
        public SeriesCollection Collection4 { get; set; }
        public List<string>? Dates4 { get; set; }
        public SeriesCollection SeriesCollection2 { get; set; }

        private SeriesCollection _chartSeries;
        private SeriesCollection _chartSeries1;
        private SeriesCollection _chartSeries2;
        private SeriesCollection _chartSeries3;
        public SeriesCollection CollectionFromTo {
            get => _chartSeries;
            set => SetProperty(ref _chartSeries, value);
        }
        public List<string>? DatesFromTo { get; set; }
        public SeriesCollection CollectionWeek
        {
            get => _chartSeries1;
            set => SetProperty(ref _chartSeries1, value);
        }
        public List<string>? DatesWeek { get; set; }
        public SeriesCollection CollectionMonth
        {
            get => _chartSeries2;
            set => SetProperty(ref _chartSeries2, value);
        }
        public List<string>? DatesMonth{ get; set; }
        public SeriesCollection CollectionYear
        {
            get => _chartSeries3;
            set => SetProperty(ref _chartSeries3, value);
        }
        public List<string>? DatesYear { get; set; }
        public List<Book>? Books { get; set; }
        private List<string> _items;
        public List<string> Items
        {
            get => _items;
            set => SetProperty(ref _items, value);
        }

        private string _selectedItem;
        public string SelectedItem
        {
            get => _selectedItem;
            set => SetProperty(ref _selectedItem, value);
        }
        public StastisticsReportViewModel()
        {
            // 7 days revenue
            List<double> revenueList = _orderDAO.GetRevenueLast7Days();
            SeriesCollection = new SeriesCollection()
            {
                new ColumnSeries
                {
                    Title = "Revenue for 7 days",
                    Values = new ChartValues<double>(revenueList)
                }
            };
            Dates = new List<string>();
            for (int i = 6; i >= 0; i--)
            {
                Dates.Add(DateTime.UtcNow.AddDays(-i).ToString("MM-dd"));
            }

            // from to revenue

            revenueList = _orderDAO.GetRevenueFromTo();
            SeriesCollection1 = new SeriesCollection()
            {
                new ColumnSeries
                {
                    Title = "Revenue from 11-4-2023 to 30-4-2023",
                    Values = new ChartValues<double>(revenueList)
                }
            };
            Dates1 = new List<string>();
            for (int i = 19; i >= 0; i--)
            {
                Dates1.Add(DateTime.UtcNow.AddDays(-i).ToString("MM-dd"));
            }
            //Month 4 revenue
            revenueList = _orderDAO.GetRevenueMonth4();
            Collection4 = new SeriesCollection()
            {
                new ColumnSeries
                {
                    Title = "Revenue month 4",
                    Values = new ChartValues<double>(revenueList)
                }
            };
            Dates4 = new List<string>();
            for (int i = 30; i >= 0; i--)
            {
                Dates1.Add(DateTime.UtcNow.AddDays(-i).ToString("MM-dd"));
            }
            //last year revenue
            revenueList = _orderDAO.GetRevenueLastYear();
            SeriesCollection2 = new SeriesCollection()
            {
                new ColumnSeries
                {
                    Title = "Revenue for last year",
                    Values = new ChartValues<double>(revenueList)
                }
            };
            Dates2 = new List<string>();
            for (int i = 11; i >= 0; i--)
            {
                Dates2.Add(DateTime.UtcNow.AddMonths(-i).ToString("MM-yyyy"));
            }

            Values = value => value.ToString("C");

            // Get all books
            Books= new List<Book>();
            Books = _bookDAO.GetAllBooks();
            List<String> BookName= new List<String>();
            for(int i=0;i<Books.Count;i++)
            {
                BookName.Add(Books[i].Name);
            }
            Items = new List<string>();
            Items.AddRange(BookName);
        }
        public void OnItemSelected()
        {
            //Console.WriteLine("Da chay");
            // Implement the desired action here.
            // For example, you could show a message box with the selected item:
            //MessageBox.Show($"Selected item: {SelectedItem}");
            DatesFromTo = new List<string>();
            List <int> numberOfBook = new List<int>();
            var fromDate = new DateTime(2023, 4, 11);
            var toDate = new DateTime(2023, 4, 30);

            //From 11-4-2023 to 30-04-2023
            numberOfBook =_orderDAO.GetBookSalesByDay(SelectedItem, fromDate, toDate);
            CollectionFromTo = new SeriesCollection()
            {
                new ColumnSeries    
                {
                    Title = "Number of book sold from 11-4-2023 to 30-4-2023",
                    Values = new ChartValues<int>(numberOfBook)
                }
            };
            for (int i = 19; i >= 0; i--)
            {
                DatesFromTo.Add(DateTime.UtcNow.AddDays(-i).ToString("MM-dd"));
            }

            //Week
            DatesWeek = new List<string>();
            
            DateTime endDateWeek = DateTime.UtcNow.Date; // Get the current UTC date
            DateTime startDateWeek = endDateWeek.AddDays(-7);
            numberOfBook = _orderDAO.GetBookSalesByDay(SelectedItem, startDateWeek, endDateWeek);
            CollectionWeek = new SeriesCollection()
            {
                new ColumnSeries
                {
                    Title = "Revenue for 7 days",
                    Values = new ChartValues<int>(numberOfBook)
                }
            };
            for (int i = 6; i >= 0; i--)
            {
                DatesWeek.Add(DateTime.UtcNow.AddDays(-i).ToString("MM-dd"));
            }

            //Month
            DatesMonth = new List<string>();
            
            DateTime endDateMonth = new DateTime(2023, 4, 30);
            DateTime startDateMonth = new DateTime(2023, 4, 1);
            numberOfBook = _orderDAO.GetBookSalesByDay(SelectedItem, startDateMonth, endDateMonth);
            CollectionMonth = new SeriesCollection()
            {
                new ColumnSeries
                {
                    Title = "Revenue for month 4",
                    Values = new ChartValues<int>(numberOfBook)
                }
            };
            for (int i = 30; i >= 0; i--)
            {
                DatesMonth.Add(DateTime.UtcNow.AddDays(-i).ToString("MM-dd"));
            }
            //Year
            DatesYear = new List<string>();
            DateTime endDateYear = DateTime.UtcNow.Date; // Get the current UTC date
            DateTime startDateYear = endDateYear.AddYears(-1).AddDays(1); // Calculate the start date 1 year ago
            numberOfBook = _orderDAO.GetBookSalesByDay(SelectedItem, startDateYear, endDateYear);
            CollectionYear = new SeriesCollection()
            {
                new ColumnSeries
                {
                    Title = "Revenue for last year",
                    Values = new ChartValues<int>(numberOfBook)
                }
            };
            for (int i = 11; i >= 0; i--)
            {
                DatesYear.Add(DateTime.UtcNow.AddMonths(-i).ToString("MM-yyyy"));
            }
            //Values = value => value.ToString("C");
        }
    }
}
