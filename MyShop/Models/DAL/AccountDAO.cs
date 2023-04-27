using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.Models.DAL
{
    internal class AccountDAO
    {
        private MyShopDbContext dbContext = new MyShopDbContext();
        public List<Account> GetAllAccounts()
        {
            return dbContext.Accounts.ToList();
        }
        public bool AddAccount(Account account)
        {
            if (dbContext.Accounts.Any(a => a.Username == account.Username))
            {
                return false;
            }
            // Add the account to the database
            dbContext.Accounts.Add(account);
            dbContext.SaveChanges();

            return true;
        }
    }
}
