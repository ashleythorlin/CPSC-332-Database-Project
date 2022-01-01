DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Course_Sections;
DROP TABLE IF EXISTS Student_Record;
DROP TABLE IF EXISTS Enrollment_Record;

CREATE TABLE Professor (
	ssn CHAR(11) PRIMARY KEY,	 
	firstname VARCHAR(30),
	lastname VARCHAR(30),
	street VARCHAR(30),
	city VARCHAR(30),
	state VARCHAR(30),
	zip_code CHAR(5),
	telephone_number VARCHAR(15),
	sex VARCHAR(6),
	title VARCHAR(40),
	salary VARCHAR(40),
	college_degrees VARCHAR(80)
);

CREATE TABLE Department (
	dept_id CHAR(4) PRIMARY KEY,
	chairperson_id CHAR(9),
	minor_dept CHAR(4),
	dname VARCHAR(30),
	telephone VARCHAR(30),
	office_location VARCHAR(50),
	FOREIGN KEY (chairperson_id) REFERENCES Professor(ssn) ON DELETE CASCADE
);
 
CREATE TABLE Course (
	course_id VARCHAR(8) PRIMARY KEY,
	course_dept_id VARCHAR(4),
	course_title VARCHAR(50),
	course_textbook VARCHAR(50),
	course_units CHAR(1),
	prerequisite_courses VARCHAR(50),
	FOREIGN KEY (course_dept_id) REFERENCES Department(dept_id) ON DELETE CASCADE
);

CREATE TABLE Course_Sections (
	course_section_number VARCHAR(6),
	professor_id CHAR(11),
	course_num VARCHAR(8),
	classroom VARCHAR(30),
	no_of_seats VARCHAR(2),
	meeting_days VARCHAR(50),
	beginning_time VARCHAR(6),
	ending_time VARCHAR(6),
	PRIMARY KEY (course_section_number, course_num),
	FOREIGN KEY (course_num) REFERENCES Course(course_id) ON DELETE CASCADE,
	FOREIGN KEY (professor_id) REFERENCES Professor(ssn) ON DELETE CASCADE
);

CREATE TABLE Student_Record (
	cwid CHAR(9) PRIMARY KEY,
	firstname VARCHAR(30),
	lastname VARCHAR(30),
	addr VARCHAR(50),
	telephone VARCHAR(5),
	major_department CHAR(4),
	minor_dept_id CHAR(4),
	FOREIGN KEY (major_department) REFERENCES Department(dept_id),
	FOREIGN KEY (minor_dept_id) REFERENCES Department(minor_dept)
);
 
CREATE TABLE Enrollment_Record (
	cwid CHAR(9),
	course_num VARCHAR(8),
	section_num VARCHAR(6),
	grade VARCHAR(2),
	PRIMARY KEY (cwid, course_num, section_num),
	FOREIGN KEY (cwid)  REFERENCES Student_Record(cwid) ON DELETE CASCADE,
	FOREIGN KEY (course_num)  REFERENCES Course(course_id) ON DELETE CASCADE,
	FOREIGN KEY (section_num) REFERENCES Course_Sections(course_section_number) ON DELETE CASCADE
);

INSERT INTO Professor
VALUES
	('298-14-8403', 'Pixie', 'Glenn', '304 Charles Street', 'Los Angeles', 'CA', '90037', '949-818-7117', 'Female', 'Assistant Professor', '$47,768 ', 'Bachelor of Science: Computer Science'),
	('360-27-5590', 'Ayrton', 'Briggs', '7217 Park Road', 'Riverside', 'CA', '92503', '949-952-1357 ', 'Male', 'Full Professor', '$85,230', 'Bachelor of Arts: Mathematics'),
	('696-34-6531', 'Carmen', 'Krause', '7 North Arch St.', 'Huntington Park', 'CA', '90255', '949-546-7580', 'Female', 'Associate Professor', '$84,340', 'Bachelor of Science: Mechanical Engineering');


INSERT INTO Department
VALUES 
	('360-27-5590', 'EGGN', 'Department of Engineering', '949-278-3514', 'Fullerton Campus'),
	('298-14-8403', 'CPSC', 'Department of Computer Science', '949-278-5987', 'Fullerton Campus'),
	('696-34-6531', 'MATH', 'Department of Mathematics', '949-278-3888', 'Fullerton Campus');


