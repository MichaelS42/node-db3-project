-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select "ProductName", "CategoryName" from [Product]
join [Category] on Category.id = Product.CategoryId

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select "OrderId", "CompanyName" from [Order]
join [Shipper] on Shipper.Id = [Order].ShipVia
join [OrderDetail] on OrderDetail.OrderId = [Order].id
where[Order].OrderDate > "2012=08-09"
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select "ProductName", "Quantity" from [Order]
join [OrderDetail] on [Order].id = OrderDetail.OrderId
join [ Product] on Product.Id = OrderDetail.ProductId
where OrderDetail.OrderId is 10251
Order by Product.ProductName
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select "OrderId", "CompanyName" as "Customer's Company Name", "LastName" as "Employee Last Name" from [Order]
join [OrderDetail] on [Order].id = OrderDetail.OrderId
join [Customer] on [Order].CustomerId = Customer.id
join [Employee] on [Order].EmployeeId = Employee.Id