using System;
using System.Collections.Generic;

namespace MyShop.Models;

public partial class Genre
{
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }

    public bool IsDeleted { get; set; }

    public virtual ICollection<Book> Books { get; set; } = new List<Book>();
}
