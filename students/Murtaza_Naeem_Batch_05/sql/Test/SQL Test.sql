--Q1. List top 5 customers by total order amount.
--Retrieve the top 5 customers who have spent the most across all sales orders. Show CustomerID, CustomerName, and TotalSpent.

SELECT TOP 5 
    c.CustomerID, 
    c.Name AS CustomerName, 
    SUM(so.TotalAmount) AS TotalSpent
FROM customer c
JOIN salesorder so ON c.CustomerID = so.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC;

--Q2. Find the number of products supplied by each supplier.
--Display SupplierID, SupplierName, and ProductCount. Only include suppliers that have more than 10 products.

SELECT 
    s.SupplierID, 
    s.Name AS SupplierName, 
    COUNT(DISTINCT pod.ProductID) AS ProductCount
FROM supplier s
JOIN purchaseorder po ON s.SupplierID = po.SupplierID
JOIN purchaseorderdetail pod ON po.OrderID = pod.OrderID
GROUP BY s.SupplierID, s.Name
HAVING COUNT(DISTINCT pod.ProductID) > 10;

--Q3. Identify products that have been ordered but never returned.
--Show ProductID, ProductName, and total order quantity.

SELECT 
    p.ProductID, 
    p.Name AS ProductName, 
    SUM(sod.Quantity) AS TotalOrderQuantity
FROM product p
JOIN salesorderdetail sod ON p.ProductID = sod.ProductID
LEFT JOIN ReturnDetail rd ON p.ProductID = rd.ProductID
WHERE rd.ProductID IS NULL
GROUP BY p.ProductID, p.Name;
    

--Q4. For each category, find the most expensive product.
--Display CategoryID, CategoryName, ProductName, and Price. Use a subquery to get the max price per category.

--Q5. List all sales orders with customer name, product name, category, and supplier.
--For each sales order, display:
--OrderID, CustomerName, ProductName, CategoryName, SupplierName, and Quantity.

--Q6. Find all shipments with details of warehouse, manager, and products shipped.
--Display:
--ShipmentID, WarehouseName, ManagerName, ProductName, QuantityShipped, and TrackingNumber.

--Q7. Find the top 3 highest-value orders per customer using RANK(). Display CustomerID, CustomerName, OrderID, and TotalAmount.

--Q8. For each product, show its sales history with the previous and next sales quantities (based on order date). Display ProductID, ProductName, OrderID, OrderDate, Quantity, PrevQuantity, and NextQuantity.

--Q9. Create a view named vw_CustomerOrderSummary that shows for each customer:
--CustomerID, CustomerName, TotalOrders, TotalAmountSpent, and LastOrderDate.

--Q10. Write a stored procedure sp_GetSupplierSales that takes a SupplierID as input and returns the total sales amount for all products supplied by that supplier.


