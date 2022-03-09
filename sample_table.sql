CREATE TABLE [sample](
	id int identity(1,1) not null,
	guid uniqueidentifier primary key nonclustered not null default NEWID(),
	col1 varchar(50) not null,
	col2 varchar(50) not null,
	col3 varchar(50) not null
)
GO
CREATE CLUSTERED INDEX IDX_sample_id ON [sample](id)
GO

TRUNCATE TABLE [sample]

SELECT COUNT(*) FROM [sqltn].[dbo].[sample2]

SELECT TOP(1000) * FROM [sqltn].[dbo].[sample]

SELECT * FROM [sqltn].[dbo].[sample2] WHERE [id]=100000

SELECT * FROM [sqltn].[dbo].[sample] WHERE [guid]='C2FFDBDE-41CF-4512-97FF-D62079E86E1D'

CREATE TABLE [sample2](
	id int identity(1,1) not null,
	guid uniqueidentifier primary key not null default NEWID(),
	col1 varchar(50) not null,
	col2 varchar(50) not null,
	col3 varchar(50) not null
)