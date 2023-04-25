using System;
using System.Collections.Generic;

namespace MyShop.Models;

public partial class Account
{
    public Guid Id { get; set; }

    public string Username { get; set; } = null!;

    public byte[] Password { get; set; } = null!;

    public string FullName { get; set; } = null!;

    public bool Gender { get; set; }

    public string? Avatar { get; set; }

    public string? Email { get; set; }

    public string? Phone { get; set; }

    public string? Address { get; set; }

    public DateTime? DateOfBirth { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }

    public bool IsDeleted { get; set; }

    public virtual Customer? Customer { get; set; }

    public virtual Employee? Employee { get; set; }
}
