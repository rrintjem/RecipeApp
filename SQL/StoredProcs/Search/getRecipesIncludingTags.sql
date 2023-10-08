SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE getRecipesIncludingTags_sp 
	@tagIds nvarchar(max) 
AS
BEGIN
	SET NOCOUNT ON;

	declare @tagIdList TABLE (
		val int
	)
	
	insert into @tagIdList (val)
	select CAST(value as INT) as val from string_split(@tagIds,',')


	SELECT 
		id
		,title
	from Recipes
	where id in (
		select recipe_id from Recipe_Tags
		where tag_id in (
			select val from @tagIdList
		)
	)

END
GO