/* 1. Distinguir las características, rol y elementos fundamentales de una base de datos relacional para la gestión de la información en una organización.
Describir los componentes básicos de una base de datos relacional: tablas, registros, campos, claves primarias y foráneas.
Explicar cómo se gestionan y almacenan los datos en tablas y cómo se establece la relación entre ellas para satisfacer necesidades organizacionales.
Ejemplo: Crear una tabla de clientes y otra de pedidos, relacionándolas por una clave foránea.
*/

CREATE DATABASE tienda_online;
USE tienda_online;

-- Tabla de clientes
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150),
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla de productos
CREATE TABLE productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) CHECK (precio > 0),
    stock INT DEFAULT 0 CHECK (stock >= 0)
);

-- Tabla de métodos de pago
CREATE TABLE metodos_pago (
    metodo_pago_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla de pedidos
CREATE TABLE pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    cliente_id INT,
    metodo_pago_id INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (metodo_pago_id) REFERENCES metodos_pago(metodo_pago_id)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- Tabla de detalle de pedidos (relación N a N entre pedidos y productos)
CREATE TABLE detalle_pedidos (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT CHECK (cantidad > 0),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id)
        ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
        ON DELETE CASCADE
);
