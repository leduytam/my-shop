using Microsoft.EntityFrameworkCore;
using Microsoft.Win32;
using MyShop.Models;
using MyShop.Models.DAL;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media.Imaging;

namespace MyShop.ViewModels
{
    public class BookInfoViewModel : BaseViewModel
    {
        private Book _book;
        private BookDAO _bookDAO = new BookDAO();
        private bool isSave = true;
        public Book Book { get => _book; set { 
                _book = value; 
                GetListBookGenre(); 
                GetListAddedBookGenre();
                _bookDAO.AddBook(Book);
                OnPropertyChanged("Book"); } }
        public bool IsAdd { get; set; }
        public FileInfo _selectedImage = null;
        private bool IsBrowse = false;
        private string _name { get; set; }

        private string _description { get; set; }

        private string _isbn { get; set; }

        private decimal _price { get; set; }

        private decimal _originalPrice { get; set; }

        private byte _discount { get; set; }

        private int _quantity { get; set; }

        private short _publicationYear { get; set; }

        private string _author { get; set; }

        private string _publisher { get; set; }
        private string _updatedAt { get; set; }
        public string Name { get => _name; set { _name = value; OnPropertyChanged("Name"); } }

        public string Description { get => _description; set { _description = value; OnPropertyChanged("Description"); } }

        public string Isbn { get => _isbn; set { _isbn = value; OnPropertyChanged("Isbn"); } }

        public decimal Price { get => _price; set { _price = value; OnPropertyChanged("Price"); } }

        public decimal OriginalPrice { get => _originalPrice; set { _originalPrice = value; OnPropertyChanged("OriginalPrice"); } }

        public byte Discount { get => _discount; set { _discount = value; OnPropertyChanged("Discount"); } }

        public int Quantity { get => _quantity; set { _quantity = value; OnPropertyChanged("Quantity"); } }

        public short PublicationYear { get => _publicationYear; set { _publicationYear = value; OnPropertyChanged("PublicationYear"); } }

        public string Author { get => _author; set { _author = value; OnPropertyChanged("Author"); } }

        public string Publisher { get => _publisher; set { _publisher = value; OnPropertyChanged("Publisher"); } }
        public string UpdatedAt { get => _updatedAt; set { _updatedAt = value; OnPropertyChanged("UpdatedAt"); } }

        public ICommand BrowseImageCommand { get; set; }
        public ICommand SaveCommand { get; set; }
        public ICommand DeleteGenreCommand { get; set; }
        public ICommand AddGenreCommand { get; set; }
        public ICommand CloseCommand { get; set; }

        private ObservableCollection<BookGenre> _listGenre = new ObservableCollection<BookGenre>();
        public ObservableCollection<BookGenre> ListGenre
        {
            get => _listGenre;
            set
            {
                _listGenre = value;
                OnPropertyChanged("ListGenre");
            }
        }

        private ObservableCollection<BookGenre> _listAddableGenre = new ObservableCollection<BookGenre>();
        public ObservableCollection<BookGenre> ListAddableGenre
        {
            get => _listAddableGenre;
            set
            {
                _listAddableGenre = value;
                OnPropertyChanged("ListAddableGenre");
            }
        }

        public class BookGenre : INotifyPropertyChanged
        {

            private Guid _genreId;
            public Guid GenreId
            {
                get { return _genreId; }
                set { _genreId = value; }
            }
            private string _genreName;
            public string GenreName
            {
                get { return _genreName; }
                set { _genreName = value; OnPropertyChanged(nameof(GenreName)); }
            }
            public event PropertyChangedEventHandler PropertyChanged;

            protected void OnPropertyChanged(string propertyName)
            {
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
            }
        }
        public void GetListBookGenre()
        {

            ListGenre.Clear();

            using (MyShopDbContext db = new MyShopDbContext())
            {
                var bookGenres = db.Books
                .Where(b => b.Id == Book.Id)
                .SelectMany(b => b.Genres)
                .ToList();

                foreach (var genre in bookGenres)
                {
                    ListGenre.Add(new BookGenre { GenreName = genre.Name, GenreId = genre.Id });
                }
            }
            OnPropertyChanged(nameof(ListGenre));
        }

        public void GetListAddedBookGenre()
        {

            ListAddableGenre.Clear();

            using (MyShopDbContext db = new MyShopDbContext())
            {
                var assignedGenres = db.Books
                    .Where(b => b.Id == Book.Id)
                    .SelectMany(b => b.Genres)
                    .Select(g => g.Id)
                    .ToList();

                var unassignedGenres = db.Genres
                    .Where(g => !assignedGenres.Contains(g.Id))
                    .ToList();

                foreach (var genre in unassignedGenres)
                {
                    ListAddableGenre.Add(new BookGenre { GenreName = genre.Name, GenreId = genre.Id });
                }
            }
            OnPropertyChanged(nameof(ListAddableGenre));
        }

