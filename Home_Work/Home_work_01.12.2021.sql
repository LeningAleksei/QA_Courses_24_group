SQL HomeWork 3. Joins


DB: подключение к той таблице где делали DDL операции
User: подключение к тем пользователем каким делали DDL операции





 --1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
    select employee_name,monthly_salary from employee_salary1
	    join employees1
		    on employee_salary1.employee_id = employees1.id
	    join  salary1
		    on employee_salary1.salary_id = salary1.id

 --2. Вывести всех работников у которых ЗП меньше 2000.
    select employee_name,monthly_salary from employee_salary1
	    join employees1
		    on employee_salary1.employee_id = employees1.id
	    join  salary1
		    on employee_salary1.salary_id = salary1.id
	where monthly_salary < 2000

 --3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
    select employee_name,monthly_salary from employee_salary1
	    left join employees1
		    on employee_salary1.employee_id = employees1.id
	    right join  salary1
		    on employee_salary1.salary_id = salary1.id
	where employee_name is null

 --4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
    select employee_name,monthly_salary from employee_salary1
	    left join employees1
		    on employee_salary1.employee_id = employees1.id
	    right join  salary1
		    on employee_salary1.salary_id = salary1.id
	where employee_name is null and monthly_salary < 2000

 --5. Найти всех работников кому не начислена ЗП.
   select employee_name,monthly_salary from employee_salary1
	    right join employees1
		    on employee_salary1.employee_id = employees1.id
	    left join  salary1
		    on employee_salary1.salary_id = salary1.id
	where monthly_salary is null 

 --6. Вывести всех работников с названиями их должности.
    select employee_name, role_name from employees1
	    join roles_employee1
	    	on employees1.id = roles_employee1.employee_id
	    join roles1
	   		on roles_employee1.role_id = roles1.id

 --7. Вывести имена и должность только Java разработчиков.
    select employee_name, role_name from employees1
	    join roles_employee1
	        on employees1.id = roles_employee1.employee_id
	    join roles1
	        on roles_employee1.role_id = roles1.id
	where role_name like '%Java developer'
    
 --8. Вывести имена и должность только Python разработчиков.
    select employee_name, role_name from employees1
	    join roles_employee1
	        on employees1.id = roles_employee1.employee_id
	    join roles1
	        on roles_employee1.role_id = roles1.id
	where role_name like '%Python developer'

 --9. Вывести имена и должность всех QA инженеров.
    select employee_name, role_name from employees1
		join roles_employee1
	   		on employees1.id = roles_employee1.employee_id
		join roles1
	   		on roles_employee1.role_id = roles1.id
	where role_name like '%QA engineer'
    
 --10. Вывести имена и должность ручных QA инженеров.
    select employee_name, role_name from employees1
		join roles_employee1
	   		on employees1.id = roles_employee1.employee_id
		join roles1
	   		on roles_employee1.role_id = roles1.id
	where role_name like '%Manual QA engineer'

 --11. Вывести имена и должность автоматизаторов QA
    select employee_name, role_name from employees1
	    join roles_employee1
	        on employees1.id = roles_employee1.employee_id
	    join roles1
	        on roles_employee1.role_id = roles1.id
	where role_name like '%Automation QA engineer'

 --12. Вывести имена и зарплаты Junior специалистов
    select employee_name,role_name,monthly_salary from roles_employee1
	    join roles1 on roles_employee1.role_id = roles1.id
	    join employees1 on roles_employee1.employee_id = employees1.id 
	    join employee_salary1 on employees1.id = employee_salary1.employee_id 
	    join salary1 on employee_salary1.salary_id=salary1.id
	where role_name like '%Junior%'

 --13. Вывести имена и зарплаты Middle специалистов
    select employee_name,role_name,monthly_salary from roles_employee1
	    join roles1 on roles_employee1.role_id = roles1.id
	    join employees1 on roles_employee1.employee_id = employees1.id 
	    join employee_salary1 on employees1.id = employee_salary1.employee_id 
	    join salary1 on employee_salary1.salary_id=salary1.id
	where role_name like '%Middle%'

 --14. Вывести имена и зарплаты Senior специалистов
    select employee_name,role_name,monthly_salary from roles_employee1
	    join roles1 on roles_employee1.role_id = roles1.id
	    join employees1 on roles_employee1.employee_id = employees1.id 
	    join employee_salary1 on employees1.id = employee_salary1.employee_id 
	    join salary1 on employee_salary1.salary_id=salary1.id
	where role_name like '%Senior%'

 --15. Вывести зарплаты Java разработчиков
 	select role_name,monthly_salary from roles1
		join roles_employee1 on roles_employee1.role_id = roles1.id
		join employee_salary1 on roles_employee1.employee_id = employee_salary1.id
		join salary1 on employee_salary1.salary_id = salary1.id 
	where role_name like '%Java developer%'
 
 --16. Вывести зарплаты Python разработчиков
 	select role_name,monthly_salary from roles_employee1 re 
		join roles1 r on re.role_id = r.id 
		join employee_salary1 es on re.employee_id = es.employee_id 
		join salary1 s on es.salary_id = s.id 
	where role_name like '%Python%'

 --17. Вывести имена и зарплаты Junior Python разработчиков
	select employee_name,role_name,monthly_salary from employees1 e 
		join roles_employee1 re on e.id = re.employee_id 
		join employee_salary1 es on es.employee_id = e.id 
		join roles1 r on re.role_id = r.id 
		join salary1 s on es.salary_id = s.id 
	where role_name like '%Junior Python developer%'
	
 --18. Вывести имена и зарплаты Middle JS разработчиков
 	select employee_name,role_name,monthly_salary from employees1 e 
		join roles_employee1 re on e.id = re.employee_id 
		join employee_salary1 es on es.employee_id = e.id 
		join roles1 r on re.role_id = r.id 
		join salary1 s on es.salary_id = s.id 
	where role_name like '%Middle JavaScript developer%'

 --19. Вывести имена и зарплаты Senior Java разработчиков
	select employee_name,role_name,monthly_salary from employees1 e 
		join roles_employee1 re on e.id = re.employee_id 
		join employee_salary1 es on es.employee_id = e.id 
		join roles1 r on re.role_id = r.id 
		join salary1 s on es.salary_id = s.id 
	where role_name like '%Senior Java developer%'

 --20. Вывести зарплаты Junior QA инженеров
 	select employee_name,role_name,monthly_salary from employees1 e 
		join roles_employee1 re on e.id = re.employee_id 
		join employee_salary1 es on es.employee_id = e.id 
		join roles1 r on re.role_id = r.id 
		join salary1 s on es.salary_id = s.id 
	where role_name like '%Junior Manual QA engineer%'

 --21. Вывести среднюю зарплату всех Junior специалистов
	select AVG(monthly_salary) from employees1 e 
		join roles_employee1 re on e.id = re.employee_id 
		join employee_salary1 es on es.employee_id = e.id 
		join roles1 r on re.role_id = r.id 
		join salary1 s on es.salary_id = s.id 
	where role_name like '%Junior%'

 --22. Вывести сумму зарплат JS разработчиков
	select sum(monthly_salary) from employees1 e 
		join roles_employee1 re on e.id = re.employee_id 
		join employee_salary1 es on es.employee_id = e.id 
		join roles1 r on re.role_id = r.id 
		join salary1 s on es.salary_id = s.id 
	where role_name like '%JavaScript developer%'

 --23. Вывести минимальную ЗП QA инженеров
	select min(monthly_salary) from employees1 e 
		join roles_employee1 re on e.id = re.employee_id 
		join employee_salary1 es on es.employee_id = e.id 
		join roles1 r on re.role_id = r.id 
		join salary1 s on es.salary_id = s.id 
	where role_name like '%QA engineer%'

 --24. Вывести максимальную ЗП QA инженеров
	select max(monthly_salary) from employees1 e 
		join roles_employee1 re on e.id = re.employee_id 
		join employee_salary1 es on es.employee_id = e.id 
		join roles1 r on re.role_id = r.id 
		join salary1 s on es.salary_id = s.id 
	where role_name like '%QA engineer%'

 --25. Вывести количество QA инженеров
	select count(role_name) from employees1
		join roles_employee1
	   		on employees1.id = roles_employee1.employee_id
		join roles1
	   		on roles_employee1.role_id = roles1.id
	where role_name like '%Manual QA engineer'

 --26. Вывести количество Middle специалистов.
	select count(role_name) from employees1
		join roles_employee1
	   		on employees1.id = roles_employee1.employee_id
		join roles1
	   		on roles_employee1.role_id = roles1.id
	where role_name like '%Middle%'

 --27. Вывести количество разработчиков
 	select count(role_name) from employees1
		join roles_employee1
	   		on employees1.id = roles_employee1.employee_id
		join roles1
	   		on roles_employee1.role_id = roles1.id
	where role_name like '%developer%'

 --28. Вывести фонд (сумму) зарплаты разработчиков.
 	select sum(monthly_salary) from employees1 e 
		join roles_employee1 re on e.id = re.employee_id 
		join employee_salary1 es on es.employee_id = e.id 
		join roles1 r on re.role_id = r.id 
		join salary1 s on es.salary_id = s.id 
	where role_name like '%developer%'

 --29. Вывести имена, должности и ЗП всех специалистов по возрастанию
	select employee_name,role_name,monthly_salary from employees1 e 
		full join roles_employee1 re on e.id = re.employee_id 
		full join employee_salary1 es on es.employee_id = e.id 
		full join roles1 r on re.role_id = r.id 
		full join salary1 s on es.salary_id = s.id 
	where role_name is not null
		order by role_name

 --30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
 	select employee_name,role_name,monthly_salary from employees1 e 
		join roles_employee1 re on e.id = re.employee_id 
		join employee_salary1 es on es.employee_id = e.id 
		join roles1 r on re.role_id = r.id 
		join salary1 s on es.salary_id = s.id 
	where monthly_salary >1700 and monthly_salary < 2300
		order by monthly_salary

 --31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
  	select employee_name,role_name,monthly_salary from employees1 e 
		join roles_employee1 re on e.id = re.employee_id 
		join employee_salary1 es on es.employee_id = e.id 
		join roles1 r on re.role_id = r.id 
		join salary1 s on es.salary_id = s.id 
	where monthly_salary < 2300
		order by monthly_salary

 --32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
   	select employee_name,role_name,monthly_salary from employees1 e 
		join roles_employee1 re on e.id = re.employee_id 
		join employee_salary1 es on es.employee_id = e.id 
		join roles1 r on re.role_id = r.id 
		join salary1 s on es.salary_id = s.id 
	where monthly_salary = 1100 or monthly_salary = 1500 or monthly_salary = 2000
		order by monthly_salary