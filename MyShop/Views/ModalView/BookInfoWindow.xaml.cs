using MyShop.Models;
using MyShop.ViewModels;
using System;
using System.Collections.Generic;
using System.Windows;

namespace MyShop.Views.ModalView
{
    /// <summary>
    /// Interaction logic for BookInfoWindow.xaml
    /// </summary>
    public partial class BookInfoWindow : Window
    {
        public BookInfoWindow(Book a)
        {
            InitializeComponent();
            DataContext = new BookInfoViewModel();
            ((BookInfoViewModel)DataContext).Book = a;
            ((BookInfoViewModel)DataContext).IsAdd = false;
        }

        public BookInfoWindow()
        {
            InitializeComponent();
            DataContext = new BookInfoViewModel();
            ((BookInfoViewModel)DataContext).Book = new Book
            {
                Id = Guid.NewGuid(),
                Name = string.Empty,
                Description = null,
                Image = string.Empty,
                Isbn = string.Empty,
                Price = 0,
                OriginalPrice = 0,
                Discount = 0,
                Quantity = 0,
                PublicationYear = null,
                Author = string.Empty,
                Publisher = string.Empty,
                CreatedAt = DateTime.MinValue,
                UpdatedAt = DateTime.MinValue,
                IsDeleted = false,
                OrderItems = new List<OrderItem>(),
                Genres = new List<Genre>()
            };
            ((BookInfoViewModel)DataContext).IsAdd = true;
        }
    }
}
