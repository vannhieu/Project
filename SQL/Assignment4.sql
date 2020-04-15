USE TestingSystem;
-- question 1

SELECT a.fullname, d.department_name
FROM	Department d
JOIN	`Account` a
ON		d.department_id = a.department_id;


-- question 2

SELECT * 
FROM	`Account`
WHERE	createdate > '2010/12/20';

-- question 3
SELECT 	*
FROM	Positions
WHERE	position_name = "developer";

-- question 4

SELECT 	department_name, COUNT(1)
FROM	Department d
JOIN	`Account`	a	ON 		d.department_id = a.department_id
GROUP BY department_name
HAVING	COUNT(1) >= 3;


-- question 5 Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT COUNT(1) , q.content
FROM	Exam	e
JOIN	ExamQuestion eq	ON e.exam_id = eq.exam_id
JOIN	Question	q	ON eq.question_id = q.question_id
GROUP BY q.content
HAVING	COUNT(1) = ( SELECT COUNT(1)
					 FROM	Exam	e
					 JOIN	ExamQuestion eq	ON e.exam_id = eq.exam_id
					 JOIN	Question	q	ON eq.question_id = q.question_id
					 GROUP BY q.content
                     ORDER BY q.content
                     LIMIT 1);

-- question 6	Thông kê mỗi category Question được sử dụng trong bao nhiêu Question

SELECT	*
FROM	CategoryQuestion	cq
JOIN	Question	q	ON	cq.category_id = q.category_id
GROUP BY	category_name;


-- question 7 Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

SELECT *
FROM	Exam	e
JOIN	ExamQuestion eq	ON e.exam_id = eq.exam_id
JOIN	Question	q	ON eq.question_id = q.question_id
GROUP BY content;

-- question 8  Lấy ra Question có nhiều câu trả lời nhất

SELECT answer_id, content, COUNT(1)
FROM	Answer
GROUP BY content 
ORDER BY COUNT(1) DESC
LIMIT 1;

-- question 9 Thống kê số lượng account trong mỗi group 
SELECT	COUNT(1), group_name
FROM	`Account` a
JOIN	GroupAccount ga ON a.account_id = ga.account_id
JOIN	`Group` g ON ga.group_id = g.group_id
GROUP BY group_name;


-- question 10 Tìm chức vụ có ít người nhất

SELECT position_name, COUNT(1)
FROM	`Account`	a
JOIN	Positions p ON a.position_id = p.position_id
GROUP BY position_name
HAVING COUNT(1) = (	SELECT COUNT(1)
					FROM	`Account`	a1
					JOIN	Positions p1 ON a1.position_id = p1.position_id
					GROUP BY position_name
                    ORDER BY position_name ASC
                    LIMIT 1);
                    
-- question 11  thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

SELECT COUNT(1), department_name, GROUP_CONCAT(position_name)
FROM	Department d
JOIN	`Account` a ON d.department_id = a.department_id
JOIN	Positions p ON	a.position_id = p.position_id
WHERE	position_name IN('dev', 'test', 'scrum master', 'PM')
GROUP BY department_name;



-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …

SELECT q.content, type_name, category_name, iscorrect
FROM	Question q
JOIN	CategoryQuestion cq ON q.category_id = cq.category_id
JOIN	TypeQuestion	tq 	ON q.type_id = tq.type_id
JOIN	Answer a			ON q.question_id = a.question_id;
-- Question 13: lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT	*
FROM	Question q
JOIN	TypeQuestion tq ON q.type_id = tq.type_id
WHERE	type_name IN('tu luan', 'trac nghiem')
GROUP BY type_name;

-- Question 14: lấy ra group không có account nào
SELECT *
FROM `Group` g
LEFT JOIN GroupAccount ga ON g.group_id = ga.group_id;

-- Question 15: lấy ra group không có account nào
SELECT *
FROM `Group` g
LEFT JOIN GroupAccount ga ON g.group_id = ga.group_id
LEFT JOIN `Account` a 	  ON ga.account_id = a.account_id
WHERE	group_name IN(NULL);
-- Question 16: lấy ra question không có answer nào

SELECT *
FROM	Question q
LEFT JOIN 	Answer a ON q.question_id = a.question_id
WHERE 	iscorrect IN(NULL);
-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
-- b) Lấy các account thuộc nhóm thứ 2
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT *
FROM `Group` g
JOIN GroupAccount ga ON g.group_id = ga.group_id
JOIN `Account` a 	  ON ga.account_id = a.account_id
WHERE	g.group_id = 1
UNION
SELECT *
FROM `Group` g
JOIN GroupAccount ga ON g.group_id = ga.group_id
JOIN `Account` a 	  ON ga.account_id = a.account_id
WHERE	g.group_id = 2;

-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
-- b) Lấy các group có nhỏ hơn 7 thành viên
-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT COUNT(1), group_name
FROM `Group` g
JOIN GroupAccount ga ON g.group_id = ga.group_id
JOIN `Account` a 	  ON ga.account_id = a.account_id
GROUP BY g.group_name
HAVING COUNT(1) > 5

UNION
SELECT COUNT(1), group_name
FROM `Group` g
JOIN GroupAccount ga ON g.group_id = ga.group_id
JOIN `Account` a 	  ON ga.account_id = a.account_id
GROUP BY g.group_name
HAVING COUNT(1) > 7;
