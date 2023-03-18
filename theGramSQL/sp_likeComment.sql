-- =============================================
-- Author:      Disha Ramrakhyani
-- Create date: 17/11/2022
-- Description: like a comment
-- Parameters:
--   @userID - ID of the user
--   @commentID - ID of the comment

-- Example: EXEC [theGram].[sp_likeComment] 2,1
-- Change History:
-- =============================================

CREATE PROCEDURE [theGram].[sp_likeComment]
	@userID INT ,
	@commentID INT 
	
AS
BEGIN
	DECLARE @N INT
	SET @N = (SELECT [noCommentLikes] FROM theGram.post_comments WHERE commentID = @commentID )
	UPDATE  [theGram].[post_comments] SET [noCommentLikes] = @N + 1 WHERE commentID = @commentID
	INSERT INTO theGram.comment_likes VALUES (@userID,@commentID)

END