-- =============================================
-- Author:      Disha Ramrakhyani
-- Create date: 14/11/2022
-- Description: Comment on a post
-- Parameters:
--   @commentID- comment ID to be deleted
     
-- Example: EXEC [theGram].[sp_deleteComment] 2, 2
-- Change History:
-- =============================================

CREATE PROCEDURE [theGram].[sp_deleteComment]
	@commentID int
AS
BEGIN 
	UPDATE [theGram].[post_comments] 
	SET [activeYN] = 0 WHERE [commentID] = @commentID
END