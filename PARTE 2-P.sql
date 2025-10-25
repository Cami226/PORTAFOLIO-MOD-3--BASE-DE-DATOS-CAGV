/*3. Utilizar lenguaje de manipulación de datos (DML) para la modificación de los datos existentes en una base de datos dando solución a un problema planteado.
Implementar consultas de inserción (INSERT), actualización (UPDATE) y eliminación (DELETE) para modificar los datos dentro de las tablas.
Ejemplo: Crear una consulta que actualice la dirección de un cliente en la base de datos o elimine un pedido que no fue procesado.

*/


-- Insertar clientes
INSERT INTO clientes (nombre, direccion, telefono, email) VALUES
('Laura Gómez', 'Av. Central 123', '955-123475', 'laura@example.com'),
('Carlos Ruiz', 'Calle Norte 45', '955-987655', 'carlos@example.com');

-- Insertar productos
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Laptop HP', 'Laptop 15" con 8GB RAM', 3500000.00, 10),
('Mouse Logitech', 'Mouse inalámbrico ergonómico', 150000.00, 30),
('Teclado Mecánico', 'Teclado retroiluminado RGB', 220000.00, 20);

-- Insertar métodos de pago
INSERT INTO metodos_pago (nombre) VALUES
('Tarjeta de crédito'), ('Transferencia'), ('Efectivo');

-- Insertar pedidos
INSERT INTO pedidos (fecha, cliente_id, metodo_pago_id) VALUES
('2025-10-20', 1, 1),
('2025-10-21', 2, 3);

-- Insertar detalle de pedidos
INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, subtotal) VALUES
(1, 1, 1, 350500.00),
(1, 2, 2, 300850.00),
(2, 3, 1, 220080.00);
