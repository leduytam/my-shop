using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using System.Configuration;

namespace MyShop.Models;

public partial class MyShopDbContext : DbContext
{
    public MyShopDbContext()
    {
    }

    public MyShopDbContext(DbContextOptions<MyShopDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Account> Accounts { get; set; }

    public virtual DbSet<Book> Books { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<Genre> Genres { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<OrderItem> OrderItems { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)

        => optionsBuilder.UseSqlServer("Data Source=LAPTOP-BMIIIVS9;User ID = sa; Password = toan123456;Initial Catalog=my_shop_db;Integrated Security=True;TrustServerCertificate = True");
    //optionsBuilder.UseSqlServer(ConfigurationManager.ConnectionStrings["my_shop_db"].ConnectionString);

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Account>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("pk_account");

            entity.ToTable("account");

            entity.HasIndex(e => e.Email, "uqi_account_email")
                .IsUnique()
                .HasFilter("([is_deleted]=(0) AND [email] IS NOT NULL)");

            entity.HasIndex(e => e.Phone, "uqi_account_phone")
                .IsUnique()
                .HasFilter("([is_deleted]=(0) AND [phone] IS NOT NULL)");

            entity.HasIndex(e => e.Username, "uqi_account_username")
                .IsUnique()
                .HasFilter("([is_deleted]=(0))");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");
            entity.Property(e => e.Address)
                .HasMaxLength(255)
                .HasColumnName("address");
            entity.Property(e => e.Avatar)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("avatar");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("created_at");
            entity.Property(e => e.DateOfBirth)
                .HasColumnType("date")
                .HasColumnName("date_of_birth");
            entity.Property(e => e.Email)
                .HasMaxLength(254)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.FullName)
                .HasMaxLength(100)
                .HasColumnName("full_name");
            entity.Property(e => e.Gender).HasColumnName("gender");
            entity.Property(e => e.IsDeleted).HasColumnName("is_deleted");
            entity.Property(e => e.Password)
                .HasMaxLength(100)
                .HasColumnName("password");
            entity.Property(e => e.Phone)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasColumnName("phone");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("updated_at");
            entity.Property(e => e.Username)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("username");
        });

        modelBuilder.Entity<Book>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("pk_book");

            entity.ToTable("book");

            entity.HasIndex(e => e.Isbn, "uqi_book_isbn")
                .IsUnique()
                .HasFilter("([is_deleted]=(0))");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");
            entity.Property(e => e.Author)
                .HasMaxLength(100)
                .HasColumnName("author");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("created_at");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Discount).HasColumnName("discount");
            entity.Property(e => e.Image)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("image");
            entity.Property(e => e.IsDeleted).HasColumnName("is_deleted");
            entity.Property(e => e.Isbn)
                .HasMaxLength(13)
                .IsUnicode(false)
                .HasColumnName("isbn");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .HasColumnName("name");
            entity.Property(e => e.OriginalPrice)
                .HasColumnType("decimal(19, 4)")
                .HasColumnName("original_price");
            entity.Property(e => e.Price)
                .HasColumnType("decimal(19, 4)")
                .HasColumnName("price");
            entity.Property(e => e.PublicationYear).HasColumnName("publication_year");
            entity.Property(e => e.Publisher)
                .HasMaxLength(100)
                .HasColumnName("publisher");
            entity.Property(e => e.Quantity).HasColumnName("quantity");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("updated_at");

            entity.HasMany(d => d.Genres).WithMany(p => p.Books)
                .UsingEntity<Dictionary<string, object>>(
                    "BookGenre",
                    r => r.HasOne<Genre>().WithMany()
                        .HasForeignKey("GenreId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("fk_book_genre_genre"),
                    l => l.HasOne<Book>().WithMany()
                        .HasForeignKey("BookId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("fk_book_genre_book"),
                    j =>
                    {
                        j.HasKey("BookId", "GenreId").HasName("pk_book_genre");
                        j.ToTable("book_genre");
                        j.IndexerProperty<Guid>("BookId").HasColumnName("book_id");
                        j.IndexerProperty<Guid>("GenreId").HasColumnName("genre_id");
                    });
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("pk_customer");

            entity.ToTable("customer");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");

            entity.HasOne(d => d.IdNavigation).WithOne(p => p.Customer)
                .HasForeignKey<Customer>(d => d.Id)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_customer_account");
        });

        modelBuilder.Entity<Employee>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("pk_employee");

            entity.ToTable("employee");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");
            entity.Property(e => e.JobTitle)
                .HasMaxLength(50)
                .HasColumnName("job_title");
            entity.Property(e => e.Salary)
                .HasColumnType("decimal(19, 4)")
                .HasColumnName("salary");

            entity.HasOne(d => d.IdNavigation).WithOne(p => p.Employee)
                .HasForeignKey<Employee>(d => d.Id)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_employee_account");
        });

        modelBuilder.Entity<Genre>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("pk_genre");

            entity.ToTable("genre");

            entity.HasIndex(e => e.Name, "uqi_genre_name")
                .IsUnique()
                .HasFilter("([is_deleted]=(0))");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("created_at");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.IsDeleted).HasColumnName("is_deleted");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .HasColumnName("name");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("updated_at");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("pk_order");

            entity.ToTable("order");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("created_at");
            entity.Property(e => e.CustomerId).HasColumnName("customer_id");
            entity.Property(e => e.RecipientAddress)
                .HasMaxLength(255)
                .HasColumnName("recipient_address");
            entity.Property(e => e.RecipientName)
                .HasMaxLength(100)
                .HasColumnName("recipient_name");
            entity.Property(e => e.RecipientPhone)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasColumnName("recipient_phone");
            entity.Property(e => e.Status)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasDefaultValueSql("('pending')")
                .HasColumnName("status");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("updated_at");

            entity.HasOne(d => d.Customer).WithMany(p => p.Orders)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_order_customer");
        });

        modelBuilder.Entity<OrderItem>(entity =>
        {
            entity.HasKey(e => new { e.OrderId, e.BookId }).HasName("pk_order_item");

            entity.ToTable("order_item");

            entity.Property(e => e.OrderId).HasColumnName("order_id");
            entity.Property(e => e.BookId).HasColumnName("book_id");
            entity.Property(e => e.OriginalPrice)
                .HasColumnType("decimal(19, 4)")
                .HasColumnName("original_price");
            entity.Property(e => e.Price)
                .HasColumnType("decimal(19, 4)")
                .HasColumnName("price");
            entity.Property(e => e.Quantity).HasColumnName("quantity");

            entity.HasOne(d => d.Book).WithMany(p => p.OrderItems)
                .HasForeignKey(d => d.BookId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_order_item_book");

            entity.HasOne(d => d.Order).WithMany(p => p.OrderItems)
                .HasForeignKey(d => d.OrderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_order_item_order");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