        public BookInfoViewModel()
        {
            BrowseImageCommand = new RelayCommand<Image>(p =>
            {
                var openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "Image Files (*.png, *.jpg)|*.png;*.jpg";
                openFileDialog.FilterIndex = 0;
                openFileDialog.Multiselect = false;

                bool? result = openFileDialog.ShowDialog();
                if (result == true)
                {
                    string filePath = openFileDialog.FileName;
                    _selectedImage = new FileInfo(openFileDialog.FileName);
                    var bitmap = new BitmapImage();
                    bitmap.BeginInit();
                    bitmap.UriSource = new Uri(openFileDialog.FileName, UriKind.Absolute);
                    bitmap.EndInit();
                    p.Source = bitmap;
                    IsBrowse = true;
                }
            });
            SaveCommand = new RelayCommand<object>(p =>
            {
                if (IsAdd)
                {
                    {
                        if (string.IsNullOrEmpty(Book.Name) ||
                           string.IsNullOrEmpty(Book.Description) ||
                           string.IsNullOrEmpty(Book.Isbn) ||
                           Book.Price == 0 ||
                           Book.OriginalPrice == 0 ||
                           Book.Discount == 0 ||
                           Book.Quantity == 0 ||
                           Book.PublicationYear == null ||
                           string.IsNullOrEmpty(Book.Author) ||
                           string.IsNullOrEmpty(Book.Publisher))
                        {
                            MessageBox.Show(Book.Image);
                        }
                        else
                        {
                            if (Book.OriginalPrice > Book.Price)
                            {
                                MessageBox.Show("OriginalPrice must bigger than Price");
                            }
                            else if (IsBrowse)
                            {
                                var folder = AppDomain.CurrentDomain.BaseDirectory;
                                string newName;
                                string newImageName;
                                if (File.Exists($"{folder}images/books/{_selectedImage.Name}") == false)
                                {
                                    newImageName = _selectedImage.Name;
                                    File.Copy(_selectedImage.FullName, $"{folder}images/books/{_selectedImage.Name}");
                                    Book.Image = "/images/books/" + newImageName;
                                }
                                else
                                {
                                    Random rnd = new Random();
                                    newImageName = rnd.Next(1000).ToString() + _selectedImage.Name;
                                    newName = $"{folder}images/books/{newImageName}";
                                    File.Copy(_selectedImage.FullName, newName);
                                    Book.Image = "/images/books/" + newImageName;
                                }
                                _bookDAO.UpdateBook(Book);
                                isSave = true;
                                MessageBox.Show("Added successfully");
                            }
                            else
                            {
                                MessageBox.Show("Book doesn't has image");
                            }
                        }
                    }
                }
                else
                {
                    if (IsBrowse)
                    {
                        var folder = AppDomain.CurrentDomain.BaseDirectory;
                        string newName;
                        string newImageName;
                        if (File.Exists($"{folder}images/books/{_selectedImage.Name}") == false)
                        {
                            newImageName = _selectedImage.Name;
                            File.Copy(_selectedImage.FullName, $"{folder}images/books/{_selectedImage.Name}");
                            Book.Image = "/images/books/" + newImageName;
                        }
                        else
                        {
                            Random rnd = new Random();
                            newImageName = rnd.Next(1000).ToString() + _selectedImage.Name;
                            newName = $"{folder}images/books/{newImageName}";
                            File.Copy(_selectedImage.FullName, newName);
                            Book.Image = "/images/books/" + newImageName;
                        }
                    }
                    _bookDAO.UpdateBook(Book);

                    MessageBox.Show("Updated successfully");
                }
            });
            DeleteGenreCommand = new RelayCommand<BookGenre>(p =>
            {
                using (var db = new MyShopDbContext())
                {
                    var query = @"DELETE FROM book_genre 
                  WHERE book_id = {0} AND genre_id = {1}";

                    var parameters = new object[] { Book.Id, p.GenreId };

                    int rowsAffected = db.Database.ExecuteSqlRaw(query, parameters);

                    if (rowsAffected > 0)
                    {
                        Book.UpdatedAt = DateTime.Now;
                        GetListAddedBookGenre();
                        GetListBookGenre();
                        MessageBox.Show("Remove Genre Successful");
                    }
                    else
                    {
                        MessageBox.Show("Something wrong");
                    }
                }
                
            });
            AddGenreCommand = new RelayCommand<BookGenre>(p =>
            {
                using (var db = new MyShopDbContext())
                {
                    var query = @"INSERT INTO book_genre (book_id, genre_id)
                      VALUES ({0}, {1})";

                    var parameters = new object[] { Book.Id, p.GenreId };

                    int rowsAffected = db.Database.ExecuteSqlRaw(query, parameters);

                    if (rowsAffected > 0)
                    {
                        Book.UpdatedAt = DateTime.Now;
                        GetListAddedBookGenre();
                        GetListBookGenre();
                        MessageBox.Show("Add Genre Successful");
                    }
                    else
                    {
                        MessageBox.Show("Something wrong");
                    }
                }
            });
            CloseCommand = new RelayCommand<Window>(p =>
            {
                if (isSave == true)
                {
                    p.Close();
                }
                else
                {
                    if (IsAdd == true && isSave == false)
                    {
                        _bookDAO.DeleteBookWithAssociate(Book.Id);
                    }
                    p.Close();
                }
            });
        }
    }
}
