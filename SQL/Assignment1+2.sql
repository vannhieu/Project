-- DROP DATABASE
DROP DATABASE IF EXISTS TestingSystem;

-- CREATE DATABASE TESTINGSYSTEM
CREATE DATABASE TestingSystem;

USE TestingSystem;

CREATE TABLE Department(
	department_id 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    department_name		VARCHAR(50) NOT NULL UNIQUE KEY
);

CREATE TABLE Positions(
	position_id			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    position_name		VARCHAR(50) NOT NULL
);

CREATE TABLE `Account`(
	account_id			MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    email				VARCHAR(50) NOT NULL UNIQUE KEY,
    username			VARCHAR(50) NOT NULL UNIQUE KEY,
    fullname			VARCHAR(50) NOT NULL,
    department_id		TINYINT UNSIGNED,
    position_id			TINYINT UNSIGNED,
    createdate			DATE,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (position_id) REFERENCES Positions(position_id)
);

CREATE TABLE `Group`(
	group_id			SMALLINT   UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    group_name			VARCHAR(50),
    creator_id			SMALLINT UNSIGNED,
    createdate			DATE
);

CREATE TABLE GroupAccount(
	group_id			SMALLINT   UNSIGNED,
    account_id			MEDIUMINT UNSIGNED,
    joindate			DATE,
    PRIMARY KEY(group_id, account_id),
    FOREIGN KEY (account_id) 	REFERENCES `Account`(account_id),
    FOREIGN KEY (group_id)	REFERENCES `Group`(group_id)
);

CREATE TABLE TypeQuestion(
	type_id				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    type_name			VARCHAR(50)
);

CREATE TABLE CategoryQuestion(
	category_id		 	SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    category_name		VARCHAR(50)
);

CREATE TABLE Question(
	question_id			SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content				VARCHAR(50),
    creategory_id		SMALLINT UNSIGNED,
	type_id				SMALLINT UNSIGNED,
    creators_id			SMALLINT UNSIGNED,
    createdate			DATE,
    FOREIGN KEY(type_id)	REFERENCES TypeQuestion(type_id)
);

CREATE TABLE Answer(
	answer_id			SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content				VARCHAR(100),
    question_id			SMALLINT UNSIGNED,
    iscorrect			ENUM('dung','sai'),
    FOREIGN KEY(question_id)	REFERENCES Question(question_id)
);

CREATE TABLE Exam(
	exam_id				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    code_				VARCHAR(10),
    title				VARCHAR(50),
    category_id			SMALLINT UNSIGNED,
    duration			TINYINT UNSIGNED,
    creator_id			SMALLINT UNSIGNED,
    createdate			DATE,
    FOREIGN KEY(category_id)	REFERENCES CategoryQuestion(category_id)
);

CREATE TABLE ExamQuestion(
	exam_id				SMALLINT UNSIGNED,
    question_id			SMALLINT UNSIGNED,
    PRIMARY KEY(exam_id, question_id)
);

-- ADD DATA INTO DEPARTMENT

INSERT INTO Department	(department_name) 
VALUES					('hanh chinh'),
						('giam doc'),
						('pho giam doc'),
						('cntt'),
						('ke toan'),
						('quan ly du an'),
						('tuyen truyen'),
						('hanh toi'),
						('nhaN SU'),
						('cham soc khach hang');

-- ADD DATA INTO Position

INSERT INTO Positions	(position_name)
 VALUES					('quan ly'),
						('nhan vien'),
						('truong phong'),
						('pho ban'),
						('chu tich'),
						('pho chu tich'),
						('giam doc'),
						('ke toan'),
						('thu ky'),
						('truong ban');

-- ADD DATA INTO Accounts	

INSERT INTO `Account`(email, 			username,	 fullname,				 department_id, 	position_id, 	createdate) 
VALUES				('a@gmail.com',		'gacon',	'ga chien',					'1', 			'1',			'2000/05/12'),
					('ab@gmail.com',	'hieu',		'nguyen trung hieu',		'2',		    '2',			'2000/06/12'),
					('abc@gmail.com',	'long',		'nguyen dinh long',			'3', 			'3',			'2001/05/12'),
					('abcd@gmail.com',	'dinh',		'luong dinh',				'4', 			'4',			'2000/05/02'),
					('abcde@gmail.com',	'tien',		'Duong tien',				'5', 			'5',			'2000/07/12'),
					('tien@gmail.com',	'tvt',		'trieu van tien',			'6', 			'6',			'2010/05/12'),
					('cong@gmail.com',	'cong',		'nguyen chi cong',			'7', 			'7',			'2002/05/12'),
					('data@gmail.com',	'datg',		'nguyen trong dat',			'8', 			'8',			'2007/05/12'),
					('vieta@gmail.com',	'viet',		'nguyen hoang viet',		'9', 			'9',			'2000/10/12'),
					('ninha@gmail.com',	'ninhkieu',	'ha kieu ninh',				'10', 			'10',			'2012/05/12');

