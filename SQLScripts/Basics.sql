USE master
DROP DATABASE DotNetCourseDatabase

CREATE DATABASE DotNetCourseDatabase;
GO

USE DotNetCourseDatabase;
GO

CREATE SCHEMA TutorialAppSchema;
GO

CREATE TABLE TutorialAppSchema.Computer
(
    -- TableId INT  IDENTITY(Starting, Increment By) 
    ComputerId INT IDENTITY(1, 1) PRIMARY KEY
    -- , Motherboard CHAR(10) 'x' 'x         '
    -- , Motherboard VARCHAR(10) 'x' 'x'
    -- , Motherboard NVARCHAR(255) --'x'
    , Motherboard NVARCHAR(50)  --'x'
    , CPUCores INT              --NOT NULL
    , HasWifi BIT
    , HasLTE BIT
    , ReleaseDate DATETIME
    , Price DECIMAL(18, 4)
    , VideoCard NVARCHAR(50)
);
GO


SELECT * FROM  TutorialAppSchema.Computer;


INSERT INTO TutorialAppSchema.Computer 
(
[Motherboard],
[CPUCores],
[HasWifi],
[HasLTE],
[ReleaseDate],
[Price],
[VideoCard]
)
VALUES
('Sample-Motherboard'
, 4
, 1  -- true
, 0                         -- false
, GETDATE ()
, 1000.28
, 'Sample-VideoCard');


DELETE  FROM TutorialAppSchema.Computer WHERE  ComputerId = 4;

UPDATE  TutorialAppSchema.Computer
   SET  Motherboard = NULL
 WHERE  ComputerId = 1;

SELECT  [ComputerId]
        , ISNULL([Motherboard],'AA') AS Motherboard
        , [CPUCores]
        , [HasWifi]
        , [HasLTE]
        , [ReleaseDate]
        , [Price]
        , [VideoCard]
  FROM  TutorialAppSchema.Computer;

UPDATE  TutorialAppSchema.Computer
SET  CPUCores = 4
WHERE  CPUCores IS NULL;


SELECT  * FROM  TutorialAppSchema.Computer
ORDER BY     
    HasLTE DESC
    , ReleaseDate DESC;