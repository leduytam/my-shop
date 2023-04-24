using System;
using System.Collections.Generic;

namespace MyShop.Models;

public partial class Order
{
    public Guid Id { get; set; }

    public string Status { get; set; } = null!;

    public Guid CustomerId { get; set; }

    public string RecipientName { get; set; } = null!;

    public string RecipientAddress { get; set; } = null!;

    public string RecipientPhone { get; set; } = null!;

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }

    public virtual Customer Customer { get; set; } = null!;

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();
}
