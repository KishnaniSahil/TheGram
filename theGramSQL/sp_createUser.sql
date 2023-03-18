-- =============================================
-- Author:      Disha Ramrakhyani
-- Create date: 14/11/2022
-- Description: Creates a new user
--
-- Parameters:
-- 				@firstName- first name of the user
--				@lastName- last name of the user
--				@gender- gender of the user
--				@userName- unique username for the user
--				@pw- password for users account
--				@mobileNo- registered mobile no of the user
--				@email- registered email of the user
--				@bio- short description of the user

     
-- Example: EXEC [theGram].[sp_createUser] 'Disha', 'Ramrakhyani', 'female', 'disha@24', 'disha2401', 7709904283, 'disha@gmail.com', 'hello'

-- =============================================

CREATE PROCEDURE [theGram].[sp_createUser]
	@firstName varchar(30),
	@lastName varchar(30),
	@gender varchar(30),
	@userName varchar(30),
	@pw varchar(30),
	@mobileNo varchar(30),
	@email varchar(100),
	@bio varchar(150)
AS
BEGIN
	INSERT INTO [theGram].[users]
	(
		[firstName],
		[lastName],
		[gender],
		[userName],
		[pw],
		[mobileNo],
		[email],
		[bio]
	)
	VALUES
	(
		@firstName,
		@lastName,
		@gender,
		@userName,
		@pw,
		@mobileNo,
		@email,
		@bio
	)
END
EXEC [theGram].[sp_createUser] 'Disha', 'Ramrakhyani', 'female', 'disha@24', 'disha2401', 7709904283, 'disha@gmail.com', 'hello'
select * from theGram.users