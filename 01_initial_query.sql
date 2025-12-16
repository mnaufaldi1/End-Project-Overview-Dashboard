-- PROJECT STATUS
WITH project_status AS (
SELECT project_id, project_name, project_budget, 'Upcoming' AS status
FROM upcoming_projects
UNION ALL
SELECT project_id, project_name, project_budget, 'Completed' AS status
FROM completed_projects)

-- BIG TABLE
SELECT employee_id, first_name, last_name, job_title, salary,
department_name, project_name, status
FROM employees 
JOIN departments 
USING(department_id)
JOIN project_assignments 
USING(employee_id)
JOIN project_status
USING(project_id);
