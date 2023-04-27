using ExcelDataReader;
using Microsoft.Win32;
using MyShop.Models;
using MyShop.Models.DAL;
using MyShop.Ultils;
using MyShop.Views.ModalView;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using static System.Reflection.Metadata.BlobBuilder;

namespace MyShop.ViewModels
{
    public class ProductManagementViewModel : BaseViewModel
    {
        private BookDAO _bookDao = new BookDAO();
        private GenreDAO _genreDao = new GenreDAO();
        private List<string> _gerneList = new List<string>();
        private int _curPage = 0;
        private int _totalItems = 0;
        private int _totalPages = 0;
        private int _itemPerPage = 6;
        private string _curKeyword = "";
        private string _genre = "";
        private decimal _curPrice = 0;
        private int _maximumPrice = 500000;

        public List<Book> books = new List<Book>();
        public List<Book> showBooks = new List<Book>();
        public List<Book> ListProduct { get => showBooks; set { showBooks = value; OnPropertyChanged("ListProduct"); } }
        public List<string> GenreList { get => _gerneList; set { _gerneList = value; OnPropertyChanged("GenreList"); } }
        public int MaximumPrice { get => _maximumPrice; set { _maximumPrice = value; OnPropertyChanged("MaximumPrice"); } }
        public string SelectedGenre
        {
            get => _genre;
            set
            {
                _curPage = 0;
                PageItems = _curPage;
                _genre = value;
                OnPropertyChanged("SelectedGenre");
                ListProduct = FiltedBooks(Keyword, _curPage, value, _curPrice);
            }
        }
        public string Keyword
        {
            get => _curKeyword;
            set
            {
                _curPage = 0;
                PageItems = _curPage;
                _curKeyword = value;
                OnPropertyChanged("Keyword");
                ListProduct = FiltedBooks(value, _curPage, _genre, _curPrice);
            }
        }
        public decimal SliderValue
        {
            get => _curPrice;
            set
            {
                _curPage = 0;
                PageItems = _curPage;
                _curPrice = value;
                OnPropertyChanged("Keyword");
                ListProduct = FiltedBooks(_curKeyword, _curPage, _genre, value);
            }
        }
        private int _selectedIndex;
        public int SelectedIndex
        {
            get => _selectedIndex;
            set
            {
                _selectedIndex = value;
                OnPropertyChanged(nameof(SelectedIndex));
            }
        }
        public int PageItems { get => _curPage; set { _curPage = value; OnPropertyChanged("PageItems"); } }

