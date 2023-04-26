using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
                book.IsDeleted = true; // Mark the book as deleted
                dbContext.SaveChanges();
            }
        }

        // Get all books
        public List<Book> GetAllBooks()
        {
            return dbContext.Books.Where(b => !b.IsDeleted).ToList(); // Retrieve all books that are not deleted
        }

        // Get a book by Id
        public Book GetBookById(Guid id)
        {
            return dbContext.Books.FirstOrDefault(b => b.Id == id && !b.IsDeleted); // Retrieve the book with the given Id that is not deleted
        }

        // Get books by genre
        public List<Book> GetBooksByGenre(string genre)
        {
            if (genre == "" || genre == "All") return dbContext.Books.ToList();
            else return dbContext.Books.Where(b => b.Genres.Any(g => g.Name == genre) && !b.IsDeleted).ToList(); // Retrieve all books that have the given genre and are not deleted

        }
        public List<Book> GetBooksWithQuantityLessThan5()
        {
            return dbContext.Books.Where(b => b.Quantity < 5 && !b.IsDeleted)
                                 .OrderBy(b => b.Quantity)
                                 .ToList();
        }
    }
}
