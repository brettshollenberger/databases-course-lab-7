/*
 Report the names of teachers who have between three and five (inclusive)
 students in their classes. Sort the output in alphabetical order
 by last name of the teacher. Sort output in alphabetical order by
 teacher’s last name.
*/

select * from teachers
where id in (
	select teachers.id from teachers
	inner join students
	on students.classroom=teachers.classroom
	group by students.classroom
	having count(students.classroom) >= 3 and count(students.classroom) <= 5
)
order by teachers.last_name;

/* 
 For each grade, report the number of classrooms in which it is taught
 and the toal number of students in the grade. Sort the output by the
 number of classrooms in descending order, then by grade in ascending
 order.
*/

select grade, count(distinct(classroom)) as num_classrooms, count(distinct(id)) as num_students from students
group by grade
order by num_classrooms desc, grade asc;

/*
 For each fourth-grade classroom, report the total number of students.
 Sort output in the descending order by the number of students.
*/

select classroom, count(distinct(id)) as num_students from students
where grade=4
group by classroom
order by num_students desc;

/*
 For each kindergarden classroom, report the student (last name) who is
 the first (alphabetically) on the class roster. Sort output by classroom
*/

select classroom, min(last_name) as first_alphabetical from students
where grade=0
group by classroom;

/*
 Report the average number of students per class. (You can do it
 without a nested query!).
*/

select classroom, avg(distinct(id)) as avg_num_students from students
group by classroom;
