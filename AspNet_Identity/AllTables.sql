USE [BizNetwork]
GO
-- DELETE FROM [AspNetUsers]
UPDATE [AspNetUsers] SET [EmailConfirmed] = 1;

SELECT * FROM [AspNetRoleClaims]
SELECT * FROM [AspNetRoles]
SELECT * FROM [AspNetUserClaims]
SELECT * FROM [AspNetUserLogins]
SELECT * FROM [AspNetUserRoles]
SELECT * FROM [AspNetUsers]
SELECT * FROM [AspNetUserTokens]