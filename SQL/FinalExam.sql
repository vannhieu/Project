-- Drop database
DROP DATABASE IF EXISTS ManagementStudent;

-- create database

CREATE DATABASE ManagementStudent;

USE ManagementStudent;

-- create table

CREATE TABLE Student(
	rn		TINYINT UNSIGNED AUTO_INCREMENT	PRIMARY KEY,
    name_	VARCHAR(50)	NOT NULL,
    ege		TINYINT UNSIGNED NOT NULL,
    gender	ENUM('nam', 'nu')
);

CREATE TABLE `subject`(
	s_id	TINYINT UNSIGNED AUTO_INCREMENT	PRIMARY KEY,
    s_name	VARCHAR(50) NOT NULL
);

CREATE TABLE StudentSubject(
	rn		TINYINT UNSIGNED,
    s_id	TINYINT UNSIGNED,
    mark	TINYINT UNSIGNED,
    date_	DATE,
    PRIMARY KEY(rn, s_id),
    FOREIGN KEY	(rn) REFERENCES	Student(rn),
    FOREIGN KEY	(s_id) REFERENCES	`subject`(s_id)
);


-- Thêm ít nhất 3 bản ghi vào table

INSERT INTO Student	(	name_,				ege,			gender)
			VALUES 	(	'Dinh van Hieu',	18,				'nam'	),
					(	'Ha Thi Hanh',		20,				'nu'	),
                    (	'Dao le Huy',		21,				'nam'	);
                    
                    -- ---------------------
                    
INSERT INTO	`subject`(s_name)
			VALUES	 ('toan'),
					 ('van'),
                     ('anh');
                     -- -------------------------------


INSERT INTO	StudentSubject(rn, 	s_id,		mark, 		  date_	  )
			VALUES		 (1, 	1,			'6', 		 '2000/02/03'),
						 (2, 	2,			'5',		 '2000/01/03'),
                         (3, 	3,			'4',		 '2000/04/03');
                         
                         
-- b) Viết lệnh để         
-- a. Lấy tất cả các môn học ma  không có bất kì điểm nào

SELECT st.name_, s.s_name, ss.mark
FROM	`subject` s
LEFT JOIN	StudentSubject ss	ON	s.s_id = ss.s_id
JOIN	Student		st		ON	ss.rn = st.rn; 
-- b. Lấy danh sách các môn  học có ít nhất 2 điểm
SELECT	 s.s_id, COUNT(1), s.s_name, ss.mark
FROM	`subject` s
JOIN	StudentSubject ss	ON	s.s_id = ss.s_id
GROUP BY	s.s_name
HAVING		COUNT(1) > 2;

-- c) Tạo "StudentInfo" view có các thông tin về học sinh bao gồm:
-- RN,sID,Name, Age, Gender, sName, Mark, Date. Với cột Gender show
-- Male để thay thế cho 0, Female thay thế cho 1 và Unknow thay thế cho
-- null.

--
DROP VIEW IF EXISTS StudenInfo;
--
CREATE VIEW	StudenInfo
AS
SELECT st.rn, s.s_id, name_, ege, gender, s_name, mark, date_, 
CASE
	WHEN	gender = 'nam' THEN 1
    WHEN 	gender = 'nu' 	THEN 0
    ELSE	'null'
END	as gender_show
FROM	`subject` s
JOIN	StudentSubject ss	ON	s.s_id = ss.s_id
JOIN	Student		st		ON	ss.rn = st.rn; 

--
SELECT * FROM StudenInfo;

-- d) Tạo trigger cho table Subject:
-- a. Trigger CasUpdate: khi thay đổi data của cột sID, thì giá trị của
-- cột sID của table StudentSubject cũng thay đổi theo
--
DROP TRIGGER IF EXISTS CasUpdate;
--

DELIMITER $$
CREATE TRIGGER	CasUpdate
BEFORE UPDATE ON	Student
FOR EACH ROW

BEGIN
	DECLARE New_s_id	TINYINT UNSIGNED;
    
    SELECT	s_id INTO	New_s_id
    FROM	`subject`;
    
    UPDATE	StudentSubject
    SET		s_id = New_s_id;
    
END $$

DELIMITER ;

UPDATE `subject`
SET		s_name = 'hoa'
WHERE s_id = 3;
-- b. Trigger casDel: Khi xóa 1 student, các dữ liệu của table
-- StudentSubject cũng sẽ bị xóa theo
--
DROP TRIGGER IF EXISTS casDel;
--

DELIMITER $$
CREATE TRIGGER casDel
BEFORE DELETE ON Student
FOR EACH ROW
BEGIN 
      DECLARE new_rn SMALLINT;
      
      SELECT rn INTO new_rn
      FROM Student;
      
	  DELETE FROM StudentSubject 
      WHERE StudentSubject.rn = new_rn;	 
END $$
DELIMITER ;

-- test
DELETE 
FROM StudentSubject 
WHERE StudentSubject.rn =1;	
-- e) Viết 1 thủ tục (có 2 parameters: student name, mark). Thủ tục sẽ xóa tất cả
-- các thông tin liên quan tới học sinh có cùng tên như parameter và tất cả
-- các điểm nhỏ hơn của các học sinh đó.
-- Trong trường hợp nhập vào "*" thì thủ tục sẽ xóa tất cả các học sinh
--
DROP PROCEDURE IF EXISTS DeleteAll;
--
DELIMITER $$
CREATE PROCEDURE DeleteAll (IN Student_name VARCHAR(50),IN InPutMark TINYINT UNSIGNED)
BEGIN 
          SELECT  name_, 	Mark
          INTO Student_name, InPutMark
          FROM Student st
          JOIN StudentSubject ss ON st.RN = ss.RN;
          
          DELETE	
          FROM	Student
          WHERE	name_ = Student_name;
          
          DELETE 
          FROM StudentSubject ss
          WHERE name_ = Student_name OR Mark <InPutMark;
          
          DELETE 
          FROM Student
          WHERE Student_name = '*';
END $$
DELIMITER ;

-- test 

CALL managementstudent.DeleteAll ('*', '6');
