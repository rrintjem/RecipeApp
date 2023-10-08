SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION getRecipeIngredients_f
(	
	@recipeId int 
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
		ingredient
		,amount
		,unit
		,notes
	from Ingredients
	LEFT JOIN Units ON unit_id = Units.id
	WHERE recipe_id = @recipeId
)
GO
