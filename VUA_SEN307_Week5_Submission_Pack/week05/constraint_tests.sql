INSERT INTO Department (dept_name) VALUES (NULL); -- NOT NULL
INSERT INTO Course (course_code,course_title,credit_units) VALUES ('TST101','Test',9); -- CHECK
INSERT INTO Student (matric_no,full_name,dept_id) VALUES ('TEST001','Test',999); -- FK
INSERT INTO Student (matric_no,full_name,gender) VALUES ('TEST002','Test','X'); -- ENUM
INSERT INTO Department (dept_name) VALUES ('Temporary Unique Test');
INSERT INTO Department (dept_name) VALUES ('Temporary Unique Test'); -- UNIQUE expected fail
DELETE FROM Department WHERE dept_name='Temporary Unique Test';
SELECT COUNT(*) FROM Department;
SELECT COUNT(*) FROM Course;
SELECT COUNT(*) FROM Student;
