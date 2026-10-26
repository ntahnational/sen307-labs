# VUA-SEN307 Database Systems — Week 4 Practical
## Lab 2: Database Design and Normalization
**Name:** NTAH CHIDERA ISAAC  
**Matric No.:** VUG-SEN-24-11663

## Unnormalized registration table (UNF)
The original registration sheet contains multiple course codes, course titles, lecturers and lecturer departments in single cells.

| Matric No. | Student Name | Student Dept. | Course Codes | Course Titles | Lecturers | Lecturer Depts. | Session |
|---|---|---|---|---|---|---|---|
| 20231234 | Ada Obi | Software Engineering | SEN307, SEN301 | Database Systems, Software Architecture | Dr A. Okafor, Dr M. Bello | Software Eng., Software Eng. | 2026/2027 |
| 20231235 | John Musa | Computer Science | SEN307, COS301 | Database Systems, Operating Systems | Dr A. Okafor, Mrs F. Eze | Software Eng., Computer Sci. | 2026/2027 |
| 20231236 | Grace Okon | Software Engineering | SEN301 | Software Architecture | Dr M. Bello | Software Eng. | 2026/2027 |

## First Normal Form (1NF)
Each student-course pair has its own row. Primary key: **(matric_no, course_code, session)**.

| Matric No. | Student Name | Student Dept. | Course Code | Course Title | Lecturer | Lecturer Dept. | Session |
|---|---|---|---|---|---|---|---|
| 20231234 | Ada Obi | Software Engineering | SEN307 | Database Systems | Dr A. Okafor | Software Eng. | 2026/2027 |
| 20231234 | Ada Obi | Software Engineering | SEN301 | Software Architecture | Dr M. Bello | Software Eng. | 2026/2027 |
| 20231235 | John Musa | Computer Science | SEN307 | Database Systems | Dr A. Okafor | Software Eng. | 2026/2027 |
| 20231235 | John Musa | Computer Science | COS301 | Operating Systems | Mrs F. Eze | Computer Sci. | 2026/2027 |
| 20231236 | Grace Okon | Software Engineering | SEN301 | Software Architecture | Dr M. Bello | Software Eng. | 2026/2027 |

**Explanation:** First Normal Form was achieved by removing multi-valued cells and giving each student-course combination its own row so that each cell contains only one value.

## Second Normal Form (2NF)
**Student(matric_no PK, student_name, student_dept)**

| Matric No. | Student Name | Student Dept. |
|---|---|---|
| 20231234 | Ada Obi | Software Engineering |
| 20231235 | John Musa | Computer Science |
| 20231236 | Grace Okon | Software Engineering |

**Course(course_code PK, course_title)**

| Course Code | Course Title |
|---|---|
| SEN307 | Database Systems |
| SEN301 | Software Architecture |
| COS301 | Operating Systems |

**Enrolment(matric_no PK/FK, course_code PK/FK, session PK)**

| Matric No. | Course Code | Session |
|---|---|---|
| 20231234 | SEN307 | 2026/2027 |
| 20231234 | SEN301 | 2026/2027 |
| 20231235 | SEN307 | 2026/2027 |
| 20231235 | COS301 | 2026/2027 |
| 20231236 | SEN301 | 2026/2027 |

**Explanation:** Second Normal Form was achieved by separating student and course details from enrolment records to remove partial dependencies on the composite key.

## Third Normal Form (3NF) — Final schema
- **Department** (dept_id **PK**, dept_name)
- **Student** (student_id **PK**, matric_no **UNIQUE**, full_name, dept_id **FK** → Department.dept_id)
- **Lecturer** (lecturer_id **PK**, lecturer_name, dept_id **FK** → Department.dept_id)
- **Course** (course_id **PK**, course_code **UNIQUE**, course_title)
- **Enrolment** (student_id **PK/FK** → Student.student_id, course_id **PK/FK** → Course.course_id, session **PK**)
- **TeachingAssignment** (lecturer_id **PK/FK** → Lecturer.lecturer_id, course_id **PK/FK** → Course.course_id, session **PK**)

**Department data:** (1, Software Engineering); (2, Computer Science).  
**Lecturer data:** (1, Dr A. Okafor, dept_id 1); (2, Dr M. Bello, dept_id 1); (3, Mrs F. Eze, dept_id 2).  
**Teaching assignments for 2026/2027:** (lecturer 1, course SEN307); (lecturer 2, course SEN301); (lecturer 3, course COS301).

**Explanation:** Third Normal Form was achieved by moving department details into Department, linking students and lecturers to departments with foreign keys, and using TeachingAssignment to record which lecturer teaches which course in each session.
