-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
-- account thuộc phòng ban đó
--
DROP PROCEDURE IF EXISTS DepartmentAndAccount;
--
DELIMITER $$ 

CREATE PROCEDURE DepartmentAndAccount(IN PhongBan VARCHAR(50) )
BEGIN
	SELECT 	department_name, COUNT(1)
	FROM	Department d
	JOIN	`Account`	a	ON 		d.department_id = a.department_id
    WHERE	d.department_name = PhongBan;
	
END $$

DELIMITER ;
-- Question 2: Tạo store để in ra số lượng account trong mỗi group
--
DROP PROCEDURE IF EXISTS AccountAndGroup;
--
DELIMITER $$ 

CREATE PROCEDURE AccountAndGroup ( )
BEGIN
	SELECT	COUNT(1), group_name
	FROM	`Account` a
	RIGHT JOIN	GroupAccount ga ON a.account_id = ga.account_id
	RIGHT JOIN	`Group` g ON ga.group_id = g.group_id
	GROUP BY group_name;
	
END $$

DELIMITER ;
-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo
-- trong tháng hiện tại
--
DROP PROCEDURE IF EXISTS TypeQuestion_How;
--
DELIMITER $$ 

CREATE PROCEDURE TypeQuestion_How( )
BEGIN
	SELECT	COUNT(1), content
	FROM	Question q
	JOIN	TypeQuestion tq ON q.type_id = tq.type_id
    WHERE	MONTH(CURDATE());

END $$

DELIMITER ;

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất

--
DROP PROCEDURE IF EXISTS TypeQuestion_IDTYPE;
--
DELIMITER $$ 

CREATE PROCEDURE TypeQuestion_IDTYPE( )
BEGIN
	SELECT	COUNT(1), type_name
	FROM	Question q
	JOIN	TypeQuestion tq ON q.type_id = tq.type_id
    GROUP BY	type_name
    ORDER BY	COUNT(1)
    LIMIT 1;
    
END $$

DELIMITER ;
-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
--
DROP PROCEDURE IF EXISTS TypeQuestion_IDTYPE;
--
DELIMITER $$ 

CREATE PROCEDURE TypeQuestion_IDTYPE( )
BEGIN
	SELECT	COUNT(1), type_name
	FROM	Question q
	JOIN	TypeQuestion tq ON q.type_id = tq.type_id
    GROUP BY	type_name
    ORDER BY	COUNT(1)
    LIMIT 1;
    
END $$

DELIMITER ;

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của
-- người dùng nhập vào
-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
-- trong store sẽ tự động gán
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
-- dụng store ở câu 9 để xóa), sau đó in số lượng record đã remove từ các table liên quan
-- trong khi removing
-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được chuyển về phòng
-- ban default là phòng ban chờ việc
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay 2
-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6
-- tháng gần đây nhất (nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào
-- trong tháng")
