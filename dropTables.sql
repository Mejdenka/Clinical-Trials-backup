DECLARE @strSQLDrop Varchar(MAX) = '';
DECLARE @strSQLConstraints Varchar(MAX) = '';

SELECT @strSQLConstraints = @strSQLConstraints + 'ALTER TABLE' + QUOTENAME(name) + 'NOCHECK CONSTRAINT ALL; '
  FROM sys.objects 
  WHERE type = 'U'
  AND name NOT IN ('Tags', 'TagLists', '__EFMigrationsHistory');

SELECT @strSQLDrop = @strSQLDrop + 'DROP TABLE ' + QUOTENAME(name) + '; '
  FROM sys.objects 
  WHERE type = 'U'
  AND name NOT IN ('Tags', 'TagLists', '__EFMigrationsHistory')
  ORDER BY name;

  EXEC (@strSQLConstraints)
  EXEC (@strSQLDrop)
