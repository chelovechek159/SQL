-- SQL HomeWork 2. Joins

-- Подключится к 
-- Host: 159.69.151.133
-- Port: 5056
-- DB: подключение к той таблице где делали DDL операции
-- User: подключение к тем пользователем каким делали DDL операции
-- Pass: 123

-- Если для какого-то кейса надо сделать дополнительную таблицу, наполнить её данными, то делайте )


--  1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, monthly_salary from employee_salary
join employees on employee_id = employees.id
join salary on salary_id = salary.id

--  2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name from employee_salary
join employees on employee_id = employees.id
join salary on salary_id = salary.id 
where monthly_salary < 2000

--  3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary from employee_salary
join employees on employee_id = employees.id
full join salary on salary_id = salary.id 
where employee_id is Null

--  4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary from employee_salary
join employees on employee_id = employees.id 
full join salary on salary_id = salary.id 
where employee_id is null and monthly_salary < 2000

--  5. Найти всех работников кому не начислена ЗП.

select employee_name, monthly_salary from employee_salary
full join employees on employee_id = employees.id 
full join salary on salary_id = salary.id
where monthly_salary is null

--  6. Вывести всех работников с названиями их должности.

select employee_name, role_name from roles_employee
full join employees on employee_id = employees.id
full join roles on role_id = roles.id

--  7. Вывести имена и должность только Java разработчиков.

select employee_name, role_name from roles_employee
full join employees on employee_id = employees.id
full join roles on role_id = roles.id
where role_name like '%Java%'

--  8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name from roles_employee
full join employees on employee_id = employees.id
full join roles on role_id = roles.id
where role_name like '%Python%'

--  9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name from roles_employee
full join employees on employee_id = employees.id
full join roles on role_id = roles.id
where role_name like '%QA engineer%'

--  10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name from roles_employee
full join employees on employee_id = employees.id
full join roles on role_id = roles.id
where role_name like '%Manual QA engineer%'

--  11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name from roles_employee
full join employees on employee_id = employees.id
full join roles on role_id = roles.id
where role_name like '%Automation QA engineer%'

--  12. Вывести имена и зарплаты Junior специалистов

select employee_name, role_name, monthly_salary from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join employees on roles_employee.employee_id = employees.id
join roles on role_id = roles.id
join salary on salary_id = salary.id
where role_name like '%Junior%'

--  13. Вывести имена и зарплаты Middle специалистов

select employee_name, role_name, monthly_salary from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join employees on roles_employee.employee_id = employees.id
join roles on role_id = roles.id
join salary on salary_id = salary.id
where role_name like '%Middle%'

--  14. Вывести имена и зарплаты Senior специалистов

select employee_name, role_name, monthly_salary from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join employees on roles_employee.employee_id = employees.id
join roles on role_id = roles.id
join salary on salary_id = salary.id
where role_name like '%Senior%'

--  15. Вывести зарплаты Java разработчиков

select  monthly_salary from employee_salary es
join roles_employee re on re.employee_id = es.employee_id 
join salary s on s.id = salary_id
join roles r on r.id = role_id
join employees e on e.id = es.id 
where role_name like '%Java developer%'
order by monthly_salary;

--  16. Вывести зарплаты Python разработчиков

select monthly_salary from employee_salary es 
join roles_employee re on es.employee_id = re.employee_id
join employees on es.employee_id = employees.id
join roles on role_id = roles.id
join salary on salary_id = salary.id
where role_name like '%Python developer%'
order by monthly_salary;


--  17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name, monthly_salary from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join employees on roles_employee.employee_id = employees.id
join roles on role_id = roles.id
join salary on salary_id = salary.id
where role_name like '%Junior Python%'

--  18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name, monthly_salary from roles_employee
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join employees on roles_employee.employee_id = employees.id
join roles on role_id = roles.id
join salary on salary_id = salary.id
where role_name like '%Middle JavaScript%'

--  19. Вывести имена и зарплаты Senior Java разработчиков

