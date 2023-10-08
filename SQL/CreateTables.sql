DROP TABLE IF EXISTS [dbo].Recipe_Tags
GO
DROP TABLE IF EXISTS [dbo].Recipe_Categories
GO
DROP TABLE IF EXISTS [dbo].Tags
GO
DROP TABLE IF EXISTS [dbo].Categories
GO
DROP TABLE IF EXISTS [dbo].Instructions
GO
DROP TABLE IF EXISTS [dbo].Ingredients
GO
DROP TABLE IF EXISTS [dbo].Units
GO
DROP TABLE IF EXISTS [dbo].Recipes
GO

CREATE TABLE [Recipes] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [title] nvarchar(255) NOT NULL,
  [author] nvarchar(255),
  [link] nvarchar(255),
  [version] int,
  [favourite] bit DEFAULT 0
)
GO

CREATE TABLE [Ingredients] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [recipe_id] integer NOT NULL,
  [ingredient] nvarchar(255) NOT NULL,
  [amount] float NOT NULL,
  [unit_id] int NOT NULL,
  [notes] nvarchar(255)
)
GO

CREATE TABLE [Units] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [unit] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Instructions] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [recipe_id] integer NOT NULL,
  [sequence] integer NOT NULL DEFAULT (1),
  [instruction] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Categories] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [category] nvarchar(255) UNIQUE NOT NULL
)
GO

CREATE TABLE [Tags] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [tag] nvarchar(255) UNIQUE NOT NULL
)
GO

CREATE TABLE [Recipe_Categories] (
  [recipe_id] integer,
  [category_id] integer,
  PRIMARY KEY ([recipe_id], [category_id])
)
GO

CREATE TABLE [Recipe_Tags] (
  [recipe_id] integer,
  [tag_id] integer,
  PRIMARY KEY ([recipe_id], [tag_id])
)
GO

ALTER TABLE [Ingredients] ADD FOREIGN KEY ([recipe_id]) REFERENCES [Recipes] ([id])
GO

ALTER TABLE [Ingredients] ADD FOREIGN KEY ([unit_id]) REFERENCES [Units] ([id])
GO

ALTER TABLE [Instructions] ADD FOREIGN KEY ([recipe_id]) REFERENCES [Recipes] ([id])
GO

ALTER TABLE [Recipe_Categories] ADD FOREIGN KEY ([recipe_id]) REFERENCES [Recipes] ([id])
GO

ALTER TABLE [Recipe_Categories] ADD FOREIGN KEY ([category_id]) REFERENCES [Categories] ([id])
GO

ALTER TABLE [Recipe_Tags] ADD FOREIGN KEY ([recipe_id]) REFERENCES [Recipes] ([id])
GO

ALTER TABLE [Recipe_Tags] ADD FOREIGN KEY ([tag_id]) REFERENCES [Tags] ([id])
GO
