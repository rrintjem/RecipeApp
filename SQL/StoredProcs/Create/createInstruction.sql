SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE createInstruction_sp 
	@recipeID int,
	@instruction nvarchar(max),
	@sequence int
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Instructions]
           ([recipe_id]
            ,[sequence]
            ,[instruction])
     VALUES
           (@recipeID
		   ,@sequence
           ,@instruction)
END
GO