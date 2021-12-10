CREATE TABLE Professor(Professor_
	id, INT(6) PRIMARY KEY,
	ssn_number VARCHAR(30) NOT NULL,
	 
	firstname VARCHAR(30) NOT NULL,
	lastname VARCHAR(30) NOT NULL,
	street_address VARCHAR(30) NOT NULL,
	city VARCHAR(30) NOT NULL
	state VARCHAR(30) NOT NULL
	zip_code VARCHAR(10) NOT NULL
	telephone_number VARCHAR(15) NOT NULL,
	 
	sex VARCHAR(2),
	title VARCHAR(40),
	salary VARCHAR(40),
	college_degrees VARCHAR(40),
	email VARCHAR(50),
	reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
CREATE TABLE Department(
	chairperson_id int FOREIGN KEY REFERENCES Professor(Professor_ID)
	dept_id INT(6) PRIMARY KEY,
	dname VARCHAR(30) NOT NULL,
	minor_department_id int(6) NOT NULL
	minor_dept_name VARCHAR(30) NOT NULL,
	telephone VARCHAR(30) NOT NULL,
	office_location VARCHAR(50),
	reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
 
CREATE TABLE Course(
	course_dept_id int FOREIGN KEY REFERENCES Department(Dept_ID)
	course_id INT(6) PRIMARY KEY,
	course_title VARCHAR(30) NOT NULL,
	course_textbook VARCHAR(30) NOT NULL,
	couser_units VARCHAR(50),
	prerequisite_courses VARCHAR(50),
	reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
CREATE TABLE Course_Sections(
	professor_id int FOREIGN KEY REFERENCES Department(Professor_id)
	course_section_number INT(6) PRIMARY KEY,
	classroom VARCHAR(30) NOT NULL,
	no_of_seats INT(2) NOT NULL,
	meeting_days VARCHAR(50),
	beginning_time VARCHAR(5),
	ending_time VARCHAR(5),
	reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
CREATE TABLE Student_record(
	campus_wide_ID INT(6) PRIMARY KEY,
	firstname VARCHAR(30) NOT NULL,
	lastname VARCHAR(30) NOT NULL,
	address VARCHAR(50),
	telephone VARCHAR(5),
	major_department VARCHAR(5) FOREIGN KEY REFERENCES Department(Dept_id),
	minor_dept_id VARCHAR(5) FOREIGN KEY REFERENCES Department(minor_department_id),
	reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
 
CREATE TABLE enrollment_record(
	campus_wide_ID INT(6) FOREIGN KEY REFERENCES Student_record(campus_wide_ID),
	course_section VARCHAR(30) FOREIGN KEY REFERENCES Course_Sectionscourse_section_number),
	grade VARCHAR(30) NOT NULL
	cur_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

