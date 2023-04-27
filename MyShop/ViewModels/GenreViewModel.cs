using MyShop.Models;
using MyShop.Models.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace MyShop.ViewModels
{
    public class GenreViewModel : BaseViewModel
    {
        private GenreDAO _genreDao = new GenreDAO();
        private List<Genre> _genres = new List<Genre>();
        public List<Genre> ListGenre { get => _genres; set { _genres = value; OnPropertyChanged("ListGenre"); } }
        public ICommand DeleteCommand;
        public ICommand SelectCommand;
        public GenreViewModel()
        {
            _genres = _genreDao.GetAllGenres().Where(item => item.IsDeleted == false).ToList();

        }
    }
}
