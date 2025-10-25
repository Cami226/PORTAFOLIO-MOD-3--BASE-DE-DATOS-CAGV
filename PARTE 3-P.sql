/* 2. Utilizar Lenguaje Estructurado de Consultas (SQL) para la obtención de información que satisface los requerimientos planteados a partir de un modelo de datos dado.
Desarrollar consultas SQL para obtener información específica de las tablas, utilizando cláusulas como SELECT, WHERE, JOIN, GROUP BY, entre otras.
Ejemplo: Crear una consulta que obtenga todos los pedidos realizados por un cliente específico.
*/ 
-- Todos los productos disponibles
SELECT * FROM productos;

-- Pedidos realizados por un cliente específico
SELECT p.pedido_id, p.fecha, c.nombre AS cliente
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
WHERE c.nombre = 'Laura Gómez';

-- Total de ventas por producto
SELECT pr.nombre AS producto, SUM(d.cantidad) AS total_vendido
FROM detalle_pedidos d
JOIN productos pr ON d.producto_id = pr.producto_id
GROUP BY pr.nombre;

-- Total de pedidos por cliente
SELECT c.nombre AS cliente, COUNT(p.pedido_id) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.cliente_id = p.cliente_id
GROUP BY c.nombre;
