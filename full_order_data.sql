/*
3. Перейдіть до бази даних, з якою працювали у темі 3. 
Напишіть запит за допомогою операторів FROM та INNER JOIN, 
що об’єднує всі таблиці даних, які ми завантажили з файлів: 
order_details, orders, customers, products, categories, employees, 
shippers, suppliers. Для цього ви маєте знайти спільні ключі.

Перевірте правильність виконання запиту.
*/

-- Task 3
USE `goit-rdb-hw-03`;

SELECT *
FROM
	order_details as od
INNER JOIN
	orders as o
	ON od.order_id = o.id
	INNER JOIN
		customers as c
		ON o.customer_id = c.id
	INNER JOIN
		employees as e
		ON o.employee_id = e.employee_id
	INNER JOIN
		shippers as sh
		ON o.shipper_id = sh.id
INNER JOIN
	products as p
	ON od.product_id = p.id
	INNER JOIN
		suppliers as sp
		ON p.supplier_id = sp.id
	INNER JOIN
		categories as cg
		ON p.category_id = cg.id;

/*
4. Виконайте запити, перелічені нижче.

4.1. Визначте, скільки рядків ви отримали (за допомогою оператора COUNT).
4.2. Змініть декілька операторів INNER на LEFT чи RIGHT. Визначте, що відбувається з кількістю рядків. 
Чому? Напишіть відповідь у текстовому файлі.
4.3. На основі запита з пункта 3 виконайте наступне: оберіть тільки ті рядки, 
де employee_id > 3 та ≤ 10.
4.4. Згрупуйте за іменем категорії, порахуйте кількість рядків у групі, середню кількість товару 
(кількість товару знаходиться в order_details.quantity)
4.5. Відфільтруйте рядки, де середня кількість товару більша за 21.
4.6. Відсортуйте рядки за спаданням кількості рядків.
4.7. Виведіть на екран (оберіть) чотири рядки з пропущеним першим рядком.
*/

-- Task 4.1
SELECT SUM(1) as row_count -- or COUNT(*)
FROM
	order_details as od
INNER JOIN
	orders as o
	ON od.order_id = o.id
	INNER JOIN
		customers as c
		ON o.customer_id = c.id
	INNER JOIN
		employees as e
		ON o.employee_id = e.employee_id
	INNER JOIN
		shippers as sh
		ON o.shipper_id = sh.id
INNER JOIN
	products as p
	ON od.product_id = p.id
	INNER JOIN
		suppliers as sp
		ON p.supplier_id = sp.id
	INNER JOIN
		categories as cg
		ON p.category_id = cg.id;
-- row_count = 518

-- Task 4.2
SELECT SUM(1) as row_count -- or COUNT(*)
FROM
	order_details as od
LEFT JOIN
	orders as o
	ON od.order_id = o.id
	INNER JOIN
		customers as c
		ON o.customer_id = c.id
	INNER JOIN
		employees as e
		ON o.employee_id = e.employee_id
	INNER JOIN
		shippers as sh
		ON o.shipper_id = sh.id
LEFT JOIN
	products as p
	ON od.product_id = p.id
	INNER JOIN
		suppliers as sp
		ON p.supplier_id = sp.id
	INNER JOIN
		categories as cg
		ON p.category_id = cg.id;
-- row_count = 518

-- Task 4.3	
SELECT *
FROM
	order_details as od
INNER JOIN
	orders as o
	ON od.order_id = o.id
	INNER JOIN
		customers as c
		ON o.customer_id = c.id
	INNER JOIN
		employees as e
		ON o.employee_id = e.employee_id
	INNER JOIN
		shippers as sh
		ON o.shipper_id = sh.id
INNER JOIN
	products as p
	ON od.product_id = p.id
	INNER JOIN
		suppliers as sp
		ON p.supplier_id = sp.id
	INNER JOIN
		categories as cg
		ON p.category_id = cg.id
WHERE
	o.employee_id > 3 AND o.employee_id <= 10;
    
-- Task 4.4
SELECT
	cg.name as category_name,
	COUNT(od.id) as row_count,
    AVG(od.quantity) as avg_qty
FROM
	order_details as od
INNER JOIN
	orders as o
	ON od.order_id = o.id
	INNER JOIN
		customers as c
		ON o.customer_id = c.id
	INNER JOIN
		employees as e
		ON o.employee_id = e.employee_id
	INNER JOIN
		shippers as sh
		ON o.shipper_id = sh.id
INNER JOIN
	products as p
	ON od.product_id = p.id
	INNER JOIN
		suppliers as sp
		ON p.supplier_id = sp.id
	INNER JOIN
		categories as cg
		ON p.category_id = cg.id
WHERE
	o.employee_id > 3 AND o.employee_id <= 10
GROUP BY
	cg.name;
 
-- Task 4.5
SELECT
	cg.name as category_name,
	COUNT(od.id) as row_count,
    AVG(od.quantity) as avg_qty
FROM
	order_details as od
INNER JOIN
	orders as o
	ON od.order_id = o.id
	INNER JOIN
		customers as c
		ON o.customer_id = c.id
	INNER JOIN
		employees as e
		ON o.employee_id = e.employee_id
	INNER JOIN
		shippers as sh
		ON o.shipper_id = sh.id
INNER JOIN
	products as p
	ON od.product_id = p.id
	INNER JOIN
		suppliers as sp
		ON p.supplier_id = sp.id
	INNER JOIN
		categories as cg
		ON p.category_id = cg.id
WHERE
	o.employee_id > 3 AND o.employee_id <= 10
GROUP BY
	cg.name
HAVING
	AVG(od.quantity) > 21;
 
-- Task 4.6
SELECT
	cg.name as category_name,
	COUNT(od.id) as row_count,
    AVG(od.quantity) as avg_qty
FROM
	order_details as od
INNER JOIN
	orders as o
	ON od.order_id = o.id
	INNER JOIN
		customers as c
		ON o.customer_id = c.id
	INNER JOIN
		employees as e
		ON o.employee_id = e.employee_id
	INNER JOIN
		shippers as sh
		ON o.shipper_id = sh.id
INNER JOIN
	products as p
	ON od.product_id = p.id
	INNER JOIN
		suppliers as sp
		ON p.supplier_id = sp.id
	INNER JOIN
		categories as cg
		ON p.category_id = cg.id
WHERE
	o.employee_id > 3 AND o.employee_id <= 10
GROUP BY
	cg.name
HAVING
	AVG(od.quantity) > 21
ORDER BY
	row_count DESC;
    
-- Task 4.7
SELECT
	cg.name as category_name,
	COUNT(od.id) as row_count,
    AVG(od.quantity) as avg_qty
FROM
	order_details as od
INNER JOIN
	orders as o
	ON od.order_id = o.id
	INNER JOIN
		customers as c
		ON o.customer_id = c.id
	INNER JOIN
		employees as e
		ON o.employee_id = e.employee_id
	INNER JOIN
		shippers as sh
		ON o.shipper_id = sh.id
INNER JOIN
	products as p
	ON od.product_id = p.id
	INNER JOIN
		suppliers as sp
		ON p.supplier_id = sp.id
	INNER JOIN
		categories as cg
		ON p.category_id = cg.id
WHERE
	o.employee_id > 3 AND o.employee_id <= 10
GROUP BY
	cg.name
HAVING
	AVG(od.quantity) > 21
ORDER BY
	row_count DESC
LIMIT 4 OFFSET 1;