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
    class BookDAO
    {
        private MyShopDbContext dbContext = new MyShopDbContext();
        public void AddBook(Book book)
        {
            book.Id = Guid.NewGuid(); // Generate a new unique Id for the book
            book.CreatedAt = DateTime.UtcNow; // Set the created date to current UTC time
            book.UpdatedAt = DateTime.UtcNow; // Set the updated date to current UTC time
            dbContext.Books.Add(book);
            dbContext.SaveChanges();
        }

        // Update an existing book
        public void UpdateBook(Book book)
        {
            var existingBook = dbContext.Books.FirstOrDefault(b => b.Id == book.Id);
            if (existingBook != null)
            {
                existingBook.Name = book.Name;
                existingBook.Description = book.Description;
                existingBook.Image = book.Image;
                existingBook.Isbn = book.Isbn;
                existingBook.Price = book.Price;
                existingBook.OriginalPrice = book.OriginalPrice;
                existingBook.Discount = book.Discount;
                existingBook.Quantity = book.Quantity;
                existingBook.PublicationYear = book.PublicationYear;
                existingBook.Author = book.Author;
                existingBook.Publisher = book.Publisher;
                existingBook.UpdatedAt = DateTime.UtcNow; // Update the updated date to current UTC time
                dbContext.SaveChanges();
            }
        }

        // Delete a book
        public void DeleteBook(Guid id)
        {
            var book = dbContext.Books.FirstOrDefault(b => b.Id == id);
            if (book != null)
            {

                book.IsDeleted = true;
                book.UpdatedAt = DateTime.UtcNow;
                dbContext.SaveChanges();
            }
        }

        // Get all books
        public List<Book> GetAllBooks()
        {
            return dbContext.Books.Where(b => !b.IsDeleted).ToList();
        }

        // Get a book by Id
        public Book GetBookById(Guid id)
        {
            return dbContext.Books.FirstOrDefault(b => b.Id == id && !b.IsDeleted);
        }

        // Get books by genre
        public List<Book> GetBooksByGenre(string genre)
        {
            if (genre == "" || genre == "All") return dbContext.Books.ToList();
            else return dbContext.Books.Where(b => b.Genres.Any(g => g.Name == genre) && !b.IsDeleted).ToList();

        }
        public List<Book> GetBooksWithQuantityLessThan5()
        {
            return dbContext.Books.Where(b => b.Quantity < 5 && !b.IsDeleted)
                                 .OrderBy(b => b.Quantity)
                                 .ToList();
        }
        public void ImportBooksFromExcel(string filePath)
        {
            FileInfo fileInfo = new FileInfo(filePath);
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using (ExcelPackage package = new ExcelPackage(fileInfo))
            {
                ExcelWorksheet worksheet = package.Workbook.Worksheets.FirstOrDefault();
                if (worksheet != null)
                {
                    int rowCount = worksheet.Dimension.End.Row;
                    List<Book> books = new List<Book>();
                    for (int row = 2; row <= rowCount; row++)
                    {
                        if (worksheet.Cells[row, 2].Value?.ToString() == null) { break; }

                        DateTime? createdAt = worksheet.Cells[row, 4].Value != null ? DateTime.Parse(worksheet.Cells[row, 13].Value.ToString()) : null;

                        DateTime? updatedAt = worksheet.Cells[row, 5].Value != null ? DateTime.Parse(worksheet.Cells[row, 14].Value.ToString()) : null;

                        bool isDeleted = (worksheet.Cells[row, 15].Value?.ToString() != "0");

                        books.Add(new Book
                        {
                            Id = Guid.NewGuid(),
                            Name = worksheet.Cells[row, 2].Value?.ToString().Trim(),
                            Description = worksheet.Cells[row, 3].Value?.ToString().Trim(),
                            Image = worksheet.Cells[row, 4].Value?.ToString().Trim(),
                            Isbn = worksheet.Cells[row, 5].Value?.ToString().Trim(),
                            Price = Convert.ToDecimal(worksheet.Cells[row, 6].Value),
                            OriginalPrice = Convert.ToDecimal(worksheet.Cells[row, 7].Value),
                            Discount = Convert.ToByte(worksheet.Cells[row, 8].Value),
                            Quantity = Convert.ToInt32(worksheet.Cells[row, 9].Value),
                            PublicationYear = Convert.ToInt16(worksheet.Cells[row, 10].Value),
                            Author = worksheet.Cells[row, 11].Value.ToString().Trim(),
                            Publisher = worksheet.Cells[row, 12].Value.ToString().Trim(),
                            CreatedAt = createdAt ?? DateTime.MinValue,
                            UpdatedAt = updatedAt ?? DateTime.MinValue,
                            IsDeleted = isDeleted
                        });

                    }
                    using (MyShopDbContext context = new MyShopDbContext())
                    {
                        foreach (Book book in books)
                        {
                            context.Books.Add(new Book
                            {
                                Id = Guid.NewGuid(),
                                Name = book.Name,
                                Description = book.Description,
                                Image = book.Image,
                                Isbn = book.Isbn,
                                Price = book.Price,
                                OriginalPrice = book.OriginalPrice,
                                Discount = book.Discount,
                                Quantity = book.Quantity,
                                PublicationYear = book.PublicationYear,
                                Author = book.Author,
                                Publisher = book.Publisher,
                                CreatedAt = book.CreatedAt,
                                UpdatedAt = book.UpdatedAt,
                                IsDeleted = book.IsDeleted
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
