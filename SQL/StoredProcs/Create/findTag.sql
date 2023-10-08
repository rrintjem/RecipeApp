SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE findOrCreateTag_sp 
	@tagString nvarchar(max) 
AS
BEGIN
	SET NOCOUNT ON;
	declare @tagID int = null
	
	SELECT top(1)  @tagID = id 
	FROM Tags
	WHERE UPPER(tag) = UPPER(@tagString)
	
	IF @tagID is null 
	begin
		insert into Tags (tag)
		values(@tagString)
		SET @tagID = @@IDENTITY
	end

	select @tagID
END
GO
