USE DotNetCourseDatabase

CREATE TABLE TutorialAppSchema.Posts (
    PostId INT IDENTITY(1,1),
    UserId INT,
    PostTitle NVARCHAR(255),
    PostContent NVARCHAR(MAX),
    PostCreated DATETIME,
    PostUpdated DATETIME
)

CREATE CLUSTERED INDEX cix_Posts_UserId_PostId ON TutorialAppSchema.Posts(UserId, PostId)

SELECT [PostId],
[UserId],
[PostTitle],
[PostContent],
[PostCreated],
[PostUpdated] FROM TutorialAppSchema.Posts

INSERT INTO TutorialAppSchema.Posts(
                [UserId],
                [PostTitle],
                [PostContent],
                [PostCreated],
                [PostUpdated]) VALUES (,'','', GETDATE(), GETDATE())


UPDATE TutorialAppSchema.Posts 
                    SET UserId = 1
                    WHERE PostId = 1


SELECT * FROM TutorialAppSchema.Posts
    WHERE PostTitle LIKE '%Poqom%' OR PostContent LIKE '%Poom%'