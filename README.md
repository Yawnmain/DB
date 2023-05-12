# Проектирование базы данных для автосалона

## Описание

БД предназначена для управления автомобильным дилерским центром. Она содержит информацию о клиентах, автомобилях, поставщиках, сотрудниках, заказах, продажах и услугах.

С помощью этой базы данных можно отслеживать информацию о клиентах, их контактных данных, истории заказов и покупок, а также их предпочтениях. База данных также позволяет хранить информацию о моделях автомобилей, поставщиках и ценах на них, что упрощает управление запасами и ценообразованием.

С помощью базы данных можно отслеживать историю продаж, зарплат сотрудников и другую информацию, связанную с управлением продажами и обслуживанием автомобилей.

БД состоит из таблиц:

## Таблица "clients"
Хранит информацию о клиентах, такую как их имя, номер телефона и адрес электронной почты.

| Поле      | Тип данных | Описание                               |
|-----------|------------|----------------------------------------|
client_id|	INTEGER|	Идентификатор клиента|
first_name|	VARCHAR|	Имя клиента|
last_name|	VARCHAR|	Фамилия клиента|
phone|	VARCHAR|	Номер телефона клиента|
email|	VARCHAR|	Адрес электронной почты клиента|

## Таблица "cars"
Хранит информацию об автомобилях, такую как их марку, модель, год выпуска, цену и идентификатор поставщика, который их предоставляет.

| Поле      | Тип данных | Описание                               |
|-----------|------------|----------------------------------------|
car_id|	INTEGER|	Идентификатор автомобиля|
make|	VARCHAR|	Марка автомобиля|
model|	VARCHAR|	Модель автомобиля|
year|	INTEGER|	Год выпуска автомобиля|
price|	DECIMAL|	Цена автомобиля|
supplier_id|	INTEGER|	Идентификатор поставщика|

## Таблица "orders"
Хранит информацию о заказах, такую как идентификатор клиента, который разместил заказ, идентификатор заказанного автомобиля, дату заказа и тип и статус заказа.

| Поле      | Тип данных | Описание                               |
|-----------|------------|----------------------------------------|
order_id|	INTEGER|	Идентификатор заказа|
client_id|	INTEGER|	Идентификатор клиента|
car_id|	INTEGER|	Идентификатор автомобиля|
order_date|	DATE|	Дата заказа|
order_type|	VARCHAR|	Тип заказа (покупка или аренда)|
order_status|	VARCHAR|	Статус заказа|

## Таблица "employees"
Хранит информацию о сотрудниках, такую как их имя, номер телефона, адрес электронной почты, отдел, дату найма и зарплату.

| Поле      | Тип данных | Описание                               |
|-----------|------------|----------------------------------------|
employee_id|	INTEGER|	Идентификатор сотрудника|
first_name|	VARCHAR|	Имя сотрудника|
last_name|	VARCHAR|	Фамилия сотрудника|
phone|	VARCHAR|	Номер телефона сотрудника|
email|	VARCHAR|	Адрес электронной почты сотрудника|
department|	VARCHAR|	Департамент, в котором работает сотрудник|
hire_date|	DATE|	Дата принятия на работу сотрудника|
salary|	DECIMAL|	Заработная плата сотрудника|

## Таблица "suppliers"
Хранит информацию о поставщиках автомобилей, такую как название, номер телефона и адрес электронной почты.

| Поле      | Тип данных | Описание                               |
|-----------|------------|----------------------------------------|
supplier_id|	INTEGER|	Идентификатор поставщика|
supplier_name|	VARCHAR|	Название поставщика|
phone|	VARCHAR|	Номер телефона поставщика|
email|	VARCHAR|	Адрес электронной почты поставщика|

## Таблица "sales_department"
Хранит информацию о продажах автомобилей, такую как идентификатор сотрудника, который сделал продажу, идентификатор проданного автомобиля, дату продажи и цену продажи.

