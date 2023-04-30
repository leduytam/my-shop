using LiveCharts;
using LiveCharts.Wpf;
using Microsoft.EntityFrameworkCore;
using MyShop.Models;
using MyShop.Models.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace MyShop.ViewModels
{
    public class StastisticsReportViewModel : BaseViewModel
    {
        private OrderDAO? _orderDAO = new OrderDAO();
        public Func<double, string> Values { get; set; }
        public List<string>? Dates { get; set; }
        public SeriesCollection SeriesCollection { get; set; }
        public List<string>? Dates1 { get; set; }
        public SeriesCollection SeriesCollection1 { get; set; }
        public List<string>? Dates2 { get; set; }
        public SeriesCollection Collection4 { get; set; }
        public List<string>? Dates4 { get; set; }
        public SeriesCollection SeriesCollection2 { get; set; }
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


        }
    }
}
