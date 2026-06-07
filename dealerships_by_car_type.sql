SELECT DISTINCT d.name, d.address, d.phone
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v  ON i.VIN = v.VIN
WHERE v.color = 'Red'
  AND v.make  = 'Ford'
  AND v.model = 'Mustang';