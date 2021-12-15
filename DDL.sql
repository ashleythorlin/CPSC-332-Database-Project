
DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Course_Sections;
DROP TABLE IF EXISTS Student_Record;
DROP TABLE IF EXISTS Enrollment_Record;

CREATE TABLE Professor(
	`ssn_number` int(9) unsigned NOT NULL,	 
	`firstname` VARCHAR(30) NOT NULL DEFAULT '',
	`lastname` VARCHAR(30) NOT NULL DEFAULT '',
	`street_address` VARCHAR(30) NOT NULL DEFAULT '',
	`city` VARCHAR(30) NOT NULL DEFAULT '',
	`stateloc` VARCHAR(30) NOT NULL DEFAULT '',
	`zip_code` VARCHAR(10) NOT NULL DEFAULT '',
	`telephone_number` VARCHAR(15) NOT NULL DEFAULT '',
	`gender` VARCHAR(10) NOT NULL DEFAULT '',
	`title` VARCHAR(40) NOT NULL DEFAULT '',
	`salary` VARCHAR(40) NOT NULL DEFAULT '',
	`college_degrees` VARCHAR(40) NOT NULL DEFAULT '',
	PRIMARY KEY `ssn_number`
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Department(
	`chairperson_id` VARCHAR(30) NOT NULL,
	`dept_id` VARCHAR(4) NOT NULL,
	`minor_dept` VARCHAR(4) NOT NULL,
	`dname` VARCHAR(30) NOT NULL DEFAULT '',
	`telephone` VARCHAR(30) NOT NULL DEFAULT '',
	`office_location` VARCHAR(50)  NOT NULL DEFAULT ''
	PRIMARY KEY (`dept_id`),
	KEY `chairperson_id_foreign`(`chairperson_id`),
	CONSTRAINT `chairperson_id_foreign` FOREIGN KEY (`chairperson_id`) REFERENCES `Professor`(`ssn_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
CREATE TABLE Course(
	`course_dept_id` VARCHAR(4) NOT NULL,
	`course_id` VARCHAR(8) NOT NULL,
	`course_title`VARCHAR(30) NOT NULL DEFAULT '',
	`course_textbook` VARCHAR(30) NOT NULL DEFAULT '',
	`course_units` int(1)  NOT NULL DEFAULT 1,
	`prerequisite_courses` VARCHAR(50) NOT NULL DEFAULT '',
	PRIMARY KEY (`course_id`),
	KEY `course_dept_id_foreign`(`course_dept_id`),
	CONSTRAINT `course_dept_id_foreign` FOREIGN KEY (`course_dept_id`) REFERENCES `Department`(`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Course_Sections(
	`professor_id` VARCHAR(30) NOT NULL,
	`course_num` VARCHAR(8) NOT NULL,
	`course_section_number` INT(6) NOT NULL,
	`classroom` VARCHAR(30) NOT NULL DEFAULT '',
	`no_of_seats` int(2) NOT NULL DEFAULT 1,
	`meeting_days` VARCHAR(50) NOT NULL DEFAULT '',
	`beginning_time` VARCHAR(5) NOT NULL DEFAULT '',
	`ending_time` VARCHAR(5) NOT NULL DEFAULT '',
	PRIMARY KEY (`course_section_number`),
	KEY `section_cnum_foreign` (`course_num`),
	KEY `section_prof_id_foreign` (`ssn_number`),
	CONSTRAINT `section_cnum_foreign` FOREIGN KEY (`course_id`) REFERENCES `Course`(`course_id`),
	CONSTRAINT `section_prof_id_foreign` FOREIGN KEY (`professor_id`) REFERENCES `Professor`(`ssn_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Student_Record(
	`campus_wide_id` int(9) NOT NULL,
	`firstname` VARCHAR(30) NOT NULL DEFAULT '',
	`lastname` VARCHAR(30) NOT NULL DEFAULT '',
	`addr` VARCHAR(50) NOT NULL DEFAULT '',
	`telephone` VARCHAR(5) NOT NULL DEFAULT '',
	`major_department` VARCHAR(5) NOT NULL,
	`minor_dept_id` VARCHAR(5) DEFAULT '',
	PRIMARY KEY (`campus_wide_id`),
	KEY `major_department_foreign`(`major_department`),
	KEY `minor_department_foreign`(`minor_dept_id`),
	CONSTRAINT `major_department_foreign` FOREIGN KEY (`major_department`) REFERENCES `Department`(`dept_id`),
	CONSTRAINT `minor_department_foreign` FOREIGN KEY (`minor_dept_id`) REFERENCES `Department`(`minor_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
CREATE TABLE Enrollment_Record(
	`campus_wide_id` int(6) NOT NULL,
	`course_number` VARCHAR(30) NOT NULL,
	`course_section` VARCHAR(30) NOT NULL,
	`grade` VARCHAR(30) NOT NULL DEFAULT '',
	KEY `cwid_foreign`(`campus_wide_id`),
	KEY `course_number_foreign`(`course_id`),
	KEY `course_section_foreign`(`course_section_number`),
	CONSTRAINT `cwid_foreign` FOREIGN KEY (`campus_wide_id`)  REFERENCES `Student_Record`(`campus_wide_id`),
	CONSTRAINT `course_number_foreign` FOREIGN KEY (`course_id`)  REFERENCES `Course`(`course_id`),
	CONSTRAINT `course_section_foreign` FOREIGN KEY (`course_section_number`) REFERENCES `Course_Sections`(`course_section_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Professor WRITE;
LOCK TABLES Department WRITE;
LOCK TABLES Course WRITE;
LOCK TABLES Course_Sections WRITE;
LOCK TABLES Student_Record WRITE;
LOCK TABLES Enrollment_Record WRITE;



INSERT INTO Professor
VALUES
	('298-14-8403', 'Pixie', 'Glenn', '304 Charles Street', 'Los Angeles', 'CA', '90037', '949-818-7117', 'Female', 'Assistant Professor', '$47,768 ', 'Bachelor of Science: Computer Science'),
	('360-27-5590', 'Ayrton', 'Briggs', '7217 Park Road', 'Riverside', 'CA', '92503', '949-952-1357 ', 'Male', 'Full Professor', '$85,230', 'Bachelor of Arts: Mathematics'),
	('696-34-6531', 'Carmen', 'Krause', '7 North Arch St.', 'Huntington Park', 'CA', '90255', '949-546-7580', 'Non-Binary', 'Associate Professor', '$84,340', 'Bachelor of Science: Mechanical Engineering');


INSERT INTO Department
VALUES 
	('360-27-5590', 'EGGN', 'Department of Engineering', '949-278-3514', 'Fullerton Campus'),
	('298-14-8403', 'CPSC', 'Department of Computer Science', '949-278-5987', 'Fullerton Campus'),
	('696-34-6531', 'MATH', 'Department of Mathematics', '949-278-3888', 'Fullerton Campus');


INSERT INTO Course
VALUES 
	('CPSC', 'CPSC 332', 'File Structures and Database Systems', 'Fundamentals of Database Systems', '3', 'CPSC 131'),
	('CPSC', 'CPSC 335', 'Algorithm Engineering', 'Algorithms', '3', 'CPSC 131, MATH 270B'),
	('EGGN', 'EGGN 101', 'Introduction to Engineering', 'Introduction to Engineering', '3', ''),
	('MATH', 'MATH 338', 'Statistics Applied to Natural Sciences', 'Statistics in Science', '3', 'MATH 150B');

INSERT INTO Course_Sections
VALUES 
	('298-14-8403', 'CPSC 332', '1', 'CS-100', '40', 'M W', '8:00am', '9:45am'),
	('696-34-6531', 'EGGN 101', '1', 'CS-101', '35', 'M W', '10:00am', '11:45am'),
	('298-14-8403', 'CPSC 332', '2', 'CS-100', '40', 'T TH', '10:00am', '11:45am'),
	('360-27-5590', 'MATH 338', '1', 'CS-103', '30', 'T TH', '10:00am', '11:45am'),
	('696-34-6531', 'EGGN 101', '2', 'CS-101', '35', 'M W', '12:00pm', '1:45pm'),
	('360-27-5590', 'MATH 338', '2', 'CS-103', '30', 'T TH', '12:00pm', '1:45pm');

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

UNLOCK TABLES
