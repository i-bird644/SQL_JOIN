/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

select products.Name as 'Products', categories.Name as 'Category' from products
inner join categories
on products.CategoryID = categories.CategoryID
where categories.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

select products.Name, products.Price, reviews.Rating from products
inner join reviews
on products.ProductID = reviews.ProductID
where reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

select employees.EmployeeID, FirstName, LastName, sum(Quantity) from employees
inner join sales
on employees.EmployeeID = sales.EmployeeID
group by employees.EmployeeID
having sum(Quantity) = (
	select sum(Quantity) from employees
	inner join sales
	on employees.EmployeeID = sales.EmployeeID
	group by employees.EmployeeID
	order by sum(Quantity) desc
    limit 1
);
/*where employees.EmployeeID = 32790 AND employees.FirstName = 'Duane';*/

/* joins: find the name of the department, and the name of the category for Appliances and Games */

select departments.Name, categories.Name from categories
inner join departments
on categories.DepartmentID = departments.DepartmentID
where categories.Name = 'Appliances' or categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT 
	products.ProductID,
    products.Name,
    SUM(Quantity) AS total_sold,
    SUM(Quantity * PricePerUnit) AS total_price_sold
FROM 
    products
inner join sales  
on sales.ProductID = products.ProductID  
WHERE 
    Name = 'Eagles: Hotel California'
    group by products.ProductID;   

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

select Name, Reviewer, Rating, Comment from products
inner join reviews
on products.ProductID = reviews.ProductID
where name like '%Visio%TV%' and rating = 1;

/*-- ------------------------------------------ Extra - May be difficult*/
/* Your goal is to write a query that serves as an employee sales report.*/


select 
	sales.EmployeeID, 
	FirstName, 
	LastName, 
	Name as 'Product Name', 
	SUM(QUANTITY)
from employees
inner join sales
on employees.EmployeeID = sales.EmployeeID
inner join products
on products.ProductID = sales.ProductID
group by sales.EmployeeID, products.ProductID;