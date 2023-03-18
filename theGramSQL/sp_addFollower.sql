-- =============================================
-- Author:      Disha Ramrakhyani
-- Create date: 14/11/2022
-- Description: add a new follower
-- Parameters:
--				@userID - ID of the user
--				@followedUserID- ID of another user that the user has followed

-- Example: EXEC [blog].[sp_addFollower] 2,1
-- Change History:
-- =============================================

CREATE PROCEDURE [theGram].[sp_addFollower]
	@userID int,
	@followedUserID int
	
AS
BEGIN
	INSERT INTO [theGram].[followers] values (@userID, @followedUserID)
	DECLARE @N INT
	SET @N = (SELECT [followingCount] FROM [theGram].[users] WHERE [userID] = @userID)
	UPDATE  [theGram].[users] SET [followingCount] = @N + 1 WHERE [userID] = @userID
	DECLARE @M INT
	SET @M = (SELECT [followerCount] FROM theGram.users WHERE [userID] = @followedUserID )
	UPDATE  [theGram].[users] SET [followerCount] = @N + 1 WHERE [userID] = @followedUserID
END
EXEC [theGram].[sp_addFollower] 2,1
