-- =============================================
-- Author:      Disha Ramrakhyani
-- Create date: 14/11/2022
-- Description: add post
--
-- Parameters:
--				@userID- ID of the user
-- 				@postLocation- path to where the picture is stored
--				@caption- caption for the post

     
-- Example: EXEC [theGram].[sp_addPost] 1, '', 'my first post'

-- =============================================

CREATE PROCEDURE [theGram].[sp_addPost]
	@userID int,
	@postLocation nvarchar(max),
	@caption varchar(2000)
AS
BEGIN
	INSERT INTO [theGram].[POSTS]
	(
		[userID],
		[postLocation],
		[caption]
	)
	VALUES
	(
		@userID,
		@postLocation,
		@caption
	)
END