/* Implementar estructuras de datos relacionales utilizando lenguaje de definición de datos (DDL) a partir de un modelo de datos para la creación y mantención de las definiciones de los objetos de una base de datos.
Utilizar el lenguaje DDL para crear, modificar y eliminar tablas, índices y otros objetos dentro de una base de datos.
Ejemplo: Crear una tabla para almacenar información de empleados, con las columnas correspondientes como nombre, salario y fecha de ingreso.
*/


-- Actualizar stock tras una venta
UPDATE productos
SET stock = stock - 2
WHERE producto_id = 2;

-- Eliminar un pedido (y su detalle)
DELETE FROM pedidos WHERE pedido_id = 2;

-- Transacción: registrar un nuevo pedido
START TRANSACTION;
INSERT INTO pedidos (fecha, cliente_id, metodo_pago_id)
VALUES (CURDATE(), 1, 2);

SET @nuevo_pedido = LAST_INSERT_ID();

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, subtotal)
VALUES (@nuevo_pedido, 1, 1, 3500.00);

UPDATE productos SET stock = stock - 1 WHERE producto_id = 1;
COMMIT;
