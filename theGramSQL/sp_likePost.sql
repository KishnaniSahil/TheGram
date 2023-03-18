-- =============================================
-- Author:      Disha Ramrakhyani
-- Create date: 14/11/2022
-- Description: like post
-- Parameters:
--				@userID - userID
--				@postID - postID

-- Example: EXEC [blog].[sp_likePost] 2,1
-- Change History:
-- =============================================

CREATE PROCEDURE [theGram].[sp_likePost]
	@postID INT,
	@userID INT
	
AS
BEGIN
	DECLARE @N INT
	SET @N = (SELECT [likeCount] FROM theGram.posts WHERE PostID = @postID )
	UPDATE  [theGram].[posts] SET [likeCount] = @N + 1 WHERE PostID = @postID
	INSERT INTO [theGram].[post_likes] 
	VALUES 
	(@userID, @postID)
END
