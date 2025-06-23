USE DotNetCourseDatabase;
GO

CREATE OR ALTER PROCEDURE TutorialAppSchema.spUsers_Get
/*EXEC TutorialAppSchema.spUsers_Get @UserId=3*/
    @UserId INT = NULL
    , @Active BIT = NULL
AS
BEGIN

    DROP TABLE IF EXISTS #AverageDeptSalary

    SELECT UserJobInfo.Department
        , AVG(UserSalary.Salary) AvgSalary
        INTO #AverageDeptSalary
    FROM TutorialAppSchema.Users AS Users 
        LEFT JOIN TutorialAppSchema.UserSalary AS UserSalary
            ON UserSalary.UserId = Users.UserId
        LEFT JOIN TutorialAppSchema.UserJobInfo AS UserJobInfo
            ON UserJobInfo.UserId = Users.UserId
        GROUP BY UserJobInfo.Department

    CREATE CLUSTERED INDEX cix_AverageDeptSalary_Department ON #AverageDeptSalary(Department)

    SELECT 
        [Users].[UserId],
        [Users].[FirstName],
        [Users].[LastName],
        [Users].[Email],
        [Users].[Gender],
        [Users].[Active],
        UserSalary.Salary,
        UserJobInfo.Department,
        UserJobInfo.JobTitle,
        AvgSalary.AvgSalary
    FROM TutorialAppSchema.Users AS Users 
        LEFT JOIN TutorialAppSchema.UserSalary AS UserSalary
            ON UserSalary.UserId = Users.UserId
        LEFT JOIN TutorialAppSchema.UserJobInfo AS UserJobInfo
            ON UserJobInfo.UserId = Users.UserId
        LEFT JOIN #AverageDeptSalary AS AvgSalary
            ON AvgSalary.Department = UserJobInfo.Department

        WHERE Users.UserId = ISNULL(@UserId, Users.UserId)
              AND ISNULL(Users.Active, 0) = COALESCE(@Active, Users.Active, 0)
END