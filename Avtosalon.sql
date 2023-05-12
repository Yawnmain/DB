
-- Структура таблицы `clients`

CREATE TABLE clients (
  client_id INTEGER PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone VARCHAR(15),
  email VARCHAR(50)
);

-- Дамп данных таблицы `clients`

INSERT INTO clients (client_id, first_name, last_name, phone, email)
VALUES (1, 'John', 'Doe', '+1-555-123-4567', 'johndoe@example.com');

-- Структура таблицы `cars`

CREATE TABLE cars (
  car_id INTEGER PRIMARY KEY,
  make VARCHAR(50),
  model VARCHAR(50),
  year INTEGER,
  price DECIMAL(10, 2),
  supplier_id INTEGER
);

-- Дамп данных таблицы `cars`

INSERT INTO cars (car_id, make, model, year, price, supplier_id)
VALUES (1, 'Toyota', 'Corolla', 2022, 20000.00, 1);

-- Структура таблицы `orders`

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  client_id INTEGER,
  car_id INTEGER,
  order_date DATE,
  order_type VARCHAR(10),
  order_status VARCHAR(20)
);

-- Дамп данных таблицы `orders`

INSERT INTO orders (order_id, client_id, car_id, order_date, order_type, order_status)
VALUES (1, 1, 1, '2023-05-12', 'purchase', 'completed');

-- Структура таблицы `employees`

CREATE TABLE employees (
  employee_id INTEGER PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone VARCHAR(15),
  email VARCHAR(50),
  department VARCHAR(20),
  hire_date DATE,
  salary DECIMAL(10, 2)
);

-- Дамп данных таблицы `employees`

INSERT INTO employees (employee_id, first_name, last_name, phone, email, department, hire_date, salary)
VALUES (1, 'Jane', 'Smith', '+1-555-987-6543', 'janesmith@example.com', 'sales', '2022-01-01', 50000.00);

-- Структура таблицы `suppliers`

CREATE TABLE suppliers (
  supplier_id INTEGER PRIMARY KEY,
  supplier_name VARCHAR(50),
  phone VARCHAR(15),
  email VARCHAR(50)
);

-- Дамп данных таблицы `suppliers`

INSERT INTO suppliers (supplier_id, supplier_name, phone, email)
VALUES (1, 'ABC Auto', '+1-555-555-5555', 'info@abcauto.com');

-- Структура таблицы `sales_department`

CREATE TABLE sales_department (
  sale_id INTEGER PRIMARY KEY,
  employee_id INTEGER,
  car_id INTEGER,
  sale_date DATE,
  sale_price DECIMAL(10, 2)
);

-- Дамп данных таблицы `sales_department`

INSERT INTO sales_department (sale_id, employee_id, car_id, sale_date, sale_price)
VALUES (1, 1, 1, '2023-05-12', 21000.00);

-- Структура таблицы `service_department`

CREATE TABLE service_department (
  repair_id INTEGER PRIMARY KEY,
  employee_id INTEGER,
  car_id INTEGER,
  repair_date DATE,
  repair_type VARCHAR(20),
  repair_cost DECIMAL(10, 2)
);

-- Дамп данных таблицы `service_department`

INSERT INTO service_department (repair_id, employee_id, car_id, repair_date, repair_type, repair_cost)
VALUES (1, 1, 1, '2023-05-12', 'engine repair', 5000.00);

-- Связь между таблицей orders и таблицей clients с помощью поля client_id

ALTER TABLE orders
ADD CONSTRAINT fk_orders_clients
FOREIGN KEY (client_id)
REFERENCES clients(client_id);

-- Связь между таблицей orders и таблицей cars с помощью поля car_id

ALTER TABLE orders
ADD CONSTRAINT fk_orders_cars
FOREIGN KEY (car_id)
REFERENCES cars(car_id);

-- Связь между таблицей sales_department и таблицей employees с помощью поля employee_id

ALTER TABLE sales_department
ADD CONSTRAINT fk_sales_department_employees
FOREIGN KEY (employee_id)
REFERENCES employees(employee_id);

-- Связь между таблицей sales_department и таблицей cars с помощью поля car_id

ALTER TABLE sales_department
ADD CONSTRAINT fk_sales_department_cars
FOREIGN KEY (car_id)
REFERENCES cars(car_id);

-- Связь между таблицей service_department и таблицей employees с помощью поля employee_id

ALTER TABLE service_department
ADD CONSTRAINT fk_service_department_employees
FOREIGN KEY (employee_id)
REFERENCES employees(employee_id);

-- Связь между таблицей service_department и таблицей cars с помощью поля car_id

ALTER TABLE service_department
ADD CONSTRAINT fk_service_department_cars
FOREIGN KEY (car_id)
REFERENCES cars(car_id);

-- Связь между таблицей cars и таблицей suppliers с помощью поля supplier_id

ALTER TABLE cars
ADD CONSTRAINT fk_cars_suppliers
FOREIGN KEY (supplier_id)
REFERENCES suppliers(supplier_id);

-- Представление для отображения информации о клиентах и их заказах

GO
CREATE VIEW client_orders_view AS
SELECT clients.first_name, clients.last_name, orders.order_id, orders.order_date, orders.order_type, orders.order_status
FROM clients
JOIN orders ON clients.client_id = orders.client_id;

-- Представление для отображения информации о продажах

GO
CREATE VIEW sales_view AS
SELECT employees.first_name, employees.last_name, cars.make, cars.model, sales_department.sale_date, sales_department.sale_price
FROM sales_department
JOIN employees ON sales_department.employee_id = employees.employee_id
JOIN cars ON sales_department.car_id = cars.car_id;

-- Представление для отображения информации о ремонтах

GO
CREATE VIEW repairs_view AS
SELECT employees.first_name, employees.last_name, cars.make, cars.model, service_department.repair_date, service_department.repair_type, service_department.repair_cost
FROM service_department
JOIN employees ON service_department.employee_id = employees.employee_id
JOIN cars ON service_department.car_id = cars.car_id;
