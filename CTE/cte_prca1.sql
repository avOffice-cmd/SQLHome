create database CTE_practice;

-- Creating the Students table
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    gender NVARCHAR(10),
    age INT,
    standard INT,
    teacherid INT,
    CONSTRAINT FK_Teacher FOREIGN KEY (teacherid) REFERENCES Teachers(id)
);

-- Creating the Teachers table
CREATE TABLE Teachers (
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
    FOREIGN KEY (student_id) REFERENCES Students(id)
);

-- Inserting sample data into the Students table
INSERT INTO Students (id, name, gender, age, standard, teacherid)
VALUES
    (1, 'John Doe', 'Male', 18, 10, 101),
    (2, 'Jane Smith', 'Female', 17, 11, 102),
    (3, 'Bob Johnson', 'Male', 16, 9, 103);

-- Inserting sample data into the Teachers table
INSERT INTO Teachers (id, name, subject)
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

-- Using a CTE to retrieve high-scoring students in a specific subject
WITH HighScorersCTE AS (
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
        Students s
    JOIN
        Teachers t ON s.teacherid = t.id
    JOIN
        ExamScores es ON s.id = es.student_id
    WHERE
        es.subject = 'Mathematics'
        AND es.score > 90
)
SELECT *
FROM HighScorersCTE;