-- -- ADD DATA INTO Group_

INSERT INTO `Group`	(group_name, 	creator_id, 	createdate)
 VALUES				('hanh', 		'1',			'2000/06/07'),
					('ace', 		'2',			'2000/07/07'),
					('aoe', 		'3',			'2000/08/07'),
					('lol', 		'4',			'2000/09/07'),
					('ae cay khe', 	'5',			'2000/01/07'),
					('vti', 		'6',			'2000/04/07'),
					('iti', 		'7',			'2000/03/07'),
					('electrics', 	'8',			'2000/02/07'),
					('normal', 		'9',			'2000/05/07'),
					('pro', 		'10',			'2000/10/07');

-- ADD DATA INTO GroupAccount

INSERT INTO GroupAccount(group_id, 		account_id, 	joindate	)
 VALUES					('05',			'03',			'2000/03/23'),
						('01',			'01',			'2000/03/25'),
						('06',			'03',			'2000/01/23'),
						('07',			'03',			'2000/02/23'),
						('08',			'03',			'2000/04/23'),
						('09',			'03',			'2000/05/23'),
						('02',			'03',			'2000/06/23'),
						('04',			'03',			'2000/07/23'),
						('03',			'03',			'2000/08/23'),
						('10',			'03',			'2000/09/23');

-- ADD DATA INTO TypeQuestion

INSERT INTO TypeQuestion(type_name)
 VALUES					('lich su'),
						('khoa hoc'),
						('dia li'),
						('tieng anh'),
						('cntt'),
						('the gioi'),
						('van hoa'),
						('xa hoi'),
						('dan so'),
						('tai chinh');
						
-- ADD DATA INTO CategoryQuestion

INSERT INTO CategoryQuestion(category_name) 
VALUES						('hieu'),
							('thao'),
							('chinh'),
							('chien'),
							('hung'),
							('nghia'),
							('dia'),
							('long'),
							('nam'),
							('hanh');

-- ADD DATA INTO Question

INSERT INTO Question(content, 		creategory_id, 		type_id, creators_id, createdate)
 VALUES				('cau hoi 1',		'01',			'5', 		'7', 	'2001/10/20'),
					('cau hoi 2',		'02',			'1', 		'1', 	'2002/10/20'),
					('cau hoi 3',		'03',			'2', 		'3', 	'2003/10/20'),
					('cau hoi 4',		'04',			'3', 		'4', 	'2005/10/20'),
					('cau hoi 5',		'05',			'4', 		'5',    '2004/10/20'),
					('cau hoi 6',		'06',			'6', 		'6', 	'2006/10/20'),
					('cau hoi 7',		'07',			'8', 		'8',	'2007/10/20'),
					('cau hoi 8',		'08',			'9', 		'9', 	'2008/10/20'),
					('cau hoi 9',		'09',			'10',		'10',	'2009/10/20'),
					('cau hoi 10',		'10',			'7', 		'2', 	'2000/11/20');
					
-- ADD DATA INTO Answer

INSERT INTO Answer (content, 		question_id, 		iscorrect) 
VALUES				('cau hoi 1',		'1',			'dung'),
					('cau hoi 2',		'2',			'dung'),
					('cau hoi 3',		'3',			'dung'),
					('cau hoi 4',		'4',			'dung'),
					('cau hoi 5',		'5',			'dung'),
					('cau hoi 6',		'6',			'dung'),
					('cau hoi 7',		'7',			'dung'),
					('cau hoi 8',		'8',			'dung'),
					('cau hoi 9',		'9',			'dung'),
					('cau hoi 10',		'10',			'dung');

-- ADD DATA INTO Exam

INSERT INTO Exam(code_, 		title, 				category_id, 		duration, 		creator_id, 	createdate) 
VALUES			('03',			'title 1', 			'1',			'60',				'1',			'2001/04/04'),
				('01',			'title 2', 			'4',			'60',				'2',			'2010/04/04'),
				('02',			'title 3', 			'5',			'60',				'3',			'2002/04/04'),
				('04',			'title 4', 			'6',			'60',				'4',			'2003/04/04'),
				('05',			'title 5', 			'7',			'60',				'5',			'2000/5/04'),
				('06',			'title 6', 			'2',			'60',				'6',			'2020/04/04'),
				('07',			'title 7', 			'8',			'60',				'7',			'2006/04/04'),
				('08',			'title 8', 			'10',			'60',				'8',			'2000/8/04'),
				('09',			'title 9', 			'3',			'60',				'9',			'2000/09/04'),
				('10',			'title 10', 		'9',			'60',				'10',			'2000/4/14'); 

-- ADD DATA INTO ExamQuestion

INSERT INTO ExamQuestion(exam_id, question_id) 
VALUES					('1',		'2'),
						('2',		'2'),
						('3',		'2'),
						('4',		'2'),
						('5',		'2'),
						('6',		'2'),
						('7',		'2'),
						('8',		'2'),
						('9',		'2'),
						('10',		'2');
