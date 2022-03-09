IF NOT EXISTS (SELECT * FROM sysobjects WHERE [name]='ppls_uuid' AND [xtype]='U')
CREATE TABLE [dbo].[ppls_uuid](
	[personId] UNIQUEIDENTIFIER NOT NULL,
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
	DECLARE @pid uniqueidentifier = NEWID();
	DECLARE @username nvarchar(255) = 'USER' + @order;
	DECLARE @password nvarchar(255) = 'pwd'+ @order;
	DECLARE @emailadr nvarchar(255) = 'user'+@order+'@email.com';
	INSERT INTO [dbo].[ppls_uuid] ([personId], [name], [password], [email])
    VALUES (@pid, @username,@password, @emailadr);
	SET @ii = @ii + 1
	
	IF(@ii%100000 = 0)
		PRINT RTRIM(@ii) + ' rows inserted';
END

/*
--Table scan
SELECT * FROM [sqltn].[dbo].[ppls] WHERE [name]='USER1000000'

--Add name indexes
CREATE NONCLUSTERED INDEX IX_PEOPLE_NAME ON [sqltn].[dbo].[ppls](name)

--Row Id lookup 
SELECT * FROM [sqltn].[dbo].[ppls] WHERE [name]='USER1000000'

--Index Seek
SELECT [name] FROM [sqltn].[dbo].[ppls] WHERE [name]='USER1000000'

--Add id indexes
CREATE CLUSTERED INDEX IX_PEOPLE_ID ON [sqltn].[dbo].[ppls](personID)

--Query ID and name
SELECT [personID],[name] FROM [sqltn].[dbo].[ppls] WHERE [name]='USER1000000'
*/