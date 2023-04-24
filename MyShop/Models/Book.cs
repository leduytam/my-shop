using System;
using System.Collections.Generic;

namespace MyShop.Models;

public partial class Book
{
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public string Image { get; set; } = null!;

    public string Isbn { get; set; } = null!;

    public decimal Price { get; set; }

    public decimal OriginalPrice { get; set; }

    public byte Discount { get; set; }

    public int Quantity { get; set; }

    public short? PublicationYear { get; set; }

    public string Author { get; set; } = null!;

    public string Publisher { get; set; } = null!;

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }

    public bool IsDeleted { get; set; }

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual ICollection<Genre> Genres { get; set; } = new List<Genre>();
}
