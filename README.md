# Project Overview Dashboard – Budget & HR Analysis
This dashboard visualizes organizational project and financial data to provide insights into departmental spending, project distribution, and employee-related costs. Built using SQL for data preparation and Power BI for visualization, the project demonstrates an end-to-end analytical workflow from raw data to business-facing insights.

---

## Objective
- Analyze project, budget, and HR data to flag over-budget or underperforming departments
- Assess whether annual expenses are sustainable within 2-year budget horizons
- Understand how employee salary distribution and project assignments relate to overall project outcomes

---

## Tech Stack
- **PostgreSQL** — CTEs, unions, relational joins
- **Power BI** — data modeling, DAX measures, and interactive dashboard visualization

---

## Workflow
1. **Data Preparation (PostgreSQL)**
   - Unified projects data and store it within CTEs
   - Joined employee, department, project, and budget data into a single analytical table for Power BI
```sql
-- Project Status
WITH project_status AS (
    SELECT project_id, project_name, project_budget, 'Upcoming' AS status
    FROM upcoming_projects
    UNION ALL
    SELECT project_id, project_name, project_budget, 'Completed' AS status
    FROM completed_projects
)
-- Master Table
SELECT 
    employee_id,
    first_name,
    last_name,
    job_title,
    salary,
    department_name,
    project_name,
    status
FROM employees
JOIN departments USING(department_id)
JOIN project_assignments USING(employee_id)
JOIN project_status USING(project_id);
```

2. **Data Modeling (Power BI)**
   - Defined relationships between employees, departments, and projects
   - Built KPIs for budget usage, salary allocation, and project cost distribution

3. **Dashboard Development**
   - Interactive filters by department and employee
   - Visual tracking of budget vs actuals
   - Drill-down into project-level and employee-level cost context

---

## Dashboard Preview
![02_project_overview_dashboard_page-0001](https://github.com/user-attachments/assets/334ef220-fe82-476b-a297-053cdb72f540)

---

## What the Dashboard Shows
### 1. Department-level budget vs. actual spending
Compares 1-year departmental budgets against project costs, salary expenses, and capital allocation to quickly identify departments that may be overspending or underutilizing their budgets.
### 2. Project Status Visibility
Breaks down total project budgets into Completed and Upcoming projects, helping assess how current spending aligns with ongoing and future initiatives.
### 3. Employee Cost Context
Insight into salary distribution by department and project, providing context on how workforce costs contribute to overall spending.
### 4. Project budget allocation and prioritization
Highlights how budgets are distributed across different projects and departments, making it easier to spot high-cost initiatives and potential financial risks.
### 5. Interactive Filtering for Decision Support
Dynamic filters (department, employee, project) that allow stakeholders to explore specific areas of interest and drill down into details as needed.

---

## Key Insights
- All departments operate within their allocated 1-year budgets, with no instances of overspending.
- Remaining capital across departments provides flexibility for scaling projects or funding new initiatives without immediate budget pressure.
- Salaries range from $68K–$95K, with higher compensation aligned to IT roles (e.g., Data Scientist)
- Sales and Marketing drive the highest project spending, with Sales accounting for the largest share of total project costs, followed by Marketing and Engineering. These departments are the primary cost centers and require closer budget monitoring.
- Most project budgets are allocated to upcoming initiatives, indicating a forward-looking investment strategy. However, this also increases short-term financial risk if execution or timelines slip.

## 👤 About the Author
**Muhammad Naufaldi**  
Physics graduate with interest in technology, innovation, and data analysis.

### 🌐 Contact
- **LinkedIn:** https://www.linkedin.com/in/muhammad-naufaldi-608517246/
- **Portfolio:** https://linktr.ee/PortofolioNaufaldi
