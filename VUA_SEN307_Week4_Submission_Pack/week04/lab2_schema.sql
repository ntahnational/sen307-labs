-- VUA-SEN307 Week 4 Practical
-- Name: NTAH CHIDERA ISAAC
-- Matric No.: VUG-SEN-24-11663

CREATE TABLE IF NOT EXISTS Department (
  dept_id INT NOT NULL AUTO_INCREMENT,
  dept_name VARCHAR(100) NOT NULL UNIQUE,
  PRIMARY KEY (dept_id)
);

CREATE TABLE IF NOT EXISTS Student (
  student_id INT NOT NULL AUTO_INCREMENT,
  matric_no VARCHAR(30) NOT NULL UNIQUE,
  full_name VARCHAR(100) NOT NULL,
  dept_id INT NOT NULL,
  PRIMARY KEY (student_id),
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE IF NOT EXISTS Lecturer (
  lecturer_id INT NOT NULL AUTO_INCREMENT,
  lecturer_name VARCHAR(100) NOT NULL,
  dept_id INT NOT NULL,
  PRIMARY KEY (lecturer_id),
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE IF NOT EXISTS Course (
  course_id INT NOT NULL AUTO_INCREMENT,
  course_code VARCHAR(20) NOT NULL UNIQUE,
  course_title VARCHAR(100) NOT NULL,
  PRIMARY KEY (course_id)
);

CREATE TABLE IF NOT EXISTS Enrolment (
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  session VARCHAR(9) NOT NULL,
  PRIMARY KEY (student_id, course_id, session),
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE IF NOT EXISTS TeachingAssignment (
  lecturer_id INT NOT NULL,
  course_id INT NOT NULL,
  session VARCHAR(9) NOT NULL,
  PRIMARY KEY (lecturer_id, course_id, session),
  FOREIGN KEY (lecturer_id) REFERENCES Lecturer(lecturer_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
