USE [my_shop_db]
GO

/* =================== AUTHENTICATION =================== */
CREATE PROCEDURE [dbo].[usp_employee_login] @username varchar(50),
                                            @password varchar(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @account_id UNIQUEIDENTIFIER

    SELECT @account_id = id
    FROM [account]
    WHERE [username] = @username
      AND [password] = HASHBYTES('SHA2_512', @password)

    IF (@account_id IS NULL) OR (NOT EXISTS(SELECT * FROM [employee] WHERE [id] = @account_id))
        BEGIN
            RAISERROR ('Invalid username or password', 16, 1)
        END

    SELECT [account].[id] AS [id],
           [username],
           [full_name],
           [gender],
           [avatar],
           [email],
           [phone],
           [address],
           [date_of_birth],
           [job_title],
           [salary]
    FROM [account]
             JOIN [employee] ON [account].[id] = [employee].[id]
    WHERE [account].[id] = @account_id
END
GO

CREATE PROCEDURE [dbo].[usp_create_customer] @username VARCHAR(50),
                                             @password VARCHAR(100),
                                             @full_name NVARCHAR(100),
                                             @gender BIT,
                                             @avatar VARCHAR(255),
                                             @email VARCHAR(254),
                                             @phone VARCHAR(15),
                                             @address NVARCHAR(255),
                                             @date_of_birth DATE,
                                             @id UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM [account] WHERE [username] = @username)
        BEGIN
            RAISERROR ('Username already exists', 16, 1)
        END

    SET @id = NEWID()

    INSERT INTO [account] ([id], [username], [password], [full_name], [gender], [avatar], [email], [phone], [address],
                           [date_of_birth])
    VALUES (@id, @username, HASHBYTES('SHA2_512', @password), @full_name, @gender, @avatar, @email, @phone, @address,
            @date_of_birth)

    INSERT INTO [customer] ([id]) VALUES (@id)
END
GO

CREATE PROCEDURE [dbo].[usp_create_employee] @username VARCHAR(50),
                                             @password VARCHAR(100),
                                             @full_name NVARCHAR(100),
                                             @gender BIT,
                                             @avatar VARCHAR(255),
                                             @email VARCHAR(254),
                                             @phone VARCHAR(15),
                                             @address NVARCHAR(255),
                                             @date_of_birth DATE,
                                             @job_title NVARCHAR(50),
                                             @salary DECIMAL(19, 4),
                                             @id UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM [account] WHERE [username] = @username)
        BEGIN
            RAISERROR ('Username already exists', 16, 1)
        END

    SET @id = NEWID()

    INSERT INTO [account] ([id], [username], [password], [full_name], [gender], [avatar], [email], [phone], [address],
                           [date_of_birth])
    VALUES (@id, @username, HASHBYTES('SHA2_512', @password), @full_name, @gender, @avatar, @email, @phone, @address,
            @date_of_birth)

    INSERT INTO [employee] ([id], [job_title], [salary]) VALUES (@id, @job_title, @salary)
END
GO
/* =================== AUTHENTICATION =================== */


/* =================== BOOK CRUD =================== */
CREATE TYPE [dbo].[type_genre_id_table] AS TABLE
(
    [id] UNIQUEIDENTIFIER UNIQUE NOT NULL
)
GO


