using Microsoft.EntityFrameworkCore;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace MyShop.Models.DAL
{
    public class GenreDAO
    {
        private MyShopDbContext _dbContext = new MyShopDbContext();

        public IEnumerable<Genre> GetAllGenres()
        {
            return _dbContext.Genres.ToList();
        }

        public Genre GetGenreById(Guid id)
        {
            return _dbContext.Genres.FirstOrDefault(g => g.Id == id);
        }

        public void AddGenre(Genre genre)
        {
            _dbContext.Genres.Add(genre);
            _dbContext.SaveChanges();
        }

        public void UpdateGenre(Genre genre)
        {
            _dbContext.Entry(genre).State = EntityState.Modified;
            _dbContext.SaveChanges();
        }

        public void DeleteGenre(Guid id)
        {
            var genre = _dbContext.Genres.FirstOrDefault(g => g.Id == id);
            if (genre != null)
            {
                _dbContext.Genres.Remove(genre);
                _dbContext.SaveChanges();
            }
        }
        public List<string> GetGenreNames()
        {
            return _dbContext.Genres
                .Select(g => g.Name)
                .ToList();
        }
        public void ImportGenresFromExcel(string filePath)
        {
            FileInfo fileInfo = new FileInfo(filePath);
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using (ExcelPackage package = new ExcelPackage(fileInfo))
            {
                ExcelWorksheet worksheet = package.Workbook.Worksheets.FirstOrDefault();
                if (worksheet != null)
                {
                    int rowCount = worksheet.Dimension.Rows;
                    List<Genre> genres = new List<Genre>();

                    // Read data from Excel file
                    for (int row = 2; row <= 3; row++)
                    {
                        DateTime? createdAt = worksheet.Cells[row, 4].Value != null ? DateTime.Parse(worksheet.Cells[row, 4].Value.ToString()) : null;

                        DateTime? updatedAt = worksheet.Cells[row, 5].Value != null ? DateTime.Parse(worksheet.Cells[row, 5].Value.ToString()) : null;

                        bool isDeleted = (worksheet.Cells[row, 6].Value?.ToString() == "0");
                        MessageBox.Show(worksheet.Cells[row, 2].Value?.ToString());

                        genres.Add(new Genre
                        {
                            Id = Guid.Parse(worksheet.Cells[row, 1].Value?.ToString()),
                            Name = worksheet.Cells[row, 2].Value?.ToString(),
                            Description = worksheet.Cells[row, 3].Value?.ToString(),
                            CreatedAt = createdAt ?? DateTime.MinValue,
                            UpdatedAt = updatedAt ?? DateTime.MinValue,
                            IsDeleted = isDeleted
                        });
                    }

                    //MessageBox.Show(genres[0].Name);
                    //MessageBox.Show(genres[1].Name);
                    //using (MyShopDbContext context = new MyShopDbContext())
                    //{
                    //    context.Genres.RemoveRange(context.Genres);
                    //    context.SaveChanges();
                    //}
                    // Add new genres to the database
                    using (MyShopDbContext context = new MyShopDbContext())
                    {
                        //var bookGenres = context.BookGenres.Where(bg => genres.Any(g => g.Id == bg.GenreId)).ToList();
                        //context.RemoveRange(bookGenres);
                        // Remove all existing genres
                        //var existingGenres = context.Genres.ToList();
                        //context.RemoveRange(existingGenres);

                        // Add new genres
                        foreach (Genre genre in genres)
                        {
                            MessageBox.Show(genre.Name);
                            context.Genres.Add(new Genre
                            {
                                Id = genre.Id,
                                Name = genre.Name,
                                Description = genre.Description,
                                CreatedAt = genre.CreatedAt,
                                UpdatedAt = genre.UpdatedAt,
                                IsDeleted = genre.IsDeleted
                            });
                        }
                        context.SaveChanges();
                    }

                }
            }
        }
    }
}
