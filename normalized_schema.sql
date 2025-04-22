-- Normalized Schema for Student Enrollment System

-- Drop tables if they exist
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;

-- 1. Students Table (3NF)
CREATE TABLE students (
    student_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    major VARCHAR(50) NOT NULL,
    enrollment_date DATE NOT NULL
);

-- 2. Instructors Table (3NF)
CREATE TABLE instructors (
    instructor_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL
);

-- 3. Courses Table (3NF)
CREATE TABLE courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INTEGER NOT NULL
);

-- 4. Classes Table (3NF)
CREATE TABLE classes (
    class_id VARCHAR(10) PRIMARY KEY,
    course_id VARCHAR(10) NOT NULL,
    instructor_id VARCHAR(10) NOT NULL,
    schedule VARCHAR(100) NOT NULL,
    semester VARCHAR(20) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);

-- 5. Enrollments Table (3NF)
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id VARCHAR(10) NOT NULL,
    class_id VARCHAR(10) NOT NULL,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id),
    UNIQUE (student_id, class_id)  -- A student can't enroll in the same class twice
);

-- Sample data for testing the normalized schema

-- Insert students
INSERT INTO students VALUES
    ('S001', 'John Doe', 'Computer Science', '2023-01-15'),
    ('S002', 'Jane Smith', 'Mathematics', '2023-01-15');

-- Insert instructors
INSERT INTO instructors VALUES
    ('I001', 'Dr. Smith', 'Computer Science'),
    ('I002', 'Dr. Johnson', 'Mathematics');

-- Insert courses
INSERT INTO courses VALUES
    ('CS101', 'Introduction to Programming', 3),
    ('MATH101', 'Calculus I', 4);

-- Insert classes
INSERT INTO classes VALUES
    ('CL001', 'CS101', 'I001', 'Mon/Wed 10:00-11:30', 'Spring 2023'),
    ('CL002', 'MATH101', 'I002', 'Tue/Thu 13:00-14:30', 'Spring 2023');

-- Insert enrollments
INSERT INTO enrollments (student_id, class_id, grade) VALUES
    ('S001', 'CL001', 'A'),
    ('S001', 'CL002', 'B+'),
    ('S002', 'CL001', 'A-');

-- Example queries to demonstrate relationships

-- 1. List all courses a student is enrolled in
SELECT s.name AS student_name, c.course_name, cl.schedule, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN classes cl ON e.class_id = cl.class_id
JOIN courses c ON cl.course_id = c.course_id
WHERE s.student_id = 'S001';

-- 2. List all students in a specific course
SELECT s.name AS student_name, c.course_name, i.name AS instructor_name, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN classes cl ON e.class_id = cl.class_id
JOIN courses c ON cl.course_id = c.course_id
JOIN instructors i ON cl.instructor_id = i.instructor_id
WHERE c.course_id = 'CS101'; 