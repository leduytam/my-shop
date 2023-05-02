using MyShop.Models;
using MyShop.Models.DAL;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace MyShop.ViewModels
{
    public class GenreViewModel : BaseViewModel
    {
        private GenreDAO _genreDao = new GenreDAO();
        private ObservableCollection<Genre> _genres = new ObservableCollection<Genre>();
        private string _genre = "";
        public string Genre { get => _genre; set { _genre = value; OnPropertyChanged("Genre"); } }
        private string _description = "";
        public string Description { get => _description; set { _description = value; OnPropertyChanged("Description"); } }
        public ObservableCollection<Genre> ListGenre { get => _genres; set { _genres = value; OnPropertyChanged("ListGenre"); } }
        public ICommand DeleteCommand { get; set; }
        public ICommand AddCommand { get; set; }

        public GenreViewModel()
        {
            _genres = new ObservableCollection<Genre>(_genreDao.GetAllGenres().Where(item => item.IsDeleted == false).ToList());
            DeleteCommand = new RelayCommand<Genre>(p =>
            {
                if (p != null)
                {
                    _genreDao.DeleteGenre(p.Id);
                    _genres = new ObservableCollection<Genre>(_genreDao.GetAllGenres().Where(item => item.IsDeleted == false).ToList());
                    ListGenre = _genres;
                    MessageBox.Show(p.Name + " was deleted");
                }
            });
            AddCommand = new RelayCommand<Genre>(p =>
            {
                if (Genre.Equals(""))
                {
                    MessageBox.Show("Name of genre can not be empty");
                }
                else
                {
                    Genre newGenre = new Genre();
                    newGenre.Name = Genre;
                    newGenre.Description = Description;
                    DateTime now = DateTime.Now;
                    newGenre.CreatedAt = now;
                    newGenre.UpdatedAt = now;
                    newGenre.Id = Guid.NewGuid();
                    newGenre.IsDeleted = false;
                    _genreDao.AddGenre(newGenre);
                    ListGenre = new ObservableCollection<Genre>(_genreDao.GetAllGenres().Where(item => item.IsDeleted == false).ToList());
                    Genre = "";
                    Description = "";
                    OnPropertyChanged("ListGenre");
                    MessageBox.Show("Add genre successful");
                }
            });
        }
    }
}