CREATE PROCEDURE [dbo].[usp_get_books] @genre_ids [dbo].[type_genre_id_table] READONLY,
                                       @name NVARCHAR(100) = NULL,
                                       @page_number INT = 1,
                                       @page_size INT = 10,
                                       @order VARCHAR(4) = 'desc',
                                       @min_price DECIMAL(19, 4) = 0,
                                       @max_price DECIMAL(19, 4) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @offset INT = (@page_number - 1) * @page_size;
    DECLARE @limit INT = @page_size;
    DECLARE @genre_count INT = (SELECT COUNT(*) FROM @genre_ids)

    SELECT [id], [name], [image], [price], [discount], [updated_at]
    INTO [#temp]
    FROM [book]
    WHERE ([is_deleted] = 0)
      AND (@name IS NULL OR LOWER([name]) LIKE '%' + LOWER(@name) + '%')
      AND ([price] >= @min_price)
      AND (@max_price IS NULL OR [price] <= @max_price)
      AND (@genre_count = 0 OR [id] IN (SELECT [book_id]
                                        FROM [book_genre]
                                        WHERE [genre_id] IN (SELECT [id] FROM @genre_ids)
                                        GROUP BY [book_id]
                                        HAVING COUNT(DISTINCT [genre_id]) = @genre_count))

    SELECT [id], [name], [image], [price], [discount]
    FROM [#temp]
    ORDER BY CASE WHEN @order = 'asc' THEN [updated_at] END ASC,
             CASE WHEN @order = 'desc' THEN [updated_at] END DESC
    OFFSET @offset ROWS FETCH NEXT @limit ROWS ONLY

    SELECT COUNT(*) AS [total] FROM [#temp]

    DROP TABLE [#temp]
END
GO

CREATE PROCEDURE [dbo].[usp_get_book_by_id] @id UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [id],
           [name],
           [description],
           [image],
           [isbn],
           [price],
           [original_price],
           [discount],
           [quantity],
           [publication_year],
           [author],
           [publisher],
           [created_at],
           [updated_at]
    FROM [book]
    WHERE [book].[id] = @id
      AND [is_deleted] = 0

    IF (@@ROWCOUNT > 0)
        BEGIN
            SELECT [id], [name]
            FROM [genre]
                     JOIN [book_genre] ON [genre].[id] = [book_genre].[genre_id]
            WHERE [book_genre].[book_id] = @id
        END
END
GO

CREATE PROCEDURE [dbo].[usp_create_book] @name NVARCHAR(100),
                                         @description NVARCHAR(MAX),
                                         @image VARCHAR(255),
                                         @isbn VARCHAR(13),
                                         @price DECIMAL(19, 4),
                                         @original_price DECIMAL(19, 4),
                                         @discount TINYINT,
                                         @quantity INT,
                                         @publication_year SMALLINT,
                                         @author NVARCHAR(100),
                                         @publisher NVARCHAR(100),
                                         @genre_ids [dbo].[type_genre_id_table] READONLY,
                                         @id UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS(SELECT COUNT(*) FROM @genre_ids)
        BEGIN
            RAISERROR ('Genre ids cannot be empty', 16, 1)
        END

    SET @id = NEWID()

    INSERT INTO [book] ([id],
                        [name],
                        [description],
                        [image],
                        [isbn],
                        [price],
                        [original_price],
                        [discount],
                        [quantity],
                        [publication_year],
                        [author],
                        [publisher])
    VALUES (@id,
            @name,
            @description,
            @image,
            @isbn,
            @price,
            @original_price,
            @discount,
            @quantity,
            @publication_year,
            @author,
            @publisher)

    INSERT INTO [book_genre] ([book_id], [genre_id])
    SELECT @id, gi.[id]
    FROM @genre_ids gi
END
GO

CREATE PROCEDURE [dbo].[usp_update_book_by_id] @id UNIQUEIDENTIFIER,
                                               @name NVARCHAR(100),
                                               @description NVARCHAR(MAX),
                                               @image VARCHAR(255),
                                               @isbn VARCHAR(13),
                                               @price DECIMAL(19, 4),
                                               @original_price DECIMAL(19, 4),
                                               @discount TINYINT,
                                               @quantity INT,
                                               @publication_year SMALLINT,
                                               @author NVARCHAR(100),
                                               @publisher NVARCHAR(100),
                                               @genre_ids [dbo].[type_genre_id_table] READONLY
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS(SELECT COUNT(*) FROM @genre_ids)
        BEGIN
            RAISERROR ('Genre ids cannot be empty', 16, 1)
        END

    UPDATE [book]
    SET [name]             = @name,
        [description]      = @description,
        [image]            = @image,
        [isbn]             = @isbn,
        [price]            = @price,
        [original_price]   = @original_price,
        [discount]         = @discount,
        [quantity]         = @quantity,
        [publication_year] = @publication_year,
        [author]           = @author,
        [publisher]        = @publisher,
        [updated_at]       = GETDATE()
    WHERE [id] = @id

    IF @@ROWCOUNT > 0
        BEGIN
            DELETE FROM [book_genre] WHERE [book_id] = @id

            INSERT INTO [book_genre] ([book_id], [genre_id])
            SELECT @id, gi.[id]
            FROM @genre_ids gi
        END
END
GO

CREATE PROCEDURE [dbo].[usp_delete_book_by_id] @id UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [book] SET [is_deleted] = 1 WHERE [id] = @id
END
GO
/* =================== BOOK CRUD =================== */


/* =================== GENRE CRUD =================== */
CREATE PROCEDURE [dbo].[usp_get_genres]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [id], [name]
    FROM [genre]
    WHERE [is_deleted] = 0
    ORDER BY [name]
END
GO

CREATE PROCEDURE [dbo].[usp_create_genre] @name NVARCHAR(100),
                                          @description NVARCHAR(MAX),
                                          @id UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @id = NEWID()

    INSERT INTO [genre] ([id], [name], [description])
    VALUES (@id, @name, @description)
END
GO

CREATE PROCEDURE [dbo].[usp_update_genre_by_id] @id UNIQUEIDENTIFIER,
                                                @description NVARCHAR(MAX),
                                                @name NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [genre]
    SET [name]        = @name,
        [description] = @description,
        [updated_at]  = GETDATE()
    WHERE [id] = @id
END
GO

CREATE PROCEDURE [dbo].[usp_delete_genre_by_id] @id UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM [book_genre] WHERE [genre_id] = @id)
        BEGIN
            RAISERROR ('Unable to delete genre as it is currently being used.', 16, 1)
        END

    UPDATE [genre] SET [is_deleted] = 1 WHERE [id] = @id
END
GO
/* =================== GENRE CRUD =================== */


/* =================== ORDER CRUD =================== */
CREATE PROCEDURE [dbo].[usp_get_orders] @page_number INT = 1,
                                        @page_size INT = 10,
                                        @order VARCHAR(4) = 'desc',
                                        @from_date DATETIME = NULL,
                                        @to_date DATETIME = NULL,
                                        @status VARCHAR(10) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @offset INT
    DECLARE @limit INT

    SET @offset = (@page_number - 1) * @page_size
    SET @limit = @page_size

    SELECT [id],
           [recipient_name],
           [recipient_phone],
           [status],
           [created_at],
           SUM([quantity] * [price]) AS [total_price],
           [updated_at]
    INTO [#temp]
    FROM [order]
             JOIN [order_item] ON [order_item].[order_id] = [order].[id]
    WHERE (@from_date IS NULL OR [created_at] >= @from_date)
      AND (@to_date IS NULL OR [created_at] <= @to_date)
      AND (@status IS NULL OR [status] = @status)
    GROUP BY [id], [customer_id], [recipient_name], [recipient_phone], [status], [created_at], [updated_at]

    SELECT [id],
           [recipient_name],
           [recipient_phone],
           [status],
           [created_at],
           [total_price]
    FROM [#temp]
    ORDER BY CASE WHEN @order = 'desc' THEN [created_at] END DESC,
             CASE WHEN @order = 'asc' THEN [created_at] END ASC
    OFFSET @offset ROWS FETCH NEXT @limit ROWS ONLY

    SELECT COUNT(*) AS [total] FROM [#temp]

    DROP TABLE [#temp]
END
GO

CREATE PROCEDURE [dbo].[usp_get_order_by_id] @id UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [order].[id]              AS [id],
           [customer].[full_name]    AS [customer_name],
           [recipient_name],
           [recipient_address],
           [recipient_phone],
           [status],
           [order].[created_at]      AS [created_at],
           [order].[updated_at]      AS [updated_at],
           SUM([quantity] * [price]) AS [total_price]
    FROM [order]
             JOIN [account] AS [customer] ON [customer].[id] = [order].[customer_id]
             JOIN [order_item] ON [order_item].[order_id] = [order].[id]
    WHERE [order].[id] = @id
    GROUP BY [order].[id], [customer].[full_name], [recipient_name], [recipient_address], [recipient_phone],
             [status], [order].[created_at], [order].[updated_at]

    SELECT [book].[id]   AS [id],
           [book].[name] AS [name],
           [order_item].[quantity],
           [order_item].[price],
           [order_item].[original_price]
    FROM [order_item]
             JOIN [book] ON [book].[id] = [order_item].[book_id]
    WHERE [order_id] = @id
END
GO

CREATE TYPE [dbo].[type_order_item_table] AS TABLE
(
    [book_id]  UNIQUEIDENTIFIER,
    [quantity] INT
)
GO

CREATE PROCEDURE [dbo].[usp_create_order] @customer_id UNIQUEIDENTIFIER,
                                          @recipient_name NVARCHAR(100),
                                          @recipient_address NVARCHAR(255),
                                          @recipient_phone VARCHAR(15),
                                          @order_items [dbo].[type_order_item_table] READONLY,
                                          @id UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @id = NEWID()

    INSERT INTO [order] ([id], [customer_id], [recipient_name], [recipient_address], [recipient_phone])
    VALUES (@id, @customer_id, @recipient_name, @recipient_address, @recipient_phone)


    INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
    SELECT @id, [book_id], [book].[quantity], ([price] * (1.0 - [discount] / 100.0)), [original_price]
    FROM @order_items
             JOIN [book] ON [book].[id] = [book_id]

    UPDATE [book]
    SET [book].[quantity] = [book].[quantity] - oi.[quantity]
    FROM @order_items oi
    WHERE [book].[id] = [oi].[book_id]
END
GO

CREATE PROCEDURE [dbo].[usp_update_order_by_id] @id UNIQUEIDENTIFIER,
                                                @recipient_name NVARCHAR(100),
                                                @recipient_address NVARCHAR(255),
                                                @recipient_phone VARCHAR(15),
                                                @order_items [dbo].[type_order_item_table] READONLY
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @status VARCHAR(10) = (SELECT [status] FROM [order] WHERE [id] = @id)

    IF @status <> 'pending'
        BEGIN
            RAISERROR ('Update order failed! Only pending order can be updated', 16, 1)
        END

    UPDATE [order]
    SET [recipient_name]    = @recipient_name,
        [recipient_address] = @recipient_address,
        [recipient_phone]   = @recipient_phone,
        [updated_at]        = GETDATE()
    WHERE [id] = @id

    UPDATE [book]
    SET [book].[quantity] = [book].[quantity] + [order_item].[quantity]
    FROM [order_item]
    WHERE [order_item].[order_id] = @id
      AND [book].[id] = [book_id]

    DELETE FROM [order_item] WHERE [order_id] = @id

    INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
    SELECT @id, [book_id], [book].[quantity], ([price] * (1.0 - [discount] / 100.0)), [original_price]
    FROM @order_items
             JOIN [book] ON [book].[id] = [book_id]
END
GO

CREATE PROCEDURE [dbo].[usp_update_order_status_by_id] @id UNIQUEIDENTIFIER,
                                                       @status VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @old_status VARCHAR(10) = (SELECT [status] FROM [order] WHERE [id] = @id)

    IF @old_status = 'delivered' OR @old_status = 'canceled'
        BEGIN
            RAISERROR ('Cannot update status of order', 16, 1)
        END

    IF @status = 'canceled'
        BEGIN
            UPDATE [book]
            SET [book].[quantity] = [book].[quantity] + [order_item].[quantity]
            FROM [order_item]
            WHERE [order_item].[order_id] = @id
              AND [book].[id] = [book_id]
        END

    UPDATE [order]
    SET [status] = @status
    WHERE [id] = @id
END
GO
/* =================== ORDER CRUD =================== */


/* =================== COMMON =================== */
CREATE PROCEDURE [dbo].[usp_get_number_of_books] @is_in_stock BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*) AS [number_of_books]
    FROM [book]
    WHERE ([is_deleted] = 0)
      AND (@is_in_stock = 0 OR [quantity] > 0)
END
GO

CREATE PROCEDURE [dbo].[usp_get_number_of_orders_in_range] @start_date DATETIME,
                                                           @end_date DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*) AS [number_of_orders_this_week]
    FROM [order]
    WHERE [created_at] BETWEEN @start_date AND @end_date
END
GO

CREATE PROCEDURE [dbo].[usp_get_top_book_running_out_of_stock] @limit INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@limit) [id], [name], [image], [price], [discount]
    FROM [book]
    WHERE ([quantity] > 0)
      AND ([is_deleted] = 0)
    ORDER BY [quantity]
END
GO

CREATE PROCEDURE [dbo].[usp_get_best_selling_books_in_range] @limit INT = 10,
                                                             @start_date DATETIME,
                                                             @end_date DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@limit) [book].[id],
                        [book].[name],
                        [book].[image],
                        SUM([order_item].[quantity]) AS [quantity_sold]
    FROM [order]
             JOIN [order_item] ON [order_item].[order_id] = [order].[id]
             JOIN [book] ON [book].[id] = [order_item].[book_id]
    WHERE ([book].[is_deleted] = 0)
      AND ([order].[status] = 'delivered')
      AND ([order].[created_at] BETWEEN @start_date AND @end_date)
    GROUP BY [book].[id], [book].[name], [book].[image]
    ORDER BY [quantity_sold] DESC
END
GO

CREATE PROCEDURE [dbo].[usp_get_daily_revenue_profit] @days INT = 365
AS
BEGIN
    WITH [days] AS (SELECT DATEADD(DAY, -number, DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0)) AS [day]
                    FROM master..spt_values
                    WHERE type = 'P'
                      AND number <= @days)
    SELECT [days].[day],
           COALESCE(SUM(oi.[quantity] * oi.[price]), 0)                         AS [revenue],
           COALESCE(SUM(oi.[quantity] * (oi.[price] - oi.[original_price])), 0) AS [profit]
    FROM [days]
             LEFT JOIN [order] o ON DATEPART(day, o.[created_at]) = DATEPART(day, [days].[day])
        AND DATEPART(MONTH, o.[created_at]) = DATEPART(MONTH, [days].[day])
        AND DATEPART(YEAR, o.[created_at]) = DATEPART(YEAR, [days].[day])
        AND o.[status] = 'delivered'
             LEFT JOIN [order_item] oi ON oi.[order_id] = o.[id]
    GROUP BY [days].[day]
    ORDER BY [days].[day] DESC
END
GO

CREATE PROCEDURE [dbo].[usp_get_weekly_revenue_profit] @weeks INT = 52
AS
BEGIN
    WITH [weeks] AS (SELECT DATEADD(WEEK, -number, DATEADD(WEEK, DATEDIFF(WEEK, 0, GETDATE()), 0)) AS [week]
                     FROM master..spt_values
                     WHERE type = 'P'
                       AND number <= @weeks)
    SELECT [weeks].[week],
           COALESCE(SUM(oi.[quantity] * oi.[price]), 0)                         AS [revenue],
           COALESCE(SUM(oi.[quantity] * (oi.[price] - oi.[original_price])), 0) AS [profit]
    FROM [weeks]
             LEFT JOIN [order] o ON DATEPART(WEEK, o.[created_at]) = DATEPART(WEEK, [weeks].[week])
        AND DATEPART(YEAR, o.[created_at]) = DATEPART(YEAR, [weeks].[week])
        AND o.[status] = 'delivered'
             LEFT JOIN [order_item] oi ON o.[id] = oi.[order_id]
    GROUP BY [weeks].[week]
    ORDER BY [weeks].[week]
END
GO

CREATE PROCEDURE [dbo].[usp_get_monthly_revenue_profit] @months INT = 12
AS
BEGIN
    WITH [months] AS (SELECT DATEADD(MONTH, -number, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)) AS [month]
                      FROM master..spt_values
                      WHERE type = 'P'
                        AND number <= @months)
    SELECT [months].[month],
           COALESCE(SUM(oi.[quantity] * oi.[price]), 0)                         AS [revenue],
           COALESCE(SUM(oi.[quantity] * (oi.[price] - oi.[original_price])), 0) AS [profit]
    FROM [months]
             LEFT JOIN [order] o ON DATEPART(MONTH, o.[created_at]) = DATEPART(MONTH, [months].[month])
        AND DATEPART(YEAR, o.[created_at]) = DATEPART(YEAR, [months].[month])
        AND o.[status] = 'delivered'
             LEFT JOIN [order_item] oi ON o.[id] = oi.[order_id]
    GROUP BY [months].[month]
    ORDER BY [months].[month]
END
GO

CREATE PROCEDURE [dbo].[usp_get_yearly_revenue_profit] @years INT = 10
AS
BEGIN
    WITH [years] AS (SELECT DATEADD(YEAR, -number, DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()), 0)) AS [year]
                     FROM master..spt_values
                     WHERE type = 'P'
                       AND number <= @years)
    SELECT [years].[year],
           COALESCE(SUM(oi.[quantity] * oi.[price]), 0)                         AS [revenue],
           COALESCE(SUM(oi.[quantity] * (oi.[price] - oi.[original_price])), 0) AS [profit]
    FROM [years]
             LEFT JOIN [order] o ON DATEPART(YEAR, o.[created_at]) = DATEPART(YEAR, [years].[year])
        AND o.[status] = 'delivered'
             LEFT JOIN [order_item] oi ON o.[id] = oi.[order_id]
    GROUP BY [years].[year]
    ORDER BY [years].[year]
