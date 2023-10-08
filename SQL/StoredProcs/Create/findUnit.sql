SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE findOrCreateUnit_sp 
	@unitString nvarchar(max) 
AS
BEGIN
	SET NOCOUNT ON;
	declare @unitID int = null
	
	SELECT top(1)  @unitID = id 
	FROM Units
	WHERE UPPER(unit) = UPPER(@unitString)
	
	IF @unitID is null 
	begin
		insert into Units (unit)
		values(@unitString)
		SET @unitID = @@IDENTITY
	end

	select @unitID
END
GO
