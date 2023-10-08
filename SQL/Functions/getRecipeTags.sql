SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION getRecipeTags_f
(	
	@recipeId int 
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
		tag
	from Tags
	WHERE id in (
		select tag_id from Recipe_Tags where recipe_id = @recipeId
	)
)
GO
