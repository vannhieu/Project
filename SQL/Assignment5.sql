USE TestingSystem;
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
-- Drop view 
DROP VIEW IF EXISTS DepartmentSale;


CREATE VIEW DepartmentSale AS
SELECT 	account_id, username, fullname
FROM	`Account`	a
JOIN	Department d	ON 	a.department_id = d.department_id
WHERE	d.department_name = 'sale';

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
--
DROP VIEW IF EXISTS AccoutManygroup;
 --
CREATE VIEW AccoutManygroup AS
SELECT	COUNT(1), a.account_id, username
FROM	`Account` a
JOIN	GroupAccount ga ON a.account_id = ga.account_id
JOIN	`Group` g ON ga.group_id = g.group_id
GROUP BY a.account_id
ORDER BY COUNT(1) DESC
LIMIT 1;

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ
-- được coi là quá dài) và xóa nó đi
--
DROP VIEW IF EXISTS LengthContent;
--
CREATE VIEW LengthContent AS
SELECT content, LENGTH(content)
FROM	Question
HAVING LENGTH(content) >= 300;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
--
DROP VIEW IF EXISTS DepartmentEmployee;

--
CREATE VIEW	DepartmentEmployee	AS
SELECT COUNT(1), department_name, GROUP_CONCAT(position_name)
FROM	Department d
JOIN	`Account` a ON d.department_id = a.department_id
JOIN	Positions p ON	a.position_id = p.position_id
GROUP BY department_name
ORDER BY COUNT(1) DESC
LIMIT 1;
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
--
DROP VIEW IF EXISTS UserNguyen;

--
CREATE VIEW	UserNguyen	AS
SELECT q.category_id, category_name
FROM	CategoryQuestion	cq
JOIN	Question	q	ON	cq.category_id = q.category_id
WHERE 	category_name LIKE 'Nguyen%';
