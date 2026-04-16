/********************************************************************

X:\SqlServerBak\Dev14\063_quotesearchcontactqry__ 26-04-16__1423~[JEFF32819VM01~jsm14]~[Jamin].bak

********************************************************************/

USE MASTER
GO

/*******************************************************************/

IF db_id('Jamin') IS NOT NULL
	BEGIN
	ALTER DATABASE [Jamin] SET SINGLE_USER WITH ROLLBACK immediate
	END
GO
restore database [Jamin]
	from disk = 'X:\SqlServerBak\Dev14\063_quotesearchcontactqry__ 26-04-16__1423~[JEFF32819VM01~jsm14]~[Jamin].bak'
	with REPLACE,
	move 'Jamin' to 'X:\SqlServerData\Dev14\Jamin_data.mdf',
	move 'Jamin_log' to 'X:\SqlServerData\Dev14\Jamin_logs.ldf'
GO
ALTER DATABASE [Jamin] SET MULTI_USER
GO