| Поле      | Тип данных | Описание                               |
|-----------|------------|----------------------------------------|
sale_id|	INTEGER|	Идентификатор продажи|
employee_id|	INTEGER|	Идентификатор сотрудника, осуществившего продажу|
car_id|	INTEGER|	Идентификатор автомобиля, проданный сотрудником|
sale_date|	DATE|	Дата продажи|
sale_price|	DECIMAL|	Цена продажи|

## Таблица "service_department"
Хранит информацию об ремонте автомобилей, такую как идентификатор сотрудника, выполнившего ремонт, идентификатор отремонтированного автомобиля, дату ремонта, тип выполненного ремонта и стоимость ремонта.

| Поле      | Тип данных | Описание                               |
|-----------|------------|----------------------------------------|
repair_id|	INTEGER|	Идентификатор ремонта|
employee_id|	INTEGER|	Идентификатор сотрудника, выполнившего ремонт|
car_id|	INTEGER|	Идентификатор машины, на которой проводился ремонт|
repair_date|	DATE|	Дата проведения ремонта|
repair_type|	VARCHAR(20)|	Тип ремонта (например, техническое обслуживание, замена деталей)|
repair_cost|	DECIMAL(10,2)|	Стоимость ремонта|


## Взаимосвязи:

![image](https://github.com/Yawnmain/DB/blob/main/Связи.png?raw=true)

* Каждый клиент может сделать несколько заказов, но каждый заказ может быть сделан только одним клиентом.

* Каждый автомобиль может быть включен в несколько заказов, но каждый заказ может включать только один автомобиль.

* Каждая продажа или ремонт может быть сделан только для одного автомобиля, а каждый автомобиль может быть продан или отремонтирован только один раз.

* Каждый сотрудник может быть связан с несколькими продажами или ремонтами, но каждая продажа или ремонт может быть связан только с одним сотрудником.

* Каждый поставщик может поставлять несколько автомобилей, но каждый автомобиль может быть поставлен только одним поставщиком.


## Представления:

1. Отображение информации о клиентах и их заказах:

```sql
CREATE VIEW client_orders_view AS
SELECT clients.first_name, clients.last_name, orders.order_id, orders.order_date, orders.order_type, orders.order_status
FROM clients
JOIN orders ON clients.client_id = orders.client_id;
```

2. Отображение информации о продажах:

```sql
CREATE VIEW sales_view AS
SELECT employees.first_name, employees.last_name, cars.make, cars.model, sales_department.sale_date, sales_department.sale_price
FROM sales_department
JOIN employees ON sales_department.employee_id = employees.employee_id
JOIN cars ON sales_department.car_id = cars.car_id;
```

3. Отображения информации о ремонтах:

```sql
CREATE VIEW repairs_view AS
SELECT employees.first_name, employees.last_name, cars.make, cars.model, service_department.repair_date, service_department.repair_type, service_department.repair_cost
FROM service_department
JOIN employees ON service_department.employee_id = employees.employee_id
JOIN cars ON service_department.car_id = cars.car_id;
```

## Создание таблиц:

```sql
CREATE TABLE clients (
  client_id INTEGER PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone VARCHAR(15),
  email VARCHAR(50)
);

CREATE TABLE cars (
  car_id INTEGER PRIMARY KEY,
  make VARCHAR(50),
  model VARCHAR(50),
  year INTEGER,
  price DECIMAL(10, 2),
  supplier_id INTEGER
);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  client_id INTEGER,
  car_id INTEGER,
  order_date DATE,
  order_type VARCHAR(10),
  order_status VARCHAR(20)
);

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

CREATE TABLE suppliers (
  supplier_id INTEGER PRIMARY KEY,
  supplier_name VARCHAR(50),
  phone VARCHAR(15),
  email VARCHAR(50)
);

CREATE TABLE sales_department (
  sale_id INTEGER PRIMARY KEY,
  employee_id INTEGER,
  car_id INTEGER,
  sale_date DATE,
  sale_price DECIMAL(10, 2)
);

CREATE TABLE service_department (
  repair_id INTEGER PRIMARY KEY,
  employee_id INTEGER,
  car_id INTEGER,
  repair_date DATE,
  repair_type VARCHAR(20),
  repair_cost DECIMAL(10, 2)
);

```

## Создание взаимосвязей:

```sql
ALTER TABLE orders
ADD CONSTRAINT fk_orders_clients
FOREIGN KEY (client_id)
REFERENCES clients(client_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_cars
FOREIGN KEY (car_id)
REFERENCES cars(car_id);

ALTER TABLE sales_department
ADD CONSTRAINT fk_sales_department_employees
FOREIGN KEY (employee_id)
REFERENCES employees(employee_id);

ALTER TABLE sales_department
ADD CONSTRAINT fk_sales_department_cars
FOREIGN KEY (car_id)
REFERENCES cars(car_id);

ALTER TABLE service_department
ADD CONSTRAINT fk_service_department_employees
FOREIGN KEY (employee_id)
REFERENCES employees(employee_id);

ALTER TABLE service_department
ADD CONSTRAINT fk_service_department_cars
FOREIGN KEY (car_id)
REFERENCES cars(car_id);


ALTER TABLE cars
ADD CONSTRAINT fk_cars_suppliers
FOREIGN KEY (supplier_id)
REFERENCES suppliers(supplier_id);
```

# Примеры запросов для типовых операций:

## Создание записей в таблице clients:

```sql
INSERT INTO clients (client_id, first_name, last_name, phone, email)
VALUES (1, 'John', 'Doe', '+1-555-123-4567', 'johndoe@example.com');
```

## Удаление записей в таблице clients:

```sql
DELETE FROM clients WHERE client_id = 1;
```
Этот запрос удалит запись клиента с client_id равным 1

## Изменение записей в таблице clients:

```sql
UPDATE clients SET first_name = 'Jane', last_name = 'Doe' WHERE client_id = 1;
```
Этот запрос изменит имя и фамилию клиента с client_id равным 1 на 'Jane' и 'Doe' соответственно

## Создание записей в таблице cars:

```sql
INSERT INTO cars (car_id, make, model, year, price, supplier_id)
VALUES (1, 'Toyota', 'Corolla', 2022, 20000.00, 1);
```

## Удаление записей в таблице cars:

```sql
DELETE FROM cars WHERE car_id = 1;
```
Этот запрос удалит запись автомобиля с car_id равным 1.

## Изменение записей в таблице cars:

```sql
UPDATE cars SET price = 25000.00 WHERE car_id = 1;
```
Этот запрос изменит цену автомобиля с car_id равным 1 на 25000.00

## Создание записей в таблице orders:

```sql
INSERT INTO orders (order_id, client_id, car_id, order_date, order_type, order_status)
VALUES (1, 1, 1, '2023-05-12', 'purchase', 'completed');
```

## Удаление записей в таблице orders:

```sql
DELETE FROM orders WHERE order_id = 1;
```
Этот запрос удалит запись заказа с order_id равным 1

## Изменение записей в таблице orders:

```sql
UPDATE orders SET order_status = 'canceled' WHERE order_id = 1;
```
Этот запрос изменит статус заказа с order_id равным 1 на 'canceled'

## Создание записей в таблице employees:

```sql
INSERT INTO employees (employee_id, first_name, last_name, phone, email, department, hire_date, salary)
VALUES (1, 'Jane', 'Smith', '+1-555-987-6543', 'janesmith@example.com', 'sales', '2022-01-01', 50000.00);
```

## Удаление записей в таблице employees:

```sql
DELETE FROM employees WHERE employee_id = 1;
```

## Изменение записей в таблице employees:

```sql
UPDATE employees SET salary = 60000.00 WHERE employee_id = 1;
```
Этот запрос изменит зарплату сотрудника с employee_id равным 1 на 60000.00










