select employee_name, monthly_salary from roles_employee re 
join employee_salary es on re.employee_id = es.employee_id 
join employees on re.employee_id = employees.id
join salary on salary_id = salary.id 
join roles on role_id = roles.id
where role_name like '%Senior Java%'

--  20. Вывести зарплаты Junior QA инженеров

select monthly_salary from roles_employee re 
join employee_salary es on re.employee_id = es.employee_id 
join employees on re.employee_id = employees.id 
join salary on salary_id = salary.id 
join roles on role_id = roles.id
where role_name like '%Junior%%QA%'


--  21. Вывести среднюю зарплату всех Junior специалистов

select avg(monthly_salary) from roles_employee re 
join employee_salary es on re.employee_id = es.employee_id 
join employees e on re.employee_id = e.id 
join salary on salary_id = salary.id 
join roles on role_id = roles.id 
where role_name like '%Junior%'

--  22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary) from employee_salary es 
join roles_employee re on es.employee_id = re.employee_id 
join employees e on re.employee_id = e.id 
join salary on salary_id = salary.id
join roles on role_id = roles.id
where role_name like'%J%S%'

--  23. Вывести минимальную ЗП QA инженеров

select min(monthly_salary) from employee_salary es 
join roles_employee re on es.employee_id = re.employee_id 
join employees e on es.employee_id = e.id 
join salary on salary_id = salary .id 
join roles on role_id = roles.id
where role_name like '%QA%'

--  24. Вывести максимальную ЗП QA инженеров

select max(monthly_salary) from employee_salary es
join roles_employee re on es.employee_id = re.employee_id 
join employees e on re.employee_id = e.id
join salary on salary_id = salary.id 
join roles on role_id = roles.id 
where role_name like '%QA%engineer%'


--  25. Вывести количество QA инженеров

select count(role_name) from employee_salary es
join roles_employee re on es.employee_id = re.employee_id 
join employees e on re.employee_id = e.id
join salary on salary_id = salary.id 
join roles on role_id = roles.id 
where role_name like '%QA%engineer%'

--  26. Вывести количество Middle специалистов.

select count(role_name) from employee_salary es 
join  roles_employee re on es.employee_id = re.employee_id 
join employees e on re.employee_id = e.id 
join salary on salary_id = salary.id 
join roles on role_id = roles.id 
where role_name like '%Middle%'

--  27. Вывести количество разработчиков

select count(role_name) from employee_salary es 
join  roles_employee re on es.employee_id = re.employee_id 
join employees e on re.employee_id = e.id 
join salary on salary_id = salary.id 
join roles on role_id = roles.id 
where role_name like '%developer%'

--  28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(monthly_salary) from employee_salary es 
join roles_employee re on es.employee_id = re.employee_id 
join employees e on re.employee_id = e.id 
join salary on salary_id = salary.id
join roles on role_id = roles.id
where role_name like '%dev%'

--  29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name, role_name, monthly_salary from employee_salary es 
join roles_employee re on es.employee_id = re.employee_id 
join employees e on re.employee_id = e.id
join salary on salary_id = salary.id 
join roles on role_id = roles.id
order by monthly_salary 

--  30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name, role_name, monthly_salary from employee_salary es 
join roles_employee re on es.employee_id = re.employee_id 
join employees e on re.employee_id = e.id
join salary on salary_id = salary.id 
join roles on role_id = roles.id
where monthly_salary between 1700 and 2300
order by monthly_salary ;

--  31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, role_name, monthly_salary from employee_salary es 
join roles_employee re on es.employee_id = re.employee_id 
join employees e on re.employee_id = e.id
join salary on salary_id = salary.id 
join roles on role_id = roles.id
where monthly_salary < 2300
order by monthly_salary ;

--  32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name, role_name, monthly_salary from employee_salary es 
join roles_employee re on es.employee_id = re.employee_id 
join employees e on re.employee_id = e.id
join salary on salary_id = salary.id 
join roles on role_id = roles.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary ;

