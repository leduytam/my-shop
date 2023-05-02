using MyShop.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace MyShop.Views.ModalView
{
    /// <summary>
    /// Interaction logic for ListGenreWindow.xaml
    /// </summary>
    public partial class ListGenreWindow : Window
    {
        public static ListGenreWindow register;
        public ListGenreWindow()
        {
            InitializeComponent();
        }

        private void Genre_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (this.DataContext != null)
            {
                ((GenreViewModel)this.DataContext).Genre = ((TextBox)sender).Text;
            }
        }

        private void Description_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (this.DataContext != null)
            {
                ((GenreViewModel)this.DataContext).Description = ((TextBox)sender).Text;
            }
        }
    }
}