        public ICommand FirstPageCommand { get; set; }
        public ICommand LastPageCommand { get; set; }
        public ICommand PreviousPageCommand { get; set; }
        public ICommand NextPageCommand { get; set; }
        public ICommand ImportGenreCommand { get; set; }
        public ICommand ImportBookCommand { get; set; }
        public ICommand ShowListGenre { get; set; }
        public ICommand SelectCommand { get; set; }
        public ICommand DeleteCommand { get;set; }
        public List<Book> FiltedBooks(string keyword, int currentPage, string genre, decimal maxPrice)
        {
            IEnumerable<Book> list;
            List<Book> listBooksGenre = new List<Book>();

            if (currentPage >= 0)
            {
                listBooksGenre = _bookDao.GetBooksByGenre(genre);
                list = listBooksGenre.Where(
                        item => item.Name.Contains(keyword))
                    .Where(item => item.Price <= maxPrice)
                    .Where(item => item.IsDeleted == false);
                _totalPages = (list.Count() % _itemPerPage == 0 ? 0 : 1) + list.Count() / _itemPerPage;
                list = list.Skip(currentPage * _itemPerPage).Take(_itemPerPage);
                return list.ToList();
            }
            else
            {
                listBooksGenre = _bookDao.GetBooksByGenre(genre);
                list = listBooksGenre.Where(
                        item => item.Name.Contains(keyword))
                    .Where(item => item.Price <= maxPrice)
                    .Where(item => item.IsDeleted == false);
                int lastPage = (list.Count() % _itemPerPage == 0 ? 0 : 1) + list.Count() / _itemPerPage;
                list = list.Skip((lastPage - 1) * _itemPerPage).Take(_itemPerPage);
                _curPage = lastPage;
                _totalPages = lastPage;
                return list.ToList();
            }
        }
        public ProductManagementViewModel()
        {
            _curPrice = MaximumPrice;
            _gerneList = _genreDao.GetGenreNames();
            GenreList.Insert(0, "All");
            books = _bookDao.GetAllBooks();
            showBooks = books.Take(_itemPerPage).ToList();
            _totalItems = books.Count;
            _totalPages = (_totalItems % _itemPerPage == 0 ? 0 : 1) + _totalItems / _itemPerPage;
            FirstPageCommand = new RelayCommand<object>(p =>
            {
                _curPage = 0;
                ListProduct = FiltedBooks(_curKeyword, _curPage, _genre, _curPrice);
                _totalItems = ListProduct.Count;
                _totalPages = (_totalItems % _itemPerPage == 0 ? 0 : 1) + _totalItems / _itemPerPage;
                PageItems = _curPage;
            });
            LastPageCommand = new RelayCommand<Button>(p =>
            {
                ListProduct = FiltedBooks(_curKeyword, -1, _genre, _curPrice);

                _totalItems = ListProduct.Count;
                _totalPages = (_totalItems % _itemPerPage == 0 ? 0 : 1) + _totalItems / _itemPerPage;

                PageItems = _curPage;
            });
            PreviousPageCommand = new RelayCommand<Button>(p =>
            {
                --_curPage;
                if (_curPage < 0) { ++_curPage;  return; }

                ListProduct = FiltedBooks(_curKeyword, _curPage, _genre, _curPrice);
                PageItems = _curPage;
            });
            NextPageCommand = new RelayCommand<Button>(p =>
            {
                ++_curPage;
                if (_curPage > _totalPages - 1) { --_curPage; return; }
                ListProduct = FiltedBooks(_curKeyword, _curPage, _genre, _curPrice);
                PageItems = _curPage;
            });
            ImportGenreCommand = new RelayCommand<Button>(p =>
            {
                var openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "Excel Files (*.xlsx, *.xls)|*.xlsx;*.xls";
                openFileDialog.FilterIndex = 0;
                openFileDialog.Multiselect = false;

                bool? result = openFileDialog.ShowDialog();
                if (result == true)
                {
                    string filePath = openFileDialog.FileName;
                    _genreDao.ImportGenresFromExcel(filePath);
                }

            });
            ImportBookCommand = new RelayCommand<Button>(p =>
            {
                var openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "Excel Files (*.xlsx, *.xls)|*.xlsx;*.xls";
                openFileDialog.FilterIndex = 0;
                openFileDialog.Multiselect = false;

                bool? result = openFileDialog.ShowDialog();
                if (result == true)
                {
                    string filePath = openFileDialog.FileName;
                    _bookDao.ImportBooksFromExcel(filePath);
                }
            });
            ShowListGenre = new RelayCommand<object>(p =>
            {
                ListGenreWindow listGenreWindow = new ListGenreWindow();
                listGenreWindow.ShowDialog();
            });
            SelectCommand = new RelayCommand<Book>(book =>
            {
                if (book != null)
                {
                    BookInfoWindow bookInfoWindow = new BookInfoWindow(book);
                    bookInfoWindow.ShowDialog();
                }
            });
            DeleteCommand = new RelayCommand<Book>(book =>
            {
                books.RemoveAll(item => item.Id == book.Id);
                _bookDao.DeleteBook(book.Id);
                MessageBox.Show($"{book.Name} was deleted");
                _curPage = 0;
                ListProduct = FiltedBooks(_curKeyword, _curPage, _genre, _curPrice);
                PageItems = _curPage;
            });
        }
    }
}
