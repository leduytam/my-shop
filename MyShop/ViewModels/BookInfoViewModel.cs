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
        public ICommand BrowseImageCommand { get; set; }
        public ICommand SaveCommand { get; set; }
        public FileInfo _selectedImage = null;

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
                }
            });
            SaveCommand = new RelayCommand<object>(p =>
            {
                var folder = AppDomain.CurrentDomain.BaseDirectory;
                string newName;
                string newImageName;
                if (File.Exists($"{folder}images/books/{_selectedImage.Name}") == false)
                {
                    newImageName = _selectedImage.Name;
                    File.Copy(_selectedImage.FullName, $"{folder}images/books/{_selectedImage.Name}");
                    Book.Image = "/images/books/" + newImageName;
                    MessageBox.Show(_selectedImage.Name);
                    _bookDAO.UpdateBook(Book);
                }
                else
                {
                    Random rnd = new Random();
                    newImageName = rnd.Next(1000).ToString() + _selectedImage.Name;
                    newName = $"{folder}images/books/{newImageName}";
                    File.Copy(_selectedImage.FullName, newName);
                    Book.Image = "/images/books/" + newImageName;
                    MessageBox.Show(_selectedImage.Name);
                    _bookDAO.UpdateBook(Book);
                }
            });
        }
    }
}
