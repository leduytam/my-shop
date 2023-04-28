using LiveCharts;
using LiveCharts.Wpf;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MyShop.Models.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
            TrendingBookDay = new SeriesCollection
            {
                new PieSeries
                {
                    Title = books[0].Item1,
                    Values = new ChartValues<int> { books[0].Item2 }
                },
                new PieSeries
                {
                    Title = books[1].Item1,
                    Values = new ChartValues<int> { books[1].Item2 }
                },
                new PieSeries
                {
                    Title = books[2].Item1,
                    Values = new ChartValues<int> { books[2].Item2 }
                },
                new PieSeries
                {
                    Title = books[3].Item1,
                    Values = new ChartValues<int> { books[3].Item2 }
                },
                new PieSeries
                {
                    Title = books[4].Item1,
                    Values = new ChartValues<int> { books[4].Item2 }
                }
            };
            books = _bookDAO.GetTop5BooksCurrentMonth();
            TrendingBookMonth = new SeriesCollection
            {
                new PieSeries
                {
                    Title = books[0].Item1,
                    Values = new ChartValues<int> { books[0].Item2 }
                },
                new PieSeries
                {
                    Title = books[1].Item1,
                    Values = new ChartValues<int> { books[1].Item2 }
                },
                new PieSeries
                {
                    Title = books[2].Item1,
                    Values = new ChartValues<int> { books[2].Item2 }
                },
                new PieSeries
                {
                    Title = books[3].Item1,
                    Values = new ChartValues<int> { books[3].Item2 }
                },
                new PieSeries
                {
                    Title = books[4].Item1,
                    Values = new ChartValues<int> { books[4].Item2 }
                }
            };
            books = _bookDAO.GetTop5BooksInCurrentYear();
            TrendingBookYear = new SeriesCollection
            {
                new PieSeries
                {
                    Title = books[0].Item1,
                    Values = new ChartValues<int> { books[0].Item2 }
                },
                new PieSeries
                {
                    Title = books[1].Item1,
                    Values = new ChartValues<int> { books[1].Item2 }
                },
                new PieSeries
                {
                    Title = books[2].Item1,
                    Values = new ChartValues<int> { books[2].Item2 }
                },
                new PieSeries
                {
                    Title = books[3].Item1,
                    Values = new ChartValues<int> { books[3].Item2 }
                },
                new PieSeries
                {
                    Title = books[4].Item1,
                    Values = new ChartValues<int> { books[4].Item2 }
                }
            };
        }
    }
}