END
GO

CREATE PROCEDURE [dbo].[usp_get_daily_product_quantity_sold] @book_id UNIQUEIDENTIFIER,
                                                             @days INT = 365
AS
BEGIN
    WITH [days] AS (SELECT DATEADD(DAY, -number, DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0)) AS [day]
                    FROM master..spt_values
                    WHERE type = 'P'
                      AND number <= @days)
    SELECT [days].[day],
           COALESCE(SUM(oi.[quantity]), 0) AS [quantity_sold]
    FROM [days]
             LEFT JOIN [order] o ON DATEPART(DAY, o.[created_at]) = DATEPART(DAY, [days].[day])
        AND DATEPART(MONTH, o.[created_at]) = DATEPART(MONTH, [days].[day])
        AND DATEPART(YEAR, o.[created_at]) = DATEPART(YEAR, [days].[day])
        AND o.[status] = 'delivered'
             LEFT JOIN [order_item] oi ON oi.[order_id] = o.[id] AND oi.[book_id] = @book_id
    GROUP BY [days].[day]
    ORDER BY [days].[day] DESC
END
GO

CREATE PROCEDURE [dbo].[usp_get_weekly_product_quantity_sold] @book_id UNIQUEIDENTIFIER,
                                                              @weeks INT = 52
AS
BEGIN
    WITH [weeks] AS (SELECT DATEADD(WEEK, -number, DATEADD(WEEK, DATEDIFF(WEEK, 0, GETDATE()), 0)) AS [week]
                     FROM master..spt_values
                     WHERE type = 'P'
                       AND number <= @weeks)
    SELECT [weeks].[week],
           COALESCE(SUM(oi.[quantity]), 0) AS [quantity_sold]
    FROM [weeks]
             LEFT JOIN [order] o ON DATEPART(WEEK, o.[created_at]) = DATEPART(WEEK, [weeks].[week])
        AND DATEPART(YEAR, o.[created_at]) = DATEPART(YEAR, [weeks].[week])
        AND o.[status] = 'delivered'
             LEFT JOIN [order_item] oi ON o.[id] = oi.[order_id] AND oi.[book_id] = @book_id
    GROUP BY [weeks].[week]
    ORDER BY [weeks].[week]