INSERT INTO Course
VALUES 
	('CPSC 332', 'CPSC', 'File Structures and Database Systems', 'Fundamentals of Database Systems', '3', 'CPSC 131'),
	('CPSC 335', 'CPSC', 'Algorithm Engineering', 'Algorithms', '3', 'CPSC 131, MATH 270B'),
	('EGGN 101', 'EGGN', 'Introduction to Engineering', 'Introduction to Engineering', '3', ''),
	('MATH 338', 'MATH', 'Statistics Applied to Natural Sciences', 'Statistics in Science', '3', 'MATH 150B');

INSERT INTO Course_Sections
VALUES 
	('1', '298-14-8403', 'CPSC 332', 'CS-100', '40', 'M W', '8:00am', '9:45am'),
	('1', '696-34-6531', 'EGGN 101', 'CS-101', '35', 'M W', '10:00am', '11:45am'),
	('2', '298-14-8403', 'CPSC 332', 'CS-100', '40', 'T TH', '10:00am', '11:45am'),
	('1', '360-27-5590', 'MATH 338', 'CS-103', '30', 'T TH', '10:00am', '11:45am'),
	('2', '696-34-6531', 'EGGN 101', 'CS-101', '35', 'M W', '12:00pm', '1:45pm'),
	('2', '360-27-5590', 'MATH 338', 'CS-103', '30', 'T TH', '12:00pm', '1:45pm');

INSERT INTO Student_Record
VALUES 
	('842003700', 'Emmett', 'Cervantes', '431 Devon Dr. Bakersfield, CA 93307', '949-432-8588', 'CPSC', ''),
	('711274203', 'Kurtis', 'Thornton', '7778 Hawthorne St. Van Nuys, CA 91405', '949-790-4512', 'EGGN', 'CPSC'),
	('197072181', 'Siya', 'Forrest', '94 Devonshire Drive Sacramento, CA 95828', '949-397-5686', 'CPSC', ''),
	('359024332 ', 'Michaela', 'Bray', '9067 Santa Clara Drive Anaheim, CA 92805', '949-386-1612', 'MATH', 'CPSC'),
	('430910664 ', 'Sian', 'Sanford', '1 Bayport Drive Canyon Country, CA 91351', '949-604-6833', 'EGGN', 'MATH'),
	('796991437 ', 'Brielle', 'Williams', '8 1st Drive Anaheim, CA 92804', '949-492-1807', 'MATH', ''),
	('094627750', 'Manuel', 'Wickens', '45 Forest Ave. Panorama City, CA 91402', '949-930-9863', 'EGGN', ''),
	('753578588', 'Stephen', 'Andrews', '36 E. Atlantic Drive Fontana, CA 92336', '949-417-3092', 'CPSC', 'EGGN');

INSERT INTO Enrollment_Record
VALUES 
	('842003700', 'CPSC 332', '1', 'A+'),
	('842003700', 'MATH 338', '1', 'A'),
    ('711274203', 'EGGN 101', '1', 'B+'),
    ('711274203', 'CPSC 332', '2', 'A+'),
    ('197072181', 'CPSC 332', '2', 'C'),
    ('197072181', 'MATH 338', '2', 'C-'),
    ('359024332', 'MATH 338', '2', 'B-'),
    ('359024332', 'CPSC 332', '2', 'B'),
    ('430910664', 'EGGN 101', '1', 'A-'),
    ('430910664', 'CPSC 332', '2', 'B+'),
    ('430910664', 'MATH 338', '1', 'A-'),
    ('796991437', 'CPSC 332', '1', 'A+'),
    ('796991437', 'EGGN 101', '2', 'C+'),
    ('796991437', 'CPSC 332', '2', 'A-'),
    ('796991437', 'MATH 338', '1', 'B-'),
    ('094627750', 'EGGN 101', '2', 'C+'),
    ('094627750', 'CPSC 332', '1', 'A'),
    ('094627750', 'MATH 338', '2', 'A'),
    ('753578588', 'CPSC 332', '2', 'B-'),
    ('753578588', 'EGGN 101', '1', 'C-');
