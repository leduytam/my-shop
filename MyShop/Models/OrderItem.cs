using System;
using System.Collections.Generic;

namespace MyShop.Models;

public partial class OrderItem
{
    public Guid OrderId { get; set; }

    public Guid BookId { get; set; }

    public int Quantity { get; set; }

    public decimal Price { get; set; }

    public decimal OriginalPrice { get; set; }

    public virtual Book Book { get; set; } = null!;

    public virtual Order Order { get; set; } = null!;
}
