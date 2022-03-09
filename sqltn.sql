IF NOT EXISTS (SELECT * FROM sysobjects WHERE [name]='ppls' AND [xtype]='U')
CREATE TABLE [dbo].[ppls](
	[personId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
)
GO

SET NOCOUNT ON
DECLARE @ii int = 1
WHILE (@ii<=1000000)
BEGIN
	DECLARE @order nvarchar(50) = FORMAT(@ii, 'D7');
	DECLARE @username nvarchar(255) = 'USER' + @order;
	DECLARE @password nvarchar(255) = 'pwd'+ @order;
	DECLARE @emailadr nvarchar(255) = 'user'+@order+'@email.com';
	INSERT INTO [dbo].[ppls] ([name], [password], [email])
    VALUES ( @username,@password, @emailadr);
	SET @ii = @ii + 1
	
	IF(@ii%100000 = 0)
		PRINT RTRIM(@ii) + ' rows inserted';
END

/*
Table scan
SELECT * FROM [sqltn].[dbo].[ppls] WHERE [name]='USER1000000'

Add name indexes
CREATE NONCLUSTERED INDEX IX_PEOPLE_NAME ON [sqltn].[dbo].[ppls](name)

Row Id lookup 
SELECT * FROM [sqltn].[dbo].[ppls] WHERE [name]='USER1000000'

Index Seek
SELECT [name] FROM [sqltn].[dbo].[ppls] WHERE [name]='USER1000000'
*/