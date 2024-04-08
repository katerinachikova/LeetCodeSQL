select d.name as Department,
        e.name as Employee,
        t.max_salary as Salary
from
(select departmentId, max(salary) as max_salary
from employee e
 group by departmentId) t
 join department d on t.departmentId=d.id
 join employee e on t.max_salary=e.salary and t.departmentId=e.departmentId
