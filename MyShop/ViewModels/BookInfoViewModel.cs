using Microsoft.Win32;
using MyShop.Models;
using MyShop.Models.DAL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
        public Book Book { get => _book; set { _book = value; OnPropertyChanged("Book"); } }
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
                                _bookDAO.AddBook(Book);
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
        }
    }
}
