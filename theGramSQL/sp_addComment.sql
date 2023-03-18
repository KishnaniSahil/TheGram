-- =============================================
-- Author:      Disha Ramrakhyani
-- Create date: 14/11/2022
-- Description: Comment on a post
-- Parameters:
--   @postID - ID of the post
--   @UserID - id of the User
--	 @Comment - the string that is to be added on the post as comment
     
-- Example: EXEC [theGram].[sp_addComment] 2, 2, 'amazing'
-- Change History:
-- =============================================

CREATE PROCEDURE [theGram].[sp_addComment]
	@postID int,
	@UserID int,
	@Comment varchar(1000),
	@noCommentLikes int
AS
BEGIN 
	INSERT INTO [theGram].[post_comments] 
	(
		[Comment],
		[UserID],
		[PostID],
		[noCommentLikes]
	)
	VALUES 
	(
		@Comment,
		@UserID,
		@postID,
		@noCommentLikes
	)
	DECLARE @N int
	SET @N = (SELECT [commentCount] from [theGram].[posts] where [PostID] = @postID)

	UPDATE [theGram].[posts]
		SET [commentCount] = @N + 1 where [PostID] = @postID
END