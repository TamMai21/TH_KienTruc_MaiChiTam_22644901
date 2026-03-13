LOAD CSV WITH HEADERS FROM 'file:/courses.csv' AS row
WITH row WHERE row.course_id IS NOT NULL
MERGE (n:Course {course_id: row.course_id})
SET n.name = row.name,
n.hours = toInteger(row.hours);

LOAD CSV WITH HEADERS FROM 'file:/departments.csv' AS row
WITH row WHERE row.dept_id IS NOT NULL
MERGE (n:Department {dept_id: row.dept_id})
SET n.name = row.name,
n.dean = row.dean,
n.building = row.building,
n.room = toInteger(row.room);

LOAD CSV WITH HEADERS FROM 'file:/students.csv' AS row
WITH row WHERE row.student_id IS NOT NULL
MERGE (n:Student {student_id: row.student_id})
SET n.name = row.name,
n.gpa = toFloat(row.hours);


LOAD CSV WITH HEADERS FROM 'file:/courses.csv' AS row
WITH row WHERE row.course_id IS NOT NULL AND row.dept_id IS NOT NULL
MATCH (c:Course{course_id:row.course_id})
MATCH (d:Department{dept_id:row.dept_id})
MERGE (c) - [:BELONGS_TO] -> (d)

LOAD CSV WITH HEADERS FROM 'file:/enrollments.csv' AS row
WITH row WHERE row.student_id IS NOT NULL AND row.course_id IS NOT NULL
MATCH (s:Student{student_id:row.student_id})
MATCH (c:Course{course_id:row.course_id})
MERGE (s) - [:ENROLLED] -> (c)

//LAY RA TAT CA QUAN HE
MATCH ()-[r]->()
RETURN DISTINCT type(r) AS RelationshipType




CREATE CONSTRAINT uq_course_id
FOR (n:Course) REQUIRE n.course IS UNIQUE;

CREATE CONSTRAINT uq_student_id
FOR (n:Student) REQUIRE n.student_id IS UNIQUE;

CREATE CONSTRAINT uq_department
FOR (n:Department) REQUIRE n.dept_id IS UNIQUE;


MATCH(n:Course) RETURN n

//Liệt kê danh sách n sinh viên.
MATCH(n:Student) RETURN n.student_id LIMIT 25
//Tìm kiếm sinh viên khi biết mã số, giả sử student_id = 22.
MATCH (n:Student)
WHERE n.student_id = '22'
RETURN n.name
//Tìm danh sách khóa học thuộc một khoa nào đó khi biết mã khoa.
MATCH (c:Course) - [:BELONGS_TO] -> (d:Department)
WHERE d.dept_id = 'IE'
RETURN c
//Cập nhật tên khoa thành “Mathematics” cho department_id = "Math".
MATCH (d:Department) WHERE d.dept_id = 'Math' RETURN d.name

MATCH (d:Department) WHERE d.dept_id = 'Math'
SET d.name = 'Mathematics'
RETURN d.name
//Cập nhật tên khoa thành “Rock n Roll” cho department_id = "Music".
MATCH (d:Department) WHERE d.dept_id = 'Music' RETURN d.name

MATCH (d:Department) WHERE d.dept_id = 'Music'
SET d.name = 'Rock n Roll'
RETURN d.name



//Thêm khóa học vào khoa IE với thông tin: course_id = IE202, name = Simulation, hours = 3.
MATCH (d:Department) WHERE d.dept_id = 'IE'
CREATE (c:Course {course_id: 'IE202', name: 'Simulation', hour: '3'})-[:BELONGS_TO]->(d)

MATCH (c:Course {course_id: 'IE202', name: 'Simulation', hour: '3'})-[:BELONGS_TO]->(d)
RETURN c, d

//Xóa toàn bộ các khóa học.
MATCH (n:Course)
DETACH DELETE n

//Liệt kê tất cả các khoa.
MATCH (d:Department)
RETURN d

//Liệt kê tên của tất cả các trưởng khoa.
MATCH (d:Department)
RETURN d.dean

//Tìm tên của trưởng khoa CS.
MATCH (d:Department)
WHERE d.dept_id = 'CS'
RETURN d.dean

//Liệt kê tất cả các khóa học của khoa CS và IE.
MATCH (c:Course)-[:BELONGS_TO]->(d:Department)
WHERE d.dept_id = 'CS' OR d.dept_id = 'IE'
RETURN d.dept_id, d.name as Department_name, c.name as Course_name

//Liệt kê danh sách tên của các sinh viên đăng ký học khóa học CS101.
MATCH (s:Student)-[:ENROLLED]->(c:Course)
WHERE d.dept_id = 'CS101'
RETURN s.name as studentName, c.dept_id as dept_id

//Tính tổng số sinh viên đăng ký học khóa học của mỗi khoa.
//Tính tổng số sinh viên đăng ký học của mỗi khoa và sắp xếp kết quả theo mã khoa.
//Tính tổng số sinh viên đăng ký học của mỗi khoa và sắp xếp kết quả theo số sinh viên giảm dần.
//Liệt kê danh sách tên của các trưởng khoa mà khoa đó không có sinh viên đăng ký học.
//Danh sách khoa có số sinh viên đăng ký học nhiều nhất.
//Danh sách sinh viên có GPA ≥ 3.2, kết quả sắp xếp giảm dần theo GPA.
//Liệt kê danh sách tất cả các khóa học.
