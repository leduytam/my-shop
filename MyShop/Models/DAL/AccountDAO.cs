using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.Models.DAL
{
    internal class AccountDAO
    {
        public List<Account> GetAllAccounts()
        {
            using (var dbContext = new MyShopDbContext()) // Replace MyShopDbContext with your actual DbContext class name
            {
                return dbContext.Accounts.ToList(); // Retrieve all books that are not deleted
            }
        }
        public bool AddAccount(Account account)
        {
            using (var dbContext = new MyShopDbContext()) // Replace MyShopDbContext with your actual DbContext class name
            {
                // Check if an account with the same username already exists
                if (dbContext.Accounts.Any(a => a.Username == account.Username))
                {
                    return false;
                }
                // Add the account to the database
                dbContext.Accounts.Add(account);
                dbContext.SaveChanges();
            }
            return true;
        }
    }
}
