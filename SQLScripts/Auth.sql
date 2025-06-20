USE DotNetCourseDatabase

CREATE TABLE TutorialAppSchema.Auth(
	Email NVARCHAR(50) PRIMARY KEY,
	PasswordHash VARBINARY(MAX),
	PasswordSalt VARBINARY(MAX)
)


SELECT * FROM TutorialAppSchema.Auth WHERE Email = ''
SELECT * FROM TutorialAppSchema.Users WHERE FirstName = 'Test2'

INSERT INTO TutorialAppSchema.Auth  
([Email],[PasswordHash],[PasswordSalt]) 
VALUES ('userForRegistration.Email', @PasswordHash, @PasswordSalt)
