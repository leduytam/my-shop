using System;
using System.Collections.Generic;

namespace MyShop.Models;

public partial class Customer
{
    public Guid Id { get; set; }

    public virtual Account IdNavigation { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
