SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION getRecipeCategories_f
(	
	@recipeId int 
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
		category
	from Categories
	WHERE id in (
		select category_id from Recipe_Categories where recipe_id = @recipeId
	)
)
GO
