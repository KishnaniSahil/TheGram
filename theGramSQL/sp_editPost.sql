-- =============================================
-- Author:      Disha Ramrakhyani
-- Create date: 14/11/2022
-- Description: add post
--
-- Parameters:
--				@postID- ID of the post to be edited
--				@userID- ID of the user
-- 				@postLocation- path to where the picture is stored
--				@caption- caption for the post

     
-- Example: EXEC [theGram].[sp_editPost] 1, '', 'my first post'

-- =============================================

CREATE PROCEDURE [theGram].[sp_editPost]
	@postID int,
	@userID int,
	@postLocation nvarchar(max),
	@caption varchar(2000)
AS
BEGIN
	UpDATE [theGram].[POSTS]
	SET
		[userID] = @userID,
		[postLocation] = @postLocation,
		[caption] = @caption WHERE [postID] = @postID
END