-- =============================================
-- Author:      Disha Ramrakhyani
-- Create date: 14/11/2022
-- Description: updates an existing user's data
--
-- Parameters:
--				@userID- ID of the user
-- 				@firstName- first name of the user
--				@lastName- last name of the user
--				@gender- gender of the user
--				@userName- unique username for the user
--				@pw- password for users account
--				@mobileNo- registered mobile no of the user
--				@email- registered email of the user
--				@bio- short description of the user

     
-- Example: EXEC [theGram].[sp_editUser] 1, 'Disha', 'Ramrakhyani', 'female', 'disha@24', 'disha2401', 7709904283, 'disha@gmail.com', 'hello'

-- =============================================

CREATE PROCEDURE [theGram].[sp_editUser]
	@userID int,
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
	UPDATE [theGram].[users]
	SET
		[firstName] = @firstName,
		[lastName] = @lastName,
		[gender] = @gender,
		[userName] = @userName,
		[pw] = @pw,
		[mobileNo] = @mobileNo,
		[email] = @email,
		[bio] = @bio,
		[editedAt] = getdate() WHERE [userID] = @userID
END
EXEC [theGram].[sp_editUser] 1, 'Disha', 'Ramrakhyani', 'female', 'disha@24', 'disha2401', 7709904283, 'disha@gmail.com', 'hello'
select * from theGram.users