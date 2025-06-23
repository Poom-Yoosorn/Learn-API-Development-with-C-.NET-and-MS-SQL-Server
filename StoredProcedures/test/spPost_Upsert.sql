USE DotNetCourseDatabase
GO

CREATE OR ALTER PROCEDURE TutorialAppSchema.spPosts_Upsert
/*EXEC TutorialAppSchema.spPosts_Upsert @UserId = 1, @PostTitle = 'PoomTitleAdjust', @PostContent = 'PoomContent', @PostId = 4*/
    @UserId INT
    , @PostTitle NVARCHAR(255)
    , @PostContent NVARCHAR(MAX)
    , @PostId INT = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM TutorialAppSchema.Posts WHERE PostId = @PostId)
        BEGIN
            INSERT INTO TutorialAppSchema.Posts(
                [UserId],
                [PostTitle],
                [PostContent],
                [PostCreated],
                [PostUpdated]
            ) VALUES (
                @UserId,
                @PostTitle,
                @PostContent,
                GETDATE(),
                GETDATE()
            )
        END
    ELSE
        BEGIN
            UPDATE TutorialAppSchema.Posts 
                SET PostTitle = @PostTitle,
                    PostContent = @PostContent,
                    PostUpdated = GETDATE()
                WHERE PostId = @PostId AND UserId = @UserId
        END
END

