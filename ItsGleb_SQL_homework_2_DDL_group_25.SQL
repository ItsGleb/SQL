--Блок работы с employees
create table employees (
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees;

insert into employees (employee_name)
	values ('Patsy Porter'),('Jerry Schultz'),('Linda Alexander'),
		   ('Laura Santos'),('Eddie Baker'),('Tracy Waters'),
           ('Raymond Moore'),('Elizabeth Patton'),('Charles Sanders'),
           ('Arthur Sanchez'),('Cynthia Baker'),('Ann Johnson'),
           ('Harry Grant'),('Paul Price'),('Ruth Lawrence'),
           ('Colleen Harrington'),('Norma Brown'),('Roger Rodriguez'),
           ('Janet Harris'),('Mary Weaver'),('Brandon Adams'),
           ('Cynthia Weber'),('Michelle Curry'),('George Webster'),
           ('Marcia Douglas'),('Karen Reed'),('Joann Massey'),
           ('John Hodges'),('Sarah Smith'),('Chad Johnson'),
           ('Roland Stanley'),('Cheryl Coleman'),('Glenn Miller'),
           ('Leona Brown'),('Edward Berry'),('John Burns'),
           ('Shane Ryan'),('Joseph Meyer'),('Linda Mills'),
           ('Roberta Taylor'),('Kristina Brown'),('Bruce Bishop'),
           ('Edward Patterson'),('David Rodriguez'),('George Tucker'),
           ('Donna Stokes'),('Loretta Jones'),('Patricia Smith'),
           ('Lisa Cook'),('James Evans'),('Deborah Williams'),
           ('Irene Hall'),('Debbie Brooks'),('Michelle Gilbert'),
           ('Lynn King'),('Joshua Nelson'),('Richard Dixon'),
           ('Carolyn Johnston'),('Ruby Wise'),('Daisy Romero'),
           ('Ann Gordon'),('Johnny Reid'),('Debra Ramos'),
           ('Cynthia Jackson'),('Maria Brown'),('Jerry Dunn'),
           ('James Davis'),('Norman Webb'),('Sandra Ramsey'),('Ricky Hansen');
delete from employees where id > 70;  

--блок работы с salary
create table salary(
	id serial primary key,
	monthly_salary integer not null
);          

select * from salary;

insert into salary (monthly_salary)
	values (1000),(1100),(1200),(1300),(1400),
           (1500),(1600),(1700),(1800),(1900),
           (2000),(2100),(2200),(2300),(2400),(2500);
          
--блок работы с employee_salary
create table employee_salary(
	id serial primary key,
	employee_id integer not null unique,
	salary_id integer not null
);

select * from employee_salary;
select * from employee_salary where employee_id > 70 order by employee_id ;

insert into employee_salary(employee_id, salary_id)
	values (1,1),(2,1),(3,1),(4,2),(5,3),(6,4),
	       (7,5),(8,5),(9,10),(10,10),(11,9),(12,16),
	       (13,14),(70,6),(75,1),(80,8),(14,7),(15,8),
	       (16,9),(72,10),(17,15),(18,12),(19,11),(20,15),
	       (73,13),(97,1),(100,1),(21,7),(22,2),(23,3),(24,6),
	       (25,5),(90,1),(88,8),(95,16),(120,15),(26,6),(27,7),
	       (28,7),(30,3);
insert into employee_salary (employee_id, salary_id)
	values (13,9);
--блок работы с roles
create table roles (
	id serial primary key,
	role_name int not null unique
);

select * from roles;

alter table roles
alter column role_name type varchar(30) using role_name::varchar(30);

insert into roles(role_name)
	values ('Junior Python developer'),('Middle Python developer'),('Senior Python developer'),
	       ('Junior Java developer'),('Middle Java developer'),('Senior Java developer'),
           ('Junior JavaScript developer'),('Middle JavaScript developer'),('Senior JavaScript developer'),
           ('Junior Manual QA engineer'),('Middle Manual QA engineer'),('Senior Manual QA engineer'),
           ('Project Manager'),('Designer'),('HR'),('CEO'),('Sales manager'),
           ('Junior Automation QA engineer'),('Middle Automation QA engineer'),('Senior Automation QA engineer');
--Блок работы с roles_employee
create table roles_employee(
	id serial primary key,
	employee_id integer not null unique,
	role_id integer not null,
	foreign key (employee_id) references employees(id),
	foreign key (role_id) references roles(id)
);         

select * from roles_employee;

insert into roles_employee (employee_id, role_id)
	values (1,2),(2,1),(3,4),(4,2),(5,3),(6,4),
	       (7,5),(8,5),(9,10),(10,10),(11,9),(12,16),
	       (13,14),(14,1),(15,2),(16,3),(17,6),(18,7),
	       (19,8),(20,9),(21,11),(22,12),(23,12),(24,13),
	       (25,13),(26,14),(27,15),(28,17),(29,18),(30,19),(40,19),
	       (34,15),(35,18),(33,8),(32,1),(31,9),(38,8),(39,7),
	       (37,17),(36,14);