-- Creating the Teachers table
CREATE TABLE Teachers1 (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    subject NVARCHAR(50)
);

-- Inserting sample data into the Teachers table
INSERT INTO Teachers1 (id, name, subject)
VALUES
    (101, 'Mr. Smith', 'Mathematics'),
    (102, 'Mrs. Johnson', 'English'),
    (103, 'Ms. Davis', 'Science');



-- Creating the Students table
CREATE TABLE Students1 (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    gender NVARCHAR(10),
    age INT,
    standard INT,
    teacherid INT,
    CONSTRAINT FK_Teacher FOREIGN KEY (teacherid) REFERENCES Teachers(id) -- Assuming there is a Teachers table with an 'id' column
);

-- Inserting sample data into the Students table
INSERT INTO Students1 (id, name, gender, age, standard, teacherid)
VALUES
    (1, 'John Doe', 'Male', 18, 10, 101),  -- Assuming teacher with id 101
    (2, 'Jane Smith', 'Female', 17, 11, 102),  -- Assuming teacher with id 102
    (3, 'Bob Johnson', 'Male', 16, 9, 103);  -- Assuming teacher with id 103






-- Creating an inline table-valued function
CREATE FUNCTION fn_GetStudentWithAge1
(
    @targetAge INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Students1
    WHERE age = @targetAge
        AND @targetAge > 0 -- Validation: Check if @targetAge is a positive integer
);

-- Example usage of the function
SELECT *
FROM dbo.fn_GetStudentWithAge1(18);

----------------------------------------------------------------------------------------------
-- Creating an inline table-valued function for age range
CREATE FUNCTION fn_GetStudentsInAgeRange
(
    @minAge INT,
    @maxAge INT
)x
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Students1
    WHERE age BETWEEN @minAge AND @maxAge
        AND @minAge > 0 AND @maxAge > @minAge -- Validation for positive integers and a valid age range
);

-- Example usage of the function for age range 15 to 20
SELECT *
FROM dbo.fn_GetStudentsInAgeRange(15, 20);

--------------------------------------------------------------------------------------------------------------

-- Creating an inline table-valued function for gender
CREATE FUNCTION fn_GetStudentsByGender
(
    @targetGender NVARCHAR(10)
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Students1
    WHERE gender = @targetGender
        AND @targetGender IN ('Male', 'Female') -- Validation for allowed gender values
);

-- Example usage of the function for gender 'Female'
SELECT *
FROM dbo.fn_GetStudentsByGender('Female');

-----------------------------------------------------------------------------------------------------------

-- Creating a complex inline table-valued function
CREATE FUNCTION fn_GetStudentsWithCriteria
(
    @minAge INT,
    @maxAge INT,
    @targetGender NVARCHAR(10),
    @targetStandard INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Students1
    WHERE age BETWEEN @minAge AND @maxAge
        AND gender = @targetGender
        AND standard = @targetStandard
        AND @minAge > 0 AND @maxAge > @minAge -- Validation for positive integers and a valid age range
        AND @targetGender IN ('Male', 'Female') -- Validation for allowed gender values
);

-- Example usage of the function with multiple criteria
SELECT *
FROM dbo.fn_GetStudentsWithCriteria(15, 18, 'Male', 10);


-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------

-- Creating the Students table
CREATE TABLE Students2 (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    gender NVARCHAR(10),
    age INT,
    standard INT,
    teacherid INT,
    CONSTRAINT FK_Teacher2 FOREIGN KEY (teacherid) REFERENCES Teachers2(id)
);

-- Creating the Teachers table
CREATE TABLE Teachers2 (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    subject NVARCHAR(50)
);

-- Creating the ExamScores table
CREATE TABLE ExamScores (
    student_id INT,
    subject NVARCHAR(50),
    score INT,
    PRIMARY KEY (student_id, subject),
    FOREIGN KEY (student_id) REFERENCES Students2(id)
);

-- Inserting sample data into the Students table
INSERT INTO Students2 (id, name, gender, age, standard, teacherid)
VALUES
    (1, 'John Doe', 'Male', 18, 10, 101),
    (2, 'Jane Smith', 'Female', 17, 11, 102),
    (3, 'Bob Johnson', 'Male', 16, 9, 103);

-- Inserting sample data into the Teachers table
INSERT INTO Teachers2 (id, name, subject)
VALUES
    (101, 'Mr. Smith', 'Mathematics'),
    (102, 'Mrs. Johnson', 'English'),
    (103, 'Ms. Davis', 'Science');

-- Inserting sample data into the ExamScores table
INSERT INTO ExamScores (student_id, subject, score)
VALUES
    (1, 'Mathematics', 95),
    (2, 'Mathematics', 88),
    (3, 'Mathematics', 92),
    (1, 'English', 85),
    (2, 'English', 90),
    (3, 'English', 87),
    (1, 'Science', 94),
    (2, 'Science', 91),
    (3, 'Science', 89);


----------------------------------------

-- Creating a more complex inline table-valued function
CREATE FUNCTION fn_GetHighScoringStudents
(
    @subject NVARCHAR(50),
    @minScore INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        s.id AS StudentID,
        s.name AS StudentName,
        s.gender,
        s.age,
        s.standard,
        t.name AS TeacherName,
        t.subject AS TeacherSubject,
        es.score
    FROM
        Students2 s
    JOIN
        Teachers2 t ON s.teacherid = t.id
    JOIN
        ExamScores es ON s.id = es.student_id
    WHERE
        es.subject = @subject
        AND es.score > @minScore
);

-- Example usage of the function with subject 'Mathematics' and minimum score 90
SELECT *
FROM dbo.fn_GetHighScoringStudents('Mathematics', 90);

