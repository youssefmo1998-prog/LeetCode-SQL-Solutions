/*
Description: Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas)
URL : https://leetcode.com/problems/second-highest-salary/description/
*/
SELECT (
    SELECT DISTINCT salary 
    FROM Employee 
    ORDER BY salary DESC 
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;
