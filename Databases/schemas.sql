CREATE DATABASE [my_shop_db]
GO

USE [my_shop_db]
GO

CREATE TABLE [account]
(
    [id]            UNIQUEIDENTIFIER,
    [username]      VARCHAR(50)    NOT NULL,
    [password]      VARBINARY(100) NOT NULL,
    [full_name]     NVARCHAR(100)  NOT NULL,
    [gender]        BIT            NOT NULL,
    [avatar]        VARCHAR(255),
    [email]         VARCHAR(254),
    [phone]         VARCHAR(15),
    [address]       NVARCHAR(255),
    [date_of_birth] DATE,
    [created_at]    DATETIME       NOT NULL DEFAULT GETDATE(),
    [updated_at]    DATETIME       NOT NULL DEFAULT GETDATE(),
    [is_deleted]    BIT            NOT NULL DEFAULT 0,
    CONSTRAINT pk_account PRIMARY KEY ([id]),
    CONSTRAINT chk_account_gender CHECK (gender IN (0, 1)),
)
CREATE UNIQUE INDEX [uqi_account_username] ON [account] ([username]) WHERE [is_deleted] = 0
CREATE UNIQUE INDEX [uqi_account_email] ON [account] ([email]) WHERE [is_deleted] = 0 AND [email] IS NOT NULL
CREATE UNIQUE INDEX [uqi_account_phone] ON [account] ([phone]) WHERE [is_deleted] = 0 AND [phone] IS NOT NULL


CREATE TABLE [customer]
(
    [id] UNIQUEIDENTIFIER,
    CONSTRAINT pk_customer PRIMARY KEY ([id]),
    CONSTRAINT fk_customer_account FOREIGN KEY ([id]) REFERENCES account ([id])
)

CREATE TABLE [employee]
(
    [id]        UNIQUEIDENTIFIER,
    [job_title] NVARCHAR(50)   NOT NULL,
    [salary]    DECIMAL(19, 4) NOT NULL,
    CONSTRAINT pk_employee PRIMARY KEY ([id]),
    CONSTRAINT fk_employee_account FOREIGN KEY ([id]) REFERENCES account ([id])
)

CREATE TABLE [genre]
(
    [id]          UNIQUEIDENTIFIER,
    [name]        NVARCHAR(100) NOT NULL,
    [description] NVARCHAR(MAX),
    [created_at]  DATETIME      NOT NULL DEFAULT GETDATE(),
    [updated_at]  DATETIME      NOT NULL DEFAULT GETDATE(),
    [is_deleted]  BIT           NOT NULL DEFAULT 0,
    CONSTRAINT pk_genre PRIMARY KEY ([id]),
)
CREATE UNIQUE INDEX [uqi_genre_name] ON [genre] ([name]) WHERE [is_deleted] = 0

CREATE TABLE [book]
(
    [id]               UNIQUEIDENTIFIER,
    [name]             NVARCHAR(100)  NOT NULL,
    [description]      NVARCHAR(MAX),
    [image]            VARCHAR(255)   NOT NULL,
    [isbn]             VARCHAR(13)    NOT NULL,
    [price]            DECIMAL(19, 4) NOT NULL,
    [original_price]   DECIMAL(19, 4) NOT NULL,
    [discount]         TINYINT        NOT NULL DEFAULT 0,
    [quantity]         INT            NOT NULL,
    [publication_year] SMALLINT,
    [author]           NVARCHAR(100)  NOT NULL,
    [publisher]        NVARCHAR(100)  NOT NULL,
    [created_at]       DATETIME       NOT NULL DEFAULT GETDATE(),
    [updated_at]       DATETIME       NOT NULL DEFAULT GETDATE(),
    [is_deleted]       BIT            NOT NULL DEFAULT 0,
    CONSTRAINT pk_book PRIMARY KEY ([id]),
    CONSTRAINT chk_book_original_price CHECK ([original_price] >= 0),
    CONSTRAINT chk_book_original_price_less_than_price CHECK ([original_price] <= [price]),
    CONSTRAINT chk_book_price CHECK ([price] >= 0),
    CONSTRAINT chk_book_discount CHECK ([discount] >= 0 AND [discount] <= 100),
    CONSTRAINT chk_book_quantity CHECK ([quantity] >= 0),
    CONSTRAINT chk_book_publication_year CHECK ([publication_year] >= 0),
)
CREATE UNIQUE INDEX [uqi_book_isbn] ON [book] ([isbn]) WHERE [is_deleted] = 0

CREATE TABLE [book_genre]
(
    [book_id]  UNIQUEIDENTIFIER NOT NULL,
    [genre_id] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT pk_book_genre PRIMARY KEY ([book_id], [genre_id]),
    CONSTRAINT fk_book_genre_book FOREIGN KEY ([book_id]) REFERENCES book ([id]),
    CONSTRAINT fk_book_genre_genre FOREIGN KEY ([genre_id]) REFERENCES genre ([id]),
)

CREATE TABLE [order]
(
    [id]                UNIQUEIDENTIFIER,
    [status]            VARCHAR(10)      NOT NULL DEFAULT 'pending',
    [customer_id]       UNIQUEIDENTIFIER NOT NULL,
    [recipient_name]    NVARCHAR(100)    NOT NULL,
    [recipient_address] NVARCHAR(255)    NOT NULL,
    [recipient_phone]   VARCHAR(15)      NOT NULL,
    [created_at]        DATETIME         NOT NULL DEFAULT GETDATE(),
    [updated_at]        DATETIME         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT pk_order PRIMARY KEY ([id]),
    CONSTRAINT fk_order_customer FOREIGN KEY ([customer_id]) REFERENCES customer ([id]),
    CONSTRAINT chk_order_status CHECK ([status] IN ('pending', 'processing', 'delivering', 'delivered', 'canceled')),
)

CREATE TABLE [order_item]
(
    [order_id]       UNIQUEIDENTIFIER NOT NULL,
    [book_id]        UNIQUEIDENTIFIER NOT NULL,
    [quantity]       INT              NOT NULL,
    [price]          DECIMAL(19, 4)   NOT NULL,
    [original_price] DECIMAL(19, 4)   NOT NULL,
    CONSTRAINT pk_order_item PRIMARY KEY ([order_id], [book_id]),
    CONSTRAINT fk_order_item_order FOREIGN KEY ([order_id]) REFERENCES [order] ([id]),
    CONSTRAINT fk_order_item_book FOREIGN KEY ([book_id]) REFERENCES book ([id]),
    CONSTRAINT chk_order_item_quantity CHECK ([quantity] >= 0),
    CONSTRAINT chk_order_item_price CHECK ([price] >= 0),
    CONSTRAINT chk_order_item_original_price CHECK ([original_price] >= 0),
)
