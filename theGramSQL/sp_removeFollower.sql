-- =============================================
-- Author:      Disha Ramrakhyani
-- Create date: 14/11/2022
-- Description: add a new follower
-- Parameters:
--				@userID - ID of the user
--				@followedUserID- ID of another user that the user has followed

-- Example: EXEC [theGram].[sp_removeFollower] 2,1
-- Change History:
-- =============================================

CREATE PROCEDURE [theGram].[sp_removeFollower]
	@userID int,
	@followedUserID int
	
AS
BEGIN
	DELETE FROM [theGram].[followers] WHERE [userID] = @userID AND [followedUserID] = @followedUserID
	DECLARE @N INT
	SET @N = (SELECT [followingCount] FROM [theGram].[users] WHERE [userID] = @userID)
	UPDATE  [theGram].[users] SET [followingCount] = @N - 1 WHERE [userID] = @userID
	DECLARE @M INT
	SET @M = (SELECT [followerCount] FROM theGram.users WHERE [userID] = @followedUserID )
	UPDATE  [theGram].[users] SET [followerCount] = @N - 1 WHERE [userID] = @followedUserID
END
