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

    }
}
