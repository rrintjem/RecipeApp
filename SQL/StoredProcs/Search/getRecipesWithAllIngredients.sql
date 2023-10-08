SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE getRecipesIncludingIngredients_sp 
	@ingredientCSV nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;

	declare @recipeIdList TABLE (
		val int
	)
	
	insert into @recipeIdList (val)
	select recipe_id as val from Ingredients
	where LOWER(ingredient) in (
		select LOWER(value) from string_split(@ingredientCSV,',')
	)

	declare @ingredientCount int
	select @ingredientCount = count(*) from string_split(@ingredientCSV,',')

	SELECT 
		id
		,title
	from Recipes
	where id in (select val from @recipeIdList)
	and @ingredientCount = (select count(*) from @recipeIdList where val = id)



END
GO