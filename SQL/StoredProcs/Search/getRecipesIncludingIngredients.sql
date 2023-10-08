SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE getRecipesIncludingIngredients_sp 
	@ingredientCSV nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;

	declare @ingredientList TABLE (
		val nvarchar(max)
	)
	
	insert into @ingredientList (val)
	select LOWER(value) as val from string_split(@ingredientCSV,',')

	SELECT 
		id
		,title
	from Recipes
	where id in (
		select recipe_id from Ingredients
		where LOWER(ingredient) in  (
			select val from @ingredientList
		)
	)



END
GO