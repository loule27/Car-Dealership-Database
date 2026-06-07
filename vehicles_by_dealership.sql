SELECT v.VIN, v.year, v.make, v.model, v.color, v.price, v.sold
FROM vehicles v
JOIN inventory i ON v.VIN = i.VIN
WHERE i.dealership_id = 1;