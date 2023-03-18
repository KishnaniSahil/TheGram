-- =============================================
-- Author:      Disha Ramrakhyani
-- Create date: 17/11/2022
-- Description: like a comment
-- Parameters:
--				@messageID - ID of the message to be deleted

-- Example: EXEC [theGram].[sp_deleteMessage] 2
-- Change History:
-- =============================================

CREATE PROCEDURE [theGram].[sp_deleteMessage]
	@messageID int
AS
BEGIN
	UPDATE [theGram].[messages]
	SET [activeYN] = 0 WHERE [messageID] = @messageID
END