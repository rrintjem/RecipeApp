SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE getAllRecipesInCategory_sp 
	@categoryIds nvarchar(max) 
AS
BEGIN
	SET NOCOUNT ON;

	declare @categoryIdList TABLE (
		val int
	)
	
	insert into @categoryIdList (val)
	select CAST(value as INT) as val from string_split(@categoryIds,',')

	SELECT 
		id
		,title
	from Recipes
	where id in (
		select recipe_id from Recipe_Categories
		where category_id in (
			select val from @categoryIdList
		)
	)

END
GO
