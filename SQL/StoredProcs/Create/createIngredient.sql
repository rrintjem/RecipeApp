SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE createIngredient_sp 
	@recipeID int,
	@ingredient nvarchar(max),
	@amount FLOAT,
	@unit_id int,
	@notes nvarchar(max) = null
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Ingredients]
           ([recipe_id]
           ,[ingredient]
           ,[amount]
           ,[unit_id]
           ,[notes])
     VALUES
           (@recipeID
           ,@ingredient
           ,@amount
           ,@unit_id
           ,@notes)
END
GO