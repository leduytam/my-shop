using Microsoft.EntityFrameworkCore;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace MyShop.Models.DAL
{
    class BookDAO
    {
        public void AddBook(Book book)
        {
            using (var dbContext = new MyShopDbContext())
            {
                // Check if the book already exists in the database
                var existingBook = dbContext.Books.FirstOrDefault(b => b.Id == book.Id);
                if (existingBook != null)
                {
                    UpdateBook(book);

                }
                else
                {
                    book.CreatedAt = DateTime.UtcNow; // Set the created date to current UTC time
                    book.UpdatedAt = DateTime.UtcNow; // Set the updated date to current UTC time
                    dbContext.Books.Add(book);
                    dbContext.SaveChanges();
                }
            }
        }

        // Update an existing book
        public void UpdateBook(Book book)
        {
            using (var dbContext = new MyShopDbContext())
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
        }

        // Delete a book
        public void DeleteBook(Guid id)
        {
            using (var dbContext = new MyShopDbContext())
            {
                var book = dbContext.Books.FirstOrDefault(b => b.Id == id);
                if (book != null)
                {

                    book.IsDeleted = true;
                    book.UpdatedAt = DateTime.UtcNow;
                    dbContext.SaveChanges();
                }
            }
        }
        public void DeleteBookWithAssociate(Guid id)
        {
            using (var dbContext = new MyShopDbContext())
            {
                var book = dbContext.Books.Include(b => b.OrderItems).Include(b => b.Genres).FirstOrDefault(b => b.Id == id);
                if (book != null)
                {
                    // Remove the book from any order items
                    foreach (var orderItem in book.OrderItems.ToList())
                    {
                        dbContext.OrderItems.Remove(orderItem);
                    }

                    // Remove the book from any book genres
                    foreach (var genre in book.Genres.ToList())
                    {
                        genre.Books.Remove(book);
                    }

                    dbContext.Books.Remove(book);
                    dbContext.SaveChanges();
                }
            }
        }

        // Get all books
        public List<Book> GetAllBooks()
        {
            using (var dbContext = new MyShopDbContext())
            {
                return dbContext.Books.Where(b => !b.IsDeleted).ToList();
            }
        }

        // Get a book by Id
        public Book GetBookById(Guid id)
        {
            using (var dbContext = new MyShopDbContext())
            {
                return dbContext.Books.FirstOrDefault(b => b.Id == id && !b.IsDeleted);
            }
        }

        // Get books by genre
        public List<Book> GetBooksByGenre(string genre)
        {
            using (var dbContext = new MyShopDbContext())
            {
                if (genre == "" || genre == "All") return dbContext.Books.ToList();
                else return dbContext.Books.Where(b => b.Genres.Any(g => g.Name == genre) && !b.IsDeleted).ToList();
            }
        }
        public List<Book> GetBooksWithQuantityLessThan5()
        {
            using (var dbContext = new MyShopDbContext())
            {
                return dbContext.Books.Where(b => b.Quantity < 5 && !b.IsDeleted)
                                 .OrderBy(b => b.Quantity)
                                 .ToList();
            }
        }
        public List<(string Name, int Quantity)> GetTop5BooksInCurrentWeek()
        {
            using (var dbContext = new MyShopDbContext())
            {
                DateTime today = DateTime.UtcNow.Date;
                DateTime startOfWeek = today.AddDays(-(int)today.DayOfWeek);

                var topBooks = dbContext.OrderItems
                    .Where(oi => oi.Order.Status == "delivered" && oi.Order.UpdatedAt.Date >= startOfWeek && oi.Order.UpdatedAt.Date <= today)
                    .GroupBy(oi => oi.Book)
                    .Select(g => new { Name = g.Key.Name, Quantity = g.Sum(oi => oi.Quantity) })
                    .OrderByDescending(b => b.Quantity)
                    .Take(5)
                    .ToList();

                return topBooks.Select(b => (b.Name, b.Quantity)).ToList();
            }
        }
        public List<(string Name, int Quantity)> GetTop5BooksCurrentMonth()
        {
            using (var dbContext = new MyShopDbContext())
            {
                DateTime today = DateTime.UtcNow.Date;
                DateTime startOfMonth = new DateTime(today.Year, today.Month, 1);

                var topBooks = dbContext.OrderItems
                    .Where(oi => oi.Order.Status == "delivered" && oi.Order.UpdatedAt.Date >= startOfMonth && oi.Order.UpdatedAt.Date <= today)
                    .GroupBy(oi => oi.Book)
                    .Select(g => new { Name = g.Key.Name, Quantity = g.Sum(oi => oi.Quantity) })
                    .OrderByDescending(b => b.Quantity)
                    .Take(5)
                    .ToList();

                return topBooks.Select(b => (b.Name, b.Quantity)).ToList();
            }
        }

        public List<(string Name, int Quantity)> GetTop5BooksInCurrentYear()
        {
            using (var dbContext = new MyShopDbContext())
            {
                DateTime today = DateTime.UtcNow.Date;
                DateTime startOfYear = new DateTime(today.Year, 1, 1);

                var topBooks = dbContext.OrderItems
                    .Where(oi => oi.Order.Status == "delivered" && oi.Order.UpdatedAt.Date >= startOfYear && oi.Order.UpdatedAt.Date <= today)
                    .GroupBy(oi => oi.Book)
                    .Select(g => new { Name = g.Key.Name, Quantity = g.Sum(oi => oi.Quantity) })
                    .OrderByDescending(b => b.Quantity)
                    .Take(5)
                    .ToList();

                return topBooks.Select(b => (b.Name, b.Quantity)).ToList();
            }
        }

        public static List<(string BookName, int Quantity)> GetTop5BooksAllTime()
        {
            using (var db = new MyShopDbContext())
            {
                var topBooks = db.OrderItems
                    .GroupBy(oi => oi.Book.Name)
                    .Select(g => new { BookName = g.Key, Quantity = g.Sum(oi => oi.Quantity) })
                    .OrderByDescending(x => x.Quantity)
                    .Take(5)
                    .ToList();

                return topBooks.Select(x => (x.BookName, x.Quantity)).ToList();
            }
        }

        public List<(string Name, int Quantity)> GetTop5BooksInLast7Days()
        {
            using (var dbContext = new MyShopDbContext())
            {
                DateTime today = DateTime.UtcNow.Date;
                DateTime startOfLast7Days = today.AddDays(-6);

                var topBooks = dbContext.OrderItems
                    .Where(oi => oi.Order.Status == "delivered" && oi.Order.UpdatedAt.Date >= startOfLast7Days && oi.Order.UpdatedAt.Date <= today)
                    .GroupBy(oi => oi.Book)
                    .Select(g => new { Name = g.Key.Name, Quantity = g.Sum(oi => oi.Quantity) })
                    .OrderByDescending(b => b.Quantity)
                    .Take(5)
                    .ToList();

                return topBooks.Select(b => (b.Name, b.Quantity)).ToList();
            }
        }

        public List<(string Name, int Quantity)> GetTop5BooksInLast30Days()
        {
            using (var dbContext = new MyShopDbContext())
            {
                DateTime today = DateTime.UtcNow.Date;
                DateTime startOfLast30Days = today.AddDays(-29);

                var topBooks = dbContext.OrderItems
                    .Where(oi => oi.Order.Status == "delivered" && oi.Order.UpdatedAt.Date >= startOfLast30Days && oi.Order.UpdatedAt.Date <= today)
                    .GroupBy(oi => oi.Book)
                    .Select(g => new { Name = g.Key.Name, Quantity = g.Sum(oi => oi.Quantity) })
                    .OrderByDescending(b => b.Quantity)
                    .Take(5)
                    .ToList();

                return topBooks.Select(b => (b.Name, b.Quantity)).ToList();
            }
        }

        public List<(string Name, int Quantity)> GetTop5BooksInLast365Days()
        {
            using (var dbContext = new MyShopDbContext())
            {
                DateTime today = DateTime.UtcNow.Date;
                DateTime startOfLast365Days = today.AddDays(-364);

                var topBooks = dbContext.OrderItems
                    .Where(oi => oi.Order.Status == "delivered" && oi.Order.UpdatedAt.Date >= startOfLast365Days && oi.Order.UpdatedAt.Date <= today)
                    .GroupBy(oi => oi.Book)
                    .Select(g => new { Name = g.Key.Name, Quantity = g.Sum(oi => oi.Quantity) })
                    .OrderByDescending(b => b.Quantity)
                    .Take(5)
                    .ToList();

                return topBooks.Select(b => (b.Name, b.Quantity)).ToList();
            }
        }

        public List<Book> GetBooksNotInOrder(Guid orderId)
        {
            using (var dbContext = new MyShopDbContext())
            {
                var orderItemBookIds = dbContext.OrderItems
                .Where(oi => oi.OrderId == orderId)
                .Select(oi => oi.BookId)
                .ToList();

                var booksNotInOrder = dbContext.Books
                    .Where(b => !orderItemBookIds.Contains(b.Id))
                    .ToList();

                return booksNotInOrder;
            }
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
