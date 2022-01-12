-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select E.employee_name,S.monthly_salary from employees as E 
inner join employee_salary as ES on E.id = ES.employee_id 
inner join salary as S on S.id = ES.salary_id ;
-- 2. Вывести всех работников у которых ЗП меньше 2000.
select E.employee_name,S.monthly_salary from employees as E
inner join employee_salary as ES on E.id = ES.employee_id 
inner join salary as S on S.id = ES.salary_id where S.monthly_salary < 2000;
-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.) 
select * from salary as S
left outer join employee_salary as ES on S.id = ES.salary_id 
where ES.employee_id is null;
-- 4. Вывести все зарплатные позиции меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select * from salary as S
left outer join employee_salary as ES on S.id = ES.salary_id 
where S.monthly_salary < 2000 and ES.employee_id is null;
-- 5. Найти всех работников кому не начислена ЗП.
select * from employees as E 
left outer join employee_salary as ES on E.id = ES.employee_id 
where ES.salary_id is null;
-- 6. Вывести всех работников с названиями их должности.
select E.employee_name, R.role_name from employees as E
inner join roles_employee as RE on E.id = RE.employee_id 
inner join roles as R on RE.role_id = R.id; 
-- 7. Вывести имена и должность только Java разработчиков.
select E.employee_name, R.role_name from employees as E
inner join roles_employee as RE on E.id = RE.employee_id 
inner join roles as R on RE.role_id = R.id where R.role_name like '%Java %';
-- 8. Вывести имена и должность только Python разработчиков.
select E.employee_name, R.role_name from employees as E
inner join roles_employee as RE on E.id = RE.employee_id 
inner join roles as R on RE.role_id = R.id where R.role_name like '%Python%';
-- 9. Вывести имена и должность всех QA инженеров.
select E.employee_name, R.role_name from employees as E
inner join roles_employee as RE on E.id = RE.employee_id 
inner join roles as R on RE.role_id = R.id where R.role_name like '%QA engineer';
-- 10. Вывести имена и должность ручных QA инженеров.
select E.employee_name, R.role_name from employees as E
inner join roles_employee as RE on E.id = RE.employee_id 
inner join roles as R on RE.role_id  = R.id where R.role_name like '%Manual QA engineer';
-- 11. Вывести имена и должность автоматизаторов QA
select E.employee_name, R.role_name from employees as E
inner join roles_employee as RE on E.id = RE.employee_id 
inner join roles as R on RE.role_id = R.id where R.role_name like '%Automation QA engineer';
-- 12. Вывести имена и зарплаты Junior специалистов
select E.employee_name,S.monthly_salary,R.role_name from employees as E
left outer join employee_salary as ES on E.id = ES.employee_id
left outer join salary as S on S.id = ES.salary_id 
left outer join roles_employee as RE on E.id = RE.employee_id 
left outer join roles as R on RE.role_id = R.id where R.role_name like 'Junior%';
-- 13. Вывести имена и зарплаты Middle специалистов
select E.employee_name,S.monthly_salary,R.role_name from employees as E
left outer join employee_salary as ES on E.id = ES.employee_id 
left outer join salary as S on S.id = ES.salary_id 
left outer join roles_employee as RE on E.id = RE.employee_id 
left outer join roles as R on RE.role_id = R.id where R.role_name like 'Middle%';
-- 14. Вывести имена и зарплаты Senior специалистов
select E.employee_name, S.monthly_salary, R.role_name from employees as E
left outer join employee_salary as ES on E.id = ES.employee_id 
left outer join salary as S on S.id = ES.salary_id 
left outer join roles_employee as RE on E.id = RE.employee_id 
left outer join roles as R on RE.role_id = R.id where R.role_name like 'Senior%';
-- 15. Вывести зарплаты Java разработчиков
select S.monthly_salary,R.role_name from salary as S
left outer join employee_salary as ES on S.id = ES.salary_id
left outer join employees as E on E.id = ES.employee_id 
left outer join roles_employee as RE on E.id = RE.employee_id
left outer join roles as R on R.id = RE.role_id where R.role_name like '%Java%';
-- 16. Вывести зарплаты Python разработчиков
select S.monthly_salary, R.role_name from salary as S
left outer join employee_salary as ES on S.id = ES.salary_id 
right outer join employees as E on E.id = ES.employee_id 
left outer join roles_employee as RE on E.id = RE.employee_id 
left outer join roles as R on R.id = RE.role_id where R.role_name like '%Python%';
-- 17. Вывести имена и зарплаты Junior Python разработчиков
select * from employees as E
inner join roles_employee as RE on E.id = RE.employee_id 
inner join roles as R on RE.role_id = R.id 
left outer join employee_salary as ES on ES.employee_id = E.id 
left outer join salary as S on S.id = ES.salary_id
where R.role_name like 'Junior Python%';
--  18. Вывести имена и зарплаты Middle JS разработчиков
select E.employee_name, S.monthly_salary,R.role_name from employees as E
left outer join employee_salary as ES on E.id = ES.employee_id 
left outer join salary as S on S.id = ES.salary_id 
left outer join roles_employee as RE on E.id = RE.employee_id 
left outer join roles as R on R.id = RE.role_id where R.role_name like 'Middle JavaScript developer';
-- 19. Вывести имена и зарплаты Senior Java разработчиков
select E.employee_name, S.monthly_salary, R.role_name from employees as E
left outer join employee_salary as ES on E.id = ES.employee_id 
left outer join salary as S on S.id = ES.salary_id 
left outer join roles_employee as RE on E.id = RE.employee_id 
left outer join roles as R on R.id = RE.role_id 
where R.role_name like 'Senior Java developer';
-- 20. Вывести зарплаты Junior QA инженеров
select S.monthly_salary,R.role_name from salary as S
left outer join employee_salary as ES on S.id = ES.salary_id 
left outer join employees as E on E.id = ES.employee_id 
left outer join roles_employee as RE on RE.employee_id = E.id
left outer join roles as R on R.id = RE.role_id 
where R.role_name like 'Junior Manual QA engineer';
-- 21. Вывести среднюю зарплату всех Junior специалистов
select round(avg(S.monthly_salary),2) as Средняя_зарплата_всех_Junior from salary as S
left outer join employee_salary as ES on S.id = ES.salary_id 
left outer join employees as E on E.id = ES.employee_id 
left outer join roles_employee as RE on RE.employee_id = E.id
left outer join roles as R on R.id = RE.role_id where R.role_name like 'Junior%';
-- 22. Вывести сумму зарплат JS разработчиков
select round(sum(S.monthly_salary),2) as Сумма_зарплат_JS_разработчиков from salary as S
left outer join employee_salary as ES on S.id = ES.salary_id 
full outer join employees as E on E.id = ES.employee_id 
left outer join roles_employee as RE on E.id = RE.employee_id 
left outer join roles as R on R.id = RE.role_id 
where R.role_name like '%JavaScript developer';
-- 23. Вывести минимальную ЗП QA инженеров
select min(S.monthly_salary) as Минимальная_ЗП_QA_инженеров from salary as S
left outer join employee_salary as ES on S.id = ES.salary_id 
full outer join employees as E on E.id = ES.employee_id 
left outer join roles_employee as RE on E.id = RE.employee_id 
left outer join roles as R on R.id = RE.role_id 
where R.role_name like '%QA engineer';
-- 24. Вывести максимальную ЗП QA инженеров
select max(S.monthly_salary ) as Максимальная_ЗП_QA_инженеров from salary as S
left outer join employee_salary as ES on S.id = ES.salary_id 
full outer join employees as E on E.id = ES.employee_id 
left outer join roles_employee as RE on E.id = RE.employee_id 
left outer join roles as R on R.id = RE.role_id 
where R.role_name like '%QA engineer';
-- 25. Вывести количество QA инженеров
select count(R.role_name) as Количество_работающих_QA_инженеров from roles as R
inner join roles_employee as RE on R.id = RE.role_id 
where R.role_name like '%QA engineer';
-- 26. Вывести количество Middle специалистов.
select count(R.role_name) as Количество_работающих_Middle_специалистов from roles as R 
inner join roles_employee as RE on R.id = RE.role_id 
where R.role_name like '%Middle%';
-- 27. Вывести количество разработчиков
select count(R.role_name) as Количество_разработчиков from roles as R
inner join roles_employee as RE on R.id = RE.role_id 
where R.role_name like '%developer';
select * from roles;
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select SUM(S.monthly_salary) as фонд_зп_разработчиков from salary as S
left outer join employee_salary as ES on S.id = ES.salary_id 
full outer join employees as E on ES.employee_id = E.id 
left outer join roles_employee as RE on RE.employee_id = E.id 
left outer join roles as R on R.id = RE.role_id 
where R.role_name like '%developer'; 
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select E.employee_name, R.role_name, S.monthly_salary from employees as E 
left outer join roles_employee as RE on E.id = RE.employee_id
inner join roles as R on RE.role_id = R.id 
left outer join employee_salary as ES on ES.employee_id = E.id 
left outer join salary as S on ES.salary_id = S.id order by S.monthly_salary;
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select E.employee_name, R.role_name, S.monthly_salary from employees as E 
left outer join roles_employee as RE on E.id = RE.employee_id
inner join roles as R on RE.role_id = R.id 
left outer join employee_salary as ES on ES.employee_id = E.id 
left outer join salary as S on ES.salary_id = S.id 
where S.monthly_salary between 1700 and 2300 order by S.monthly_salary;
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select E.employee_name, R.role_name, S.monthly_salary from employees as E 
left outer join roles_employee as RE on E.id = RE.employee_id
inner join roles as R on RE.role_id = R.id 
left outer join employee_salary as ES on ES.employee_id = E.id 
left outer join salary as S on ES.salary_id = S.id 
where S.monthly_salary < 2300 order by S.monthly_salary;
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select E.employee_name, R.role_name, S.monthly_salary from employees as E 
left outer join roles_employee as RE on E.id = RE.employee_id
inner join roles as R on RE.role_id = R.id 
left outer join employee_salary as ES on ES.employee_id = E.id 
left outer join salary as S on ES.salary_id = S.id 
where S.monthly_salary in (1100,1500,2000) order by S.monthly_salary;