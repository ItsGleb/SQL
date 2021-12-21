--блок работы с employees
create table employees (
  id serial primary key,
  employee_name varchar(50) not null
); --создаем таблицу

insert into employees (id, employee_name) values (default, 'Heather Daniel'); --заполняем таблицу

update employees set employee_name = 'Joseph Hall' where employee_name = 'Itskovich Gleb'; --редактируем строку имя.

select * from employees order by id;

--блок работы с таблицей salary
create table salary (
  id serial primary key,
  monthly_salary int
);

drop table salary; --удалим в случае косяка

insert into salary (id,monthly_salary) values (default,2500);

select * from salary;

-- блок работы с employee_salary
create table employee_salary (
  id serial primary key,
  employee_id int not null unique, 
  salary_id int not null
);

select * from employee_salary;

insert into employee_salary (id, employee_id, salary_id) values (default,21,12);

--блок работы с roles
create table roles (
  id serial primary key,
  role_name int not null unique
);

alter table roles
alter column role_name type varchar(30)
using role_name::varchar(30);

select * from roles order by id;

update roles set role_name = 'Senior Manual QA engineer' where id=12; -- поправить, если накосячу с вводом

insert into roles (id, role_name) values (default, 'Senior Automation QA engineer');

--блок работы с roles_employee
create table roles_employee (
  id serial primary key,
  employee_id int not null unique,
  role_id int not null,
  foreign key (employee_id) references employees (id),
  foreign key (role_id) references roles (id)
);

select * from roles_employee;

insert into roles_employee (id, employee_id, role_id) values (default, 56,5);

delete from roles_employee where id = 49; --создал лишние строки