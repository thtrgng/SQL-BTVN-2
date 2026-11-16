-- =====================================================================
--  BTVN 2 - MD01 - CSDL university
--  Bài tập 1: Tạo CSDL university (4 bảng)
--  Bài tập 2: Chèn dữ liệu vào CSDL university
--  Hệ quản trị: Microsoft SQL Server (T-SQL)
-- =====================================================================

-- ---------------------------------------------------------------------
-- Tạo CSDL
-- ---------------------------------------------------------------------
CREATE DATABASE university;
GO
USE university;
GO

-- =====================================================================
-- BÀI TẬP 1: TẠO 4 BẢNG
-- =====================================================================

-- 1.1 Bảng Student
CREATE TABLE Student(
    Student_ID   int NOT NULL,
    StudentName  nvarchar(50) NOT NULL,
    StudentBirth date,
    IsMale       bit,
    CONSTRAINT pkStudent PRIMARY KEY (Student_ID)
);

-- 1.2 Bảng Professor
CREATE TABLE Professor(
    Employee_ID   int NOT NULL,
    ProfessorName nvarchar(50) NOT NULL,
    CONSTRAINT pkProfessor PRIMARY KEY (Employee_ID)
);

-- 1.3 Bảng Course (ProfessorID là khoá ngoài trỏ sang Professor.Employee_ID)
CREATE TABLE Course(
    Course_ID   int NOT NULL,
    CourseName  nvarchar(50) NOT NULL,
    ProfessorID int NOT NULL,
    CONSTRAINT pkCourse PRIMARY KEY (Course_ID),
    CONSTRAINT fkCourseProfessor FOREIGN KEY (ProfessorID) REFERENCES Professor(Employee_ID)
);

-- 1.4 Bảng Assigned (khoá chính 2 cột, đồng thời là 2 khoá ngoài)
CREATE TABLE Assigned(
    Student_ID int NOT NULL,
    Course_ID  int NOT NULL,
    Note       nvarchar(MAX),
    CONSTRAINT pkAssigned PRIMARY KEY (Student_ID, Course_ID),
    CONSTRAINT fkAssignedStudent FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    CONSTRAINT fkAssignedCourse  FOREIGN KEY (Course_ID)  REFERENCES Course(Course_ID)
);
GO

-- =====================================================================
-- BÀI TẬP 2: CHÈN DỮ LIỆU
-- (thứ tự: bảng cha trước, bảng có khoá ngoài sau)
-- =====================================================================

-- 2.1 Student
INSERT INTO Student (Student_ID, StudentName, StudentBirth, IsMale) VALUES
(1, N'A', '2000-10-01', NULL),
(2, N'B', '2000-12-01', NULL),
(3, N'C', '2000-10-10', 0),
(4, N'D', '2000-08-20', 1),
(5, N'E', '2000-05-15', NULL),
(6, N'F', '2000-05-12', NULL);

-- 2.2 Professor
INSERT INTO Professor (Employee_ID, ProfessorName) VALUES
(1, N'A'),
(2, N'B'),
(3, N'C'),
(4, N'D');

-- 2.3 Course
INSERT INTO Course (Course_ID, CourseName, ProfessorID) VALUES
(1, N'thuật toán', 1),
(2, N'toán', 2),
(3, N'vật lý', 4);

-- 2.4 Assigned
INSERT INTO Assigned (Student_ID, Course_ID, Note) VALUES
(1, 1, NULL),
(1, 2, N'Test'),
(2, 1, NULL),
(2, 3, NULL);
GO

-- =====================================================================
-- KIỂM TRA KẾT QUẢ
-- =====================================================================
SELECT * FROM Student;
SELECT * FROM Professor;
SELECT * FROM Course;
SELECT * FROM Assigned;
