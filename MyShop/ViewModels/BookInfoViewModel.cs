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
    public class BookInfoViewModel: BaseViewModel
    {
        private Book _book;
        private BookDAO _bookDAO = new BookDAO();
        public Book Book { get => _book; set { _book = value; OnPropertyChanged("Book"); } }

        public BookInfoViewModel()
        {
            
        }
    }
}
