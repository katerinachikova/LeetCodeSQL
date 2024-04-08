CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        SELECT DISTINCT salary
        FROM 
        (
          SELECT id, salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rnk 
          FROM Employee) t
        WHERE rnk=@n
    );
END
