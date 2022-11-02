use MyDb

CREATE TABLE students_info(
s_id INT PRIMARY KEY,
s_name varchar(20),
sub_name varchar(50),
marks INT
)

insert into students_info values(200,'meher','Hindi',90)
insert into students_info values(201,'meher','Telugu',82)
insert into students_info values(202,'meher','Math',56)
insert into students_info values(203,'meher','Kannada',88)

insert into students_info values(500,'poojitha','Hindi',96)
insert into students_info values(501,'poojitha','Telugu',60)
insert into students_info values(502,'poojitha','Math',77)
insert into students_info values(503,'poojitha','Kannada',81)

insert into students_info values(600,'madhu','Hindi',100)
insert into students_info values(601,'madhu','Telugu',98)
insert into students_info values(602,'madhu','Math',97)
insert into students_info values(603,'madhu','Kannada',99)

select * from students_info

CREATE OR ALTER PROCEDURE procedure_1 @total_marks INT AS 
BEGIN
SELECT s_name, SUM(marks) AS s_total from students_info group by s_name having  SUM(marks) <@total_marks
END

CREATE OR ALTER PROCEDURE proc_2 @students_names varchar(20) AS
BEGIN
DECLARE @total_marks AS INT
SELECT  @total_marks= SUM(marks)  from students_info group by s_name having s_name = @students_names
END
EXEC procedure_1 98
EXEC proc_2 madhu
