﻿using LiveCharts;
using LiveCharts.Wpf;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MyShop.Models.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace MyShop.ViewModels
{
    class TrendingProductViewModel : BaseViewModel
    {
        private BookDAO _bookDAO = new BookDAO();
        private List<(string, int)> books = new List<(string, int)>();
        public SeriesCollection TrendingBookDay { get; set; }
        public SeriesCollection TrendingBookMonth { get; set; }
        public SeriesCollection TrendingBookYear { get; set; }
        public TrendingProductViewModel()
        {
            books = _bookDAO.GetTop5BooksInCurrentDay();
            TrendingBookDay = new SeriesCollection();
            for(int i = 0;i < books.Count; i++)
            {
                var book = books[i];
                TrendingBookDay.Add(new PieSeries { Title = books[i].Item1, Values = new ChartValues<int> { books[i].Item2 } });
            }
            books = _bookDAO.GetTop5BooksCurrentMonth();
            TrendingBookMonth = new SeriesCollection();
            for (int i = 0; i < books.Count; i++)
            {
                var book = books[i];
                TrendingBookMonth.Add(new PieSeries { Title = books[i].Item1, Values = new ChartValues<int> { books[i].Item2 } });
            }
            books = _bookDAO.GetTop5BooksInCurrentYear();
            TrendingBookYear = new SeriesCollection();
            for (int i = 0; i < books.Count; i++)
            {
                var book = books[i];
                TrendingBookYear.Add(new PieSeries { Title = books[i].Item1, Values = new ChartValues<int> { books[i].Item2 } });
            }
        }
    }
}