END
GO

CREATE PROCEDURE [dbo].[usp_get_monthly_product_quantity_sold] @book_id UNIQUEIDENTIFIER,
                                                               @months INT = 12
AS
BEGIN
    WITH [months] AS (SELECT DATEADD(MONTH, -number, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)) AS [month]
                      FROM master..spt_values
                      WHERE type = 'P'
                        AND number <= @months)
    SELECT [months].[month],
           COALESCE(SUM(oi.[quantity]), 0) AS [quantity_sold]
    FROM [months]
             LEFT JOIN [order] o ON DATEPART(MONTH, o.[created_at]) = DATEPART(MONTH, [months].[month])
        AND DATEPART(YEAR, o.[created_at]) = DATEPART(YEAR, [months].[month])
        AND o.[status] = 'delivered'
             LEFT JOIN [order_item] oi ON o.[id] = oi.[order_id] AND oi.[book_id] = @book_id
    GROUP BY [months].[month]
    ORDER BY [months].[month]
END
GO

CREATE PROCEDURE [dbo].[usp_get_yearly_product_quantity_sold] @book_id UNIQUEIDENTIFIER,
                                                              @years INT = 10
AS
BEGIN
    WITH [years] AS (SELECT DATEADD(YEAR, -number, DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()), 0)) AS [year]
                     FROM master..spt_values
                     WHERE type = 'P'
                       AND number <= @years)
    SELECT [years].[year],
           COALESCE(SUM(oi.[quantity]), 0) AS [quantity_sold]
    FROM [years]
             LEFT JOIN [order] o ON DATEPART(YEAR, o.[created_at]) = DATEPART(YEAR, [years].[year])
        AND o.[status] = 'delivered'
             LEFT JOIN [order_item] oi ON o.[id] = oi.[order_id] AND oi.[book_id] = @book_id
    GROUP BY [years].[year]
    ORDER BY [years].[year]
END
GO
/* =================== COMMON =================== */