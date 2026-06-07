SELECT d.name AS dealership, sc.date, sc.customer_name, sc.customer_email,
v.make, v.model, v.year, sc.total_price, sc.finance_option
FROM sales_contracts sc
JOIN vehicles v ON sc.VIN = v.VIN
JOIN inventory i ON v.VIN  = i.VIN
JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE d.dealership_id = 1
  AND sc.date BETWEEN '20210101' AND '20221231'
ORDER BY sc.date;