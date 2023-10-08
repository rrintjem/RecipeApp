SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION getRecipeInstructions_f
(	
	@recipeId int 
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
		[sequence]
		,instruction
	from Instructions
	WHERE recipe_id = @recipeId

)
GO
