--DROP TABLES--
DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Course_Sections;
DROP TABLE IF EXISTS Student_Record;
DROP TABLE IF EXISTS Enrollment_Record;

--CREATE TABLES--
CREATE TABLE Professor(
	ssn_number VARCHAR(30) NOT NULL,	 
	firstname VARCHAR(30) NOT NULL,
	lastname VARCHAR(30) NOT NULL,
	street_address VARCHAR(30) NOT NULL,
	city VARCHAR(30) NOT NULL,
	stateloc VARCHAR(30) NOT NULL,
	zip_code VARCHAR(10) NOT NULL,
	telephone_number VARCHAR(15) NOT NULL,
	 
	gender VARCHAR(10),
	title VARCHAR(40),
	salary VARCHAR(40),
	college_degrees VARCHAR(40),
	reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
CREATE TABLE Department(
	chairperson_id int FOREIGN KEY REFERENCES Professor(Professor_ID)
	dept_id VARCHAR(4) PRIMARY KEY,
	dname VARCHAR(30) NOT NULL,
	telephone VARCHAR(30) NOT NULL,
	office_location VARCHAR(50),
	reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
 
CREATE TABLE Course(
	course_dept_id int FOREIGN KEY REFERENCES Department(Dept_ID)
	course_id VARCHAR(8) PRIMARY KEY,
	course_title VARCHAR(30) NOT NULL,
	course_textbook VARCHAR(30) NOT NULL,
	course_units INT(1),
	prerequisite_courses VARCHAR(50),
	reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
CREATE TABLE Course_Sections(
	professor_id int FOREIGN KEY REFERENCES Department(Professor_id)
	course_num VARCHAR(8) FOREIGN KEY REFERENCES Course(course_id)
	course_section_number INT(6) PRIMARY KEY,
	classroom VARCHAR(30) NOT NULL,
	no_of_seats INT(2) NOT NULL,
	meeting_days VARCHAR(50),
	beginning_time VARCHAR(5),
	ending_time VARCHAR(5),
	reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
CREATE TABLE Student_Record(
	campus_wide_ID INT(9) PRIMARY KEY,
	firstname VARCHAR(30) NOT NULL,
	lastname VARCHAR(30) NOT NULL,
	addr VARCHAR(50),
	telephone VARCHAR(5),
	major_department VARCHAR(5) FOREIGN KEY REFERENCES Department(Dept_id),
	minor_dept_id VARCHAR(5) FOREIGN KEY REFERENCES Department(Dept_id),
	reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
 
CREATE TABLE Enrollment_Record(
	campus_wide_ID INT(6) FOREIGN KEY REFERENCES Student_record(campus_wide_ID),
	course_number VARCHAR(30) FOREIGN KEY REFERENCES Course(course_id),
	course_section VARCHAR(30) FOREIGN KEY REFERENCES Course_Sections(course_section_number),
	grade VARCHAR(30) NOT NULL
	cur_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

--INSERT DATA

--PROFESSOR
INSERT INTO Professor VALUES ('298-14-8403', 'Pixie', 'Glenn', '304 Charles Street', 'Los Angeles', 'CA', '90037', '949-818-7117', 'Female', 'Assistant Professor', '$47,768 ', 'Bachelor of Science: Computer Science');
INSERT INTO Professor VALUES ('360-27-5590', 'Ayrton', 'Briggs', '7217 Park Road', 'Riverside', 'CA', '92503', '949-952-1357 ', 'Male', 'Full Professor', '$85,230', 'Bachelor of Arts: Mathematics');
INSERT INTO Professor VALUES ('696-34-6531', 'Carmen', 'Krause', '7 North Arch St.', 'Huntington Park', 'CA', '90255', '949-546-7580', 'Non-Binary', 'Associate Professor', '$84,340', 'Bachelor of Science: Mechanical Engineering');

--DEPARTMENT
INSERT INTO Department VALUES ('360-27-5590', 'EGGN', 'Department of Engineering', '949-278-3514', 'Fullerton Campus');
INSERT INTO Department VALUES ('298-14-8403', 'CPSC', 'Department of Computer Science', '949-278-5987', 'Fullerton Campus');
INSERT INTO Department VALUES ('696-34-6531', 'MATH', 'Department of Mathematics', '949-278-3888', 'Fullerton Campus');

--COURSE
INSERT INTO Course VALUES ('CPSC', 'CPSC 332', 'File Structures and Database Systems', 'Fundamentals of Database Systems', '3', 'CPSC 131');
INSERT INTO Course VALUES ('CPSC', 'CPSC 335', 'Algorithm Engineering', 'Algorithms', '3', 'CPSC 131, MATH 270B');
INSERT INTO Course VALUES ('EGGN', 'EGGN 101', 'Introduction to Engineering', 'Introduction to Engineering', '3', '');
INSERT INTO Course VALUES ('MATH', 'MATH 338', 'Statistics Applied to Natural Sciences', 'Statistics in Science', '3', 'MATH 150B');

--COURSE_SECTIONS
INSERT INTO Course_Sections VALUES ('298-14-8403', 'CPSC 332', '1', 'CS-100', '40', 'M W', '8:00am', '9:45am');
INSERT INTO Course_Sections VALUES ('696-34-6531', 'EGGN 101', '1', 'CS-101', '35', 'M W', '10:00am', '11:45am');
INSERT INTO Course_Sections VALUES ('298-14-8403', 'CPSC 332', '2', 'CS-100', '40', 'T TH', '10:00am', '11:45am');
INSERT INTO Course_Sections VALUES ('360-27-5590', 'MATH 338', '1', 'CS-103', '30', 'T TH', '10:00am', '11:45am');
INSERT INTO Course_Sections VALUES ('696-34-6531', 'EGGN 101', '2', 'CS-101', '35', 'M W', '12:00pm', '1:45pm');
INSERT INTO Course_Sections VALUES ('360-27-5590', 'MATH 338', '2', 'CS-103', '30', 'T TH', '12:00pm', '1:45pm');

--STUDENT_RECORD
INSERT INTO Student_Record VALUES ('842003700', 'Emmett', 'Cervantes', '431 Devon Dr. Bakersfield, CA 93307', '949-432-8588', 'CPSC', '');
INSERT INTO Student_Record VALUES ('711274203', 'Kurtis', 'Thornton', '7778 Hawthorne St. Van Nuys, CA 91405', '949-790-4512', 'EGGN', 'CPSC');
INSERT INTO Student_Record VALUES ('197072181', 'Siya', 'Forrest', '94 Devonshire Drive Sacramento, CA 95828', '949-397-5686', 'CPSC', '');
INSERT INTO Student_Record VALUES ('359024332 ', 'Michaela', 'Bray', '9067 Santa Clara Drive Anaheim, CA 92805', '949-386-1612', 'MATH', 'CPSC');
INSERT INTO Student_Record VALUES ('430910664 ', 'Sian', 'Sanford', '1 Bayport Drive Canyon Country, CA 91351', '949-604-6833', 'EGGN', 'MATH');
INSERT INTO Student_Record VALUES ('796991437 ', 'Brielle', 'Williams', '8 1st Drive Anaheim, CA 92804', '949-492-1807', 'MATH', '');
INSERT INTO Student_Record VALUES ('094627750', 'Manuel', 'Wickens', '45 Forest Ave. Panorama City, CA 91402', '949-930-9863', 'EGGN', '');
INSERT INTO Student_Record VALUES ('753578588', 'Stephen', 'Andrews', '36 E. Atlantic Drive Fontana, CA 92336', '949-417-3092', 'CPSC', 'EGGN');

--ENROLLMENT RECORD
INSERT INTO Enrollment_Record VALUES ('842003700', 'CPSC 332', '1', 'A+');
INSERT INTO Enrollment_Record VALUES ('842003700', 'MATH 338', '1', 'A');
INSERT INTO Enrollment_Record VALUES ('711274203', 'EGGN 101', '1', 'B+');
INSERT INTO Enrollment_Record VALUES ('711274203', 'CPSC 332', '2', 'A+');
INSERT INTO Enrollment_Record VALUES ('197072181', 'CPSC 332', '2', 'C');
INSERT INTO Enrollment_Record VALUES ('197072181', 'MATH 338', '2', 'C-');
INSERT INTO Enrollment_Record VALUES ('359024332', 'MATH 338', '2', 'B-');
INSERT INTO Enrollment_Record VALUES ('359024332', 'CPSC 332', '2', 'B');
INSERT INTO Enrollment_Record VALUES ('430910664', 'EGGN 101', '1', 'A-');
INSERT INTO Enrollment_Record VALUES ('430910664', 'CPSC 332', '2', 'B+');
INSERT INTO Enrollment_Record VALUES ('430910664', 'MATH 338', '1', 'A-');
INSERT INTO Enrollment_Record VALUES ('796991437', 'CPSC 332', '1', 'A+');
INSERT INTO Enrollment_Record VALUES ('796991437', 'EGGN 101', '2', 'C+');
INSERT INTO Enrollment_Record VALUES ('796991437', 'CPSC 332', '2', 'A-');
INSERT INTO Enrollment_Record VALUES ('796991437', 'MATH 338', '1', 'B-');
INSERT INTO Enrollment_Record VALUES ('094627750', 'EGGN 101', '2', 'C+');
INSERT INTO Enrollment_Record VALUES ('094627750', 'CPSC 332', '1', 'A');
INSERT INTO Enrollment_Record VALUES ('094627750', 'MATH 338', '2', 'A');
INSERT INTO Enrollment_Record VALUES ('753578588', 'CPSC 332', '2', 'B-');
INSERT INTO Enrollment_Record VALUES ('753578588', 'EGGN 101', '1', 'C-');

