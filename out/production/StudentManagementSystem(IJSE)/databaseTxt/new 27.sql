DROP DATABASE IF EXISTS ijse;

CREATE DATABASE IF NOT EXISTS ijse;

USE ijse;

CREATE TABLE IF NOT EXISTS Student(
	
	student_id VARCHAR(45) NOT NULL,
	student_name VARCHAR(45) NOT NULL,
	email TEXT, 
	contact VARCHAR(20),
	address TEXT,
	nic VARCHAR(45),
	CONSTRAINT PRIMARY KEY (student_id)
);


CREATE TABLE IF NOT EXISTS Teacher(
	
	teacher_id VARCHAR(45) NOT NULL,
	name VARCHAR(45) NOT NULL,
	nic VARCHAR(45), 
	contact VARCHAR(45),
	address TEXT,
	CONSTRAINT PRIMARY KEY (teacher_id)
);


CREATE TABLE IF NOT EXISTS Subject(
	
	subject_id VARCHAR(45) NOT NULL,
	subject_name VARCHAR(45) NOT NULL, 
	credit DOUBLE,
	teacher_id VARCHAR(45),
	CONSTRAINT PRIMARY KEY (subject_id),
	CONSTRAINT FOREIGN KEY(teacher_id) REFERENCES Teacher(teacher_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Course(
	
	course_id VARCHAR(45) NOT NULL,
	course_name VARCHAR(45) NOT NULL,
	cost DOUBLE,
	duration VARCHAR(45),
	subject_id VARCHAR(45),
	CONSTRAINT PRIMARY KEY (course_id),
	CONSTRAINT FOREIGN KEY(subject_id) REFERENCES Subject(subject_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Intake(
	
	intake_id VARCHAR(45) NOT NULL,
	start_date DATE,
	intahecal VARCHAR(45), 
	discription VARCHAR(45),
	course_id VARCHAR(45),
	CONSTRAINT PRIMARY KEY (intake_id),
	CONSTRAINT FOREIGN KEY(course_id) REFERENCES Course(course_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Registration(
	
	registration_id VARCHAR(45) NOT NULL,
	reg_date DATE,
	student_id VARCHAR(45),
	intake_id VARCHAR(45),
	CONSTRAINT PRIMARY KEY (registration_id),
	CONSTRAINT FOREIGN KEY(student_id) REFERENCES Student(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY(intake_id) REFERENCES Intake(intake_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Payment(
	
	payment_id VARCHAR(45) NOT NULL,
	`date` DATE,
	cost DOUBLE, 
	registration_id VARCHAR(45),
	CONSTRAINT PRIMARY KEY (payment_id),
	CONSTRAINT FOREIGN KEY(registration_id) REFERENCES Registration(registration_id) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO Student VALUES('s001','Ridmi','ridmi@gmail.com','0703274953','kalutara','200077300867');
INSERT INTO Student VALUES('s002','Sandali','sandali@gmail.com','0775896584','panadura','200077869867');
INSERT INTO Student VALUES('s003','Kamal','kamal@gmail.com','0789645893','galle','200497300867');
INSERT INTO Student VALUES('s004','Tharushi','tharuu@gmail.com','0718965478','waskaduwa','200597300867');
INSERT INTO Student VALUES('s005','Nimal','nimal@gmail.com','0775896120','wadduwa','200077388867');

INSERT INTO Teacher VALUES('t001','Mr.Ruwan','458956954v','0703574953','kalutara');
INSERT INTO Teacher VALUES('t002','Miss.Kamani','89654236v','0735896584','panadura');
INSERT INTO Teacher VALUES('t003','Mr.Prabath','965325457v','0749645893','galle');
INSERT INTO Teacher VALUES('t004','Mr.Nuwan','89213212v','0718955478','waskaduwa');
INSERT INTO Teacher VALUES('t005','Miss.Nimna','2356989v','0775696120','wadduwa');

INSERT INTO Subject VALUES('sb001','PRF',100.00,'t001');
INSERT INTO Subject VALUES('sb002','OOP',100.00,'t002');
INSERT INTO Subject VALUES('sb003','ORM',100.00,'t003');
INSERT INTO Subject VALUES('sb004','SQL',100.00,'t004');
INSERT INTO Subject VALUES('sb005','Layered_Architecture',100.00,'t005');

INSERT INTO Course VALUES('c001','gdse',132000.00,'3 years','sb001');
INSERT INTO Course VALUES('c002','gpe',145000.00,'2 years','sb002');
INSERT INTO Course VALUES('c003','cmjd',270000.00,'1 year','sb003');
INSERT INTO Course VALUES('c004','rmad',85000.00,'4 years','sb004');
INSERT INTO Course VALUES('c005','gdseII',95000.00,'1 year','sb005');

INSERT INTO Intake VALUES('in001','2022-07-13','hzgfcjh','sdjhfd','c001');
INSERT INTO Intake VALUES('in002','2022-07-15','srseet','dfsg','c002');
INSERT INTO Intake VALUES('in003','2022-07-19','ryey','sfgdfh','c003');
INSERT INTO Intake VALUES('in004','2022-07-20','dry','ssdsdg','c004');
INSERT INTO Intake VALUES('in005','2022-07-26','sdty','dsfasg','c005');

INSERT INTO Registration VALUES('re001','2022-07-12','s001','in001');
INSERT INTO Registration VALUES('re002','2022-07-12','s002','in002');
INSERT INTO Registration VALUES('re003','2022-07-12','s003','in003');
INSERT INTO Registration VALUES('re004','2022-07-12','s004','in004');
INSERT INTO Registration VALUES('re005','2022-07-12','s005','in005');

INSERT INTO Payment VALUES('p001','2022-07-12',132000.00,'re001');
INSERT INTO Payment VALUES('p002','2022-07-12',128666.00,'re002');
INSERT INTO Payment VALUES('p003','2022-07-12',85000.00,'re003');
INSERT INTO Payment VALUES('p004','2022-07-12',90000.00,'re004');
INSERT INTO Payment VALUES('p005','2022-07-12',132000.00,'re005');