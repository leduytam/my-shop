using System;
using System.Collections.Generic;

namespace MyShop.Models;

public partial class Employee
{
    public Guid Id { get; set; }

    public string JobTitle { get; set; } = null!;

    public decimal Salary { get; set; }

    public virtual Account IdNavigation { get; set; } = null!;
}
