-- Unnormalized Schema for Student Enrollment System

CREATE TABLE student_enrollment (
    -- Student Information
    student_id VARCHAR(10),
    student_name VARCHAR(100),
    student_major VARCHAR(50),
    student_enrollment_date DATE,
    
    -- Course Information
    course_id VARCHAR(10),
    course_name VARCHAR(100),
    course_credits INTEGER,
    
    -- Enrollment Information
    semester VARCHAR(20),
    grade VARCHAR(2),
    
    -- Instructor Information
    instructor_id VARCHAR(10),
    instructor_name VARCHAR(100),
    instructor_department VARCHAR(50),
    
    -- Class/Section Information
    class_id VARCHAR(10),
    class_schedule VARCHAR(100)
);

-- Sample data to demonstrate redundancy and repeating groups
INSERT INTO student_enrollment VALUES
    ('S001', 'John Doe', 'Computer Science', '2023-01-15', 
     'CS101', 'Introduction to Programming', 3,
     'Spring 2023', 'A',
     'I001', 'Dr. Smith', 'Computer Science',
     'CL001', 'Mon/Wed 10:00-11:30'),
     
    ('S001', 'John Doe', 'Computer Science', '2023-01-15',
     'MATH101', 'Calculus I', 4,
     'Spring 2023', 'B+',
     'I002', 'Dr. Johnson', 'Mathematics',
     'CL002', 'Tue/Thu 13:00-14:30'),
     
    ('S002', 'Jane Smith', 'Mathematics', '2023-01-15',
     'CS101', 'Introduction to Programming', 3,
     'Spring 2023', 'A-',
     'I001', 'Dr. Smith', 'Computer Science',
     'CL001', 'Mon/Wed 10:00-11:30'); 