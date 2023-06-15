-- SQL_DDL
-- Первая часть.

-- Таблица employees

-- 1) Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null

		create table employees(
			id serial primary key,
			employee_name varchar(50) not null
		);

-- 2) Наполнить таблицу employee 70 строками.

insert into employees (employee_name)
values  ('Wesley Crawford'),
		('Jack Martinez'),
		('Aaron McLaughlin'),
		('Johnny King'),
		('Herman White'),
		('John Pearson'),
		('Leroy Wilson'),
		('Daniel Gonzalez'),
		('Brian Myers'),
		('Johnnie James'),
		('David Boyd'),
		('Paul Richardson'),
		('Nathan Castillo'),
		('Brian Santos'),
		('Chris Clark'),
		('John Patrick'),
		('Charles Barnett'),
		('George Smith'),
		('Peter Lynch'),
		('Paul Moore'),
		('Jeff Garner'),
		('Edward Jones'),
		('Albert Chapman'),
		('Jose Johnson'),
		('Juan Brown'),
		('Leon Baldwin'),
		('Eddie Maldonado'),
		('George Edwards'),
		('Craig Herrera'),
		('Joshua Henry'),
		('Jon Wright'),
		('Justin Moore'),
		('John Coleman'),
		('Ronald Johnson'),
		('Jeff Johnson'),
		('Gregory Martin'),
		('Phillip Henderson'),
		('Terry Hayes'),
		('David Hines'),
		('Alfred Wagner'),
		('Lance Howard'),
		('Mark Bishop'),
		('William Williams'),
		('Edward Rodgers'),
		('Timothy Wheeler'),
		('Kenneth Washington'),
		('Stephen Mullins'),
		('Earl Smith'),
		('Carlos Santos'),
		('David Jackson'),
		('Douglas Pierce'),
		('Raymond Reynolds'),
		('Troy Wright'),
		('Jim Williamson'),
		('Ronnie Oliver'),
		('Gregory Jenkins'),
		('Mark Coleman'),
		('Brent Harper'),
		('Frank Young'),
		('Craig Lyons'),
		('David Graham'),
		('Ernest Vasquez'),
		('David Alexander'),
		('Michael Powers'),
		('Jack Gomez'),
		('William Welch'),
		('John Webb'),
		('Justin Santos'),
		('Gene Smith'),
		('Robert Norton');
		
select * from employees	

-- Таблица salary

-- 3) Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null


create table salary(
	id serial primary key,
	monthly_salary integer not null
);

-- 4) Наполнить таблицу salary 15 строками:

insert into salary (monthly_salary)
values  (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);
		
select * from salary;

-- Таблица employee_salary

-- 5) Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null


create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

-- 6) Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary (employee_id, salary_id)
values  (1, 17),
		(2, 37),
		(3, 13),
		(4, 9),
		(5, 10),
		(6, 12),
		(7, 1),
		(8, 29),
		(9, 30),
		(10, 39),
		(11, 22),
		(12, 32),
		(13, 28),
		(14, 31),
		(15, 33),
		(16, 21),
		(17, 67),
		(18, 58),
		(19, 57),
		(20, 11),
		(21, 1),
		(22, 3),
		(23, 4),
		(25, 5),
		(26, 16),
		(27, 22),
		(28, 45),
		(29, 19),
		(30, 62),
		(117, 63),
		(78, 59),
		(92, 14),
		(592, 60),
		(81, 40),
		(89, 50),
		(97, 20),
		(91, 60),
		(85, 55),
		(72, 7);


-- Таблица roles

-- 7) Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique



create table roles(
	id serial primary key,
	role_name int not null unique
);

select * from roles;

-- 8) Поменять тип столба role_name с int на varchar(30)

alter table roles alter column role_name type varchar(30);

-- 9) Наполнить таблицу roles 20 строками:

insert into roles(role_name)
values  ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');

--Таблица roles_employee

-- 10) Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id) references employees(id),
	foreign key (role_id) references roles(id)
);

-- 11) Наполнить таблицу roles_employee 40 строками:
insert into roles_employee(employee_id, role_id)
values  (8, 13),
		(19, 2),
		(35, 14),
		(31, 10),
		(29, 8),
		(2, 19),
		(18, 3),
		(15, 6),
		(3, 18),
		(7, 14),
		(10, 11),
		(40, 19),
		(27, 6),
		(34, 13),
		(21, 19),
		(14, 7),
		(22, 1),
		(20, 1),
		(5, 16),
		(38, 17),
		(12, 9),
		(16, 5),
		(32, 11),
		(39, 18),
		(6, 15),
		(28, 7),
		(1, 20),
		(17, 4),
		(4, 17),
		(33, 12),
		(25, 4),
		(11, 10),
		(13, 8),
		(37, 16),
		(41, 20),
		(26, 5),
		(23, 2),
		(9, 12),
		(36, 15),
		(30, 9);
		
select * from roles_employee;	
	
