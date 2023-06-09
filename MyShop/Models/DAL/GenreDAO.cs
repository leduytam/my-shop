﻿using Microsoft.EntityFrameworkCore;
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

        public IEnumerable<Genre> GetAllGenres()
        {
            using (var _dbContext = new MyShopDbContext())
            {
                return _dbContext.Genres.ToList();
            }
        }

        public Genre GetGenreById(Guid id)
        {
            using (var _dbContext = new MyShopDbContext())
            {
                return _dbContext.Genres.FirstOrDefault(g => g.Id == id);
            }
        }

        public void AddGenre(Genre genre)
        {
            using (var _dbContext = new MyShopDbContext())
            {
                _dbContext.Genres.Add(genre);
                _dbContext.SaveChanges();
            }
        }

        public void UpdateGenre(Genre genre)
        {
            using (var _dbContext = new MyShopDbContext())
            {
                _dbContext.Entry(genre).State = EntityState.Modified;
                _dbContext.SaveChanges();
            }
        }

        public void DeleteGenre(Guid id)
        {
            using (var _dbContext = new MyShopDbContext())
            {
                var genre = _dbContext.Genres.FirstOrDefault(g => g.Id == id);
                if (genre != null)
                {
                    genre.IsDeleted = true;
                    genre.UpdatedAt = DateTime.Now;
                    _dbContext.SaveChanges();
                }
            }
        }
        public List<string> GetGenreNames()
        {
            using (var _dbContext = new MyShopDbContext())
            {
                return _dbContext.Genres
                .Select(g => g.Name)
                .ToList();
            }
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
                    int rowCount = worksheet.Dimension.End.Row;
                    List<Genre> genres = new List<Genre>();
                    for (int row = 2; row <= rowCount; row++)
                    {
                        if (worksheet.Cells[row, 2].Value?.ToString() == null) { break; }

                        DateTime? createdAt = worksheet.Cells[row, 4].Value != null ? DateTime.Parse(worksheet.Cells[row, 4].Value.ToString()) : null;

                        DateTime? updatedAt = worksheet.Cells[row, 5].Value != null ? DateTime.Parse(worksheet.Cells[row, 5].Value.ToString()) : null;

                        bool isDeleted = (worksheet.Cells[row, 6].Value?.ToString() == "0");
                        
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
                    using (MyShopDbContext context = new MyShopDbContext())
                    {
                        foreach (Genre genre in genres)
                        {
                            context.Genres.Add(new Genre
                            {
                                Id = Guid.NewGuid(),
                                Name = genre.Name.Trim(),
                                Description = genre.Description.Trim(),
                                CreatedAt = genre.CreatedAt,
                                UpdatedAt = genre.UpdatedAt,
                                IsDeleted = !genre.IsDeleted
                            });
                        }
                        context.SaveChanges();
                        MessageBox.Show("Import Successfully");
                    }

                }
            }
        }
    }
}
