﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace MyShop.Models.DAL
{
    public class OrderDAO
    {
        private MyShopDbContext _dbContext = new MyShopDbContext();

        public void CreateOrder(Order order)
        {
            _dbContext.Orders.Add(order);
            _dbContext.SaveChanges();
        }

        public void UpdateOrder(Order order)
        {
            _dbContext.Orders.Update(order);
            _dbContext.SaveChanges();
        }

        public void DeleteOrder(Guid orderId)
        {
            using (var dbContext = new MyShopDbContext())
            {
                var order = dbContext.Orders.Include(o => o.OrderItems).FirstOrDefault(o => o.Id == orderId);
                if (order != null)
                {
                    dbContext.OrderItems.RemoveRange(order.OrderItems);
                    dbContext.Orders.Remove(order);
                    dbContext.SaveChanges();
                }
            }
        }

        public Order GetOrderById(Guid orderId)
        {
            return _dbContext.Orders
                .Include(o => o.Customer)
                .Include(o => o.OrderItems)
                .ThenInclude(oi => oi.Book)
                .FirstOrDefault(o => o.Id == orderId);
        }
        public List<string> GetAllUsersName()
        {
            List<string> customerNames = _dbContext.Customers
                .Select(c => c.IdNavigation.FullName)
                .ToList();
            return customerNames;
        }

        public List<Order> GetAllOrders()
        {
            return _dbContext.Orders
                .Include(o => o.Customer)
                .Include(o => o.OrderItems)
                .ThenInclude(oi => oi.Book)
                .ToList();
        }

        public List<Order> GetOrdersByCustomerId(Guid customerId)
        {
            return _dbContext.Orders
                .Include(o => o.Customer)
                .Include(o => o.OrderItems)
                .ThenInclude(oi => oi.Book)
                .Where(o => o.CustomerId == customerId)
                .ToList();
        }
        public int GetOrderCountForCurrentWeek()
        { // Replace MyShopDbContext with your actual DbContext class name

            DateTime currentDate = DateTime.UtcNow; // Get the current UTC date
            DateTime startOfWeek = currentDate.Date.AddDays(-(int)currentDate.DayOfWeek + (int)DayOfWeek.Monday); // Calculate the start of the current week (assuming Monday is the first day of the week)
            DateTime endOfWeek = startOfWeek.AddDays(7); // Calculate the end of the current week
            return _dbContext.Orders.Count(o => o.CreatedAt >= startOfWeek && o.CreatedAt < endOfWeek); // Retrieve the count of orders that were created within the current week
        }
        public int GetOrderCountForCurrentMonth()
        {// Replace MyShopDbContext with your actual DbContext class name

            DateTime currentDate = DateTime.UtcNow; // Get the current UTC date
            DateTime startOfMonth = new DateTime(currentDate.Year, currentDate.Month, 1); // Calculate the start of the current month
            DateTime endOfMonth = startOfMonth.AddMonths(1).AddDays(-1); // Calculate the end of the current month
            return _dbContext.Orders.Count(o => o.CreatedAt >= startOfMonth && o.CreatedAt <= endOfMonth); // Retrieve the count of orders that were created within the current month
        }
        public List<double> GetRevenueLast7Days()
        {
            DateTime endDate = DateTime.UtcNow.Date; // Get the current UTC date
            DateTime startDate = endDate.AddDays(-7); // Calculate the start date 7 days ago

            List<double> revenueList = new List<double>();

            for (int i = 0; i < 7; i++)
            {
                DateTime date = endDate.AddDays(-i); // Calculate the date for each of the past 7 days
                decimal revenue = _dbContext.Orders
                    .Where(o => o.Status == "delivered" && o.UpdatedAt.Date == date)
                    .SelectMany(o => o.OrderItems)
                    .Sum(oi => oi.Price * oi.Quantity); // Calculate the revenue for the day

                revenueList.Insert(0, (double)revenue); // Insert the revenue at the beginning of the list
            }

            return revenueList;
        }
        public List<double> GetRevenueLast30Days()
        {
            DateTime endDate = DateTime.UtcNow.Date; // Get the current UTC date
            DateTime startDate = endDate.AddDays(-30); // Calculate the start date 30 days ago

            List<double> revenueList = new List<double>();

            for (int i = 0; i < 30; i++)
            {
                DateTime date = endDate.AddDays(-i); // Calculate the date for each of the past 30 days
                decimal revenue = _dbContext.Orders
                    .Where(o => o.Status == "delivered" && o.UpdatedAt.Date == date)
                    .SelectMany(o => o.OrderItems)
                    .Sum(oi => oi.Price * oi.Quantity); // Calculate the revenue for the day

                revenueList.Insert(0, (double)revenue); // Insert the revenue at the beginning of the list
            }

            return revenueList;
        }
        public List<double> GetRevenueLastYear()
        {
            DateTime endDate = DateTime.UtcNow.Date; // Get the current UTC date
            DateTime startDate = endDate.AddYears(-1).AddDays(1); // Calculate the start date 1 year ago

            List<double> revenueList = new List<double>();

            for (int i = 0; i < 12; i++)
            {
                DateTime date = endDate.AddMonths(-i); // Calculate the date for each of the past 12 months
                decimal revenue = _dbContext.Orders
                    .Where(o => o.Status == "delivered" && o.UpdatedAt.Date >= startDate && o.UpdatedAt.Date <= endDate && o.UpdatedAt.Month == date.Month && o.UpdatedAt.Year == date.Year)
                    .SelectMany(o => o.OrderItems)
                    .Sum(oi => oi.Price * oi.Quantity); // Calculate the revenue for the month

                revenueList.Insert(0, (double)revenue); // Insert the revenue at the beginning of the list
            }

            return revenueList;
        }
        public List<OrderItem> GetOrderItem(Guid orderId)
        {
            List<OrderItem> orderItems = _dbContext.OrderItems.Where(oi => oi.OrderId == orderId).ToList();

            return orderItems;
        }
        public void DeleteOrderItem(Guid orderId, Guid bookId)
        {
            var db = new MyShopDbContext();
            var orderItem = db.OrderItems.FirstOrDefault(oi => oi.OrderId == orderId && oi.BookId == bookId);
            if (orderItem != null)
            {
                db.OrderItems.Remove(orderItem);
                db.SaveChanges();
            }
        }
        public void IncreaseOrderItemQuantity(Guid orderId, Guid bookId)
        {
            var db = new MyShopDbContext();
            // Get the order item by order ID and book ID
            var orderItem = db.OrderItems.FirstOrDefault(item => item.OrderId == orderId && item.BookId == bookId);

            // If the order item exists, increase its quantity by 1
            if (orderItem != null)
            {
                orderItem.Quantity++;
                db.SaveChanges();
            }
        }
        public void DecreaseOrderItemQuantity(Guid orderId, Guid bookId)
        {
            var db = new MyShopDbContext();
            // Get the order item by order ID and book ID
            var orderItem = db.OrderItems.FirstOrDefault(item => item.OrderId == orderId && item.BookId == bookId);

            // If the order item exists, increase its quantity by 1
            if (orderItem != null)
            {
                orderItem.Quantity--;
                db.SaveChanges();
            }
        }
        public decimal TotalPrice(Guid orderId)
        {
            using (var dbContext = new MyShopDbContext())
            {
                decimal totalPrice = dbContext.OrderItems
                    .Where(oi => oi.OrderId == orderId)
                    .Join(dbContext.Books, oi => oi.BookId, b => b.Id, (oi, b) => oi.Quantity * b.Price)
                    .Sum();

                return totalPrice;
            }
        }
    }
}
