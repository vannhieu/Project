-- question 2
	SELECT * 
    FROM 	Department;
-- question 3

SELECT	department_id
FROM	Department
WHERE	department_name = 'sale';

-- question 4
SELECT	MAX(LENGTH(fullname))
FROM	`Account`
ORDER BY fullname DESC;

-- question 5

SELECT MAX(LENGTH(fullname))
FROM 	`Account`
GROUP BY department_id
HAVING 	department_id = 3;

-- question 6

SELECT group_name
FROM 	`group`
WHERE 	createdate = '2020/12/20';

-- question 7

SELECT	answer_id
FROM	Aswer
WHERE	iscorrect >= 4;
-- question 8

SELECT code_
FROM Exam
WHERE	duration>=60 AND createdate < '2019/12/20';
-- question 9

SELECT group_name
FROM 	`group`
ORDER BY	createdate
LIMIT	5;

-- question 10

SELECT COUNT(*)
FROM Department
WHERE	department_id = 2;

-- question 11
SELECT fullname
FROM	`Account`
WHERE 	fullname LIKE 'D%o';

-- question 12
DELETE
FROM	Exam
WHERE	createdate < '2020/12/20';

-- question 13

DELETE	
FROM	Question
WHERE	content = 'cau hoi%';

-- question 14
UPDATE `Account`
SET		fullname = 'nguyen ba loc',
		email = 'loc.nguyenba@vti.com.vn'
WHERE	account_id = 5;

-- question 15

UPDATE	GroupAccount
SET		group_id = 4
WHERE	account_id = 5;