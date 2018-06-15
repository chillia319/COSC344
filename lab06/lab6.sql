select snum,sname from salespeople where salespeople.snum in (select snum from customers group by snum having count(snum)>1 );
select * from orders o1 where amt > (select avg(amt) from orders o2 where o1.cnum = o2.cnum group by cnum);
select fname,lname from employee where not exists (select essn from dependent where essn = employee.ssn);
INSERT INTO department VALUES ('TempDept', 6,'123456789', TO_DATE('18-Jul-2002','DD-MON-YYYY'));
INSERT INTO project VALUES ('TempProject',50,'Houston',6);
select distinct pnumber from project,department,employee where mgrssn = ssn and employee.lname = 'Smith' and dnum = dnumber union select distinct pnumber from employee,works_on where employee.lname = 'Smith' and works_on.essn = employee.ssn;
update employee set salary = salary*1.1 where lname != 'Borg';
select lname, salary from employee;
drop table hou_emp;
create table hou_emp as (select * from employee where address like '%Houston%');
select * from hou_emp;
drop table emp_dep;
create table emp_dep as (select employee.fname,lname,dependent.dependent_name,dependent.sex,dependent.bdate from employee, dependent where essn = ssn);
select * from emp_dep;


