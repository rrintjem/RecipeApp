SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE getRecipesWithAllTags_sp 
	@tagIds nvarchar(max) 
AS
BEGIN
	SET NOCOUNT ON;

	declare @recipeIdList TABLE (
		val int
	)
	
	insert into @recipeIdList (val)
	select recipe_id as val from Recipe_Tags 
	where tag_id IN (select CAST(value as INT) from string_split(@tagIds,','))
	
	
	declare @tagCount int
	select @tagCount = count(*) from string_split(@tagIds,',')

	SELECT 
		id
		,title
	from Recipes
	where id in (select val from @recipeIdList)
	and @tagCount = (select count(*) from @recipeIdList where val = id)
	

END
GO