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
            using (var dbContext = new MyShopDbContext())
            {
                return dbContext.Accounts.ToList();
            }
        }
        public bool AddAccount(Account account)
        {
            using (var dbContext = new MyShopDbContext())
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
        public (string Address, string Phone) GetRecipientDetails(string recipientName)
        {
            using (var dbContext = new MyShopDbContext())
            {
                var account = dbContext.Accounts
                .FirstOrDefault(a => a.FullName == recipientName);

                if (account != null)
                {
                    return (account.Address ?? "", account.Phone ?? "");
                }

                return ("", "");
            }
        }
    }
}
