SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE createRecipe_sp 
	@title nvarchar(max),
	@author nvarchar(max) = null,
	@link nvarchar(max) = null,
	@version int = 1,
	@favourite bit = 0
AS
BEGIN
	SET NOCOUNT ON;

	declare @recipeID int = null
	INSERT INTO [dbo].[Recipes]
        ([title]
        ,[author]
        ,[link]
        ,[version]
        ,[favourite])
     VALUES
           (@title
           ,@author
           ,@link
           ,@version
           ,@favourite)
	SET @recipeID  = @@IDENTITY
	
	select @recipeID
END
GO