
CREATE TABLE Roles (
    ID_Rol INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Cargo VARCHAR2(50)
);

-- Crear tabla Empleados
CREATE TABLE Empleados (
    ID_Empleado INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Apellido VARCHAR2(50) NOT NULL,
    Telefono VARCHAR2(20),
    Email VARCHAR2(50),
    Puesto VARCHAR2(50),
    Fecha_contratacion DATE NOT NULL
);

-- Crear tabla Usuarios
CREATE TABLE Usuarios (
    ID_Usuario INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Contraseña VARCHAR2(50) NOT NULL,
    FK_ID_Empleado INT,
    FK_ID_Rol INT,
    CONSTRAINT FK_Empleado FOREIGN KEY (FK_ID_Empleado) REFERENCES Empleados(ID_Empleado),
    CONSTRAINT FK_Rol FOREIGN KEY (FK_ID_Rol) REFERENCES Roles(ID_Rol)
);

-- Crear tabla Categorias
CREATE TABLE Categorias (
    ID_Categoria INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre_Cat VARCHAR2(50) NOT NULL,
    Descripcion VARCHAR2(200)
);

-- Crear tabla Proveedores
CREATE TABLE Proveedores (
    ID_Proveedor INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Telefono VARCHAR2(20),
    Email VARCHAR2(50),
    Dirección VARCHAR2(100),
    Pais VARCHAR2(50)
);

-- Crear tabla Clientes
CREATE TABLE Clientes (
    ID_Cliente INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Apellido VARCHAR2(50) NOT NULL,
    Num_tel VARCHAR2(20),
    Dirección VARCHAR2(100)
);

-- Crear tabla Productos
CREATE TABLE Productos (
    ID_Producto INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Descripcion VARCHAR2(200),
    FK_ID_Categoria INT,
    CONSTRAINT FK_Categoria FOREIGN KEY (FK_ID_Categoria) REFERENCES Categorias(ID_Categoria)
);

-- Crear tabla Sucursales
CREATE TABLE Sucursales (
    ID_Sucursal INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Pais VARCHAR2(50),
    Ciudad VARCHAR2(50),
    Dirección VARCHAR2(100),
    Nombre VARCHAR2(50)
);

-- Crear tabla Pedidos
CREATE TABLE Pedidos (
    ID_Pedido INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    FK_ID_Cliente INT,
    Fecha DATE NOT NULL,
    Total DECIMAL(10, 2),
    CONSTRAINT FK_Cliente FOREIGN KEY (FK_ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

-- Crear tabla Detalle_Pedido
CREATE TABLE Detalle_Pedido (
    ID_Detalle INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    FK_ID_Pedido INT,
    FK_ID_Producto INT,
    Cantidad INT NOT NULL,
    CONSTRAINT FK_Pedido FOREIGN KEY (FK_ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    CONSTRAINT FK_Producto FOREIGN KEY (FK_ID_Producto) REFERENCES Productos(ID_Producto)
);

-- Crear tabla Pago
CREATE TABLE Pago (
    ID_Pago INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    FK_ID_Pedido INT,
    Fecha DATE NOT NULL,
    Total DECIMAL(10, 2),
    Estado VARCHAR2(20),
    CONSTRAINT FK_Pedido_Pago FOREIGN KEY (FK_ID_Pedido) REFERENCES Pedidos(ID_Pedido)
);

-- Crear tabla Descuentos
CREATE TABLE Descuentos (
    ID_Descuento INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    Porcentaje DECIMAL(5, 2),
    Descripcion VARCHAR2(200)
);

-- Crear tabla Historial_Precios
CREATE TABLE Historial_Precios (
    ID_Historial INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    FK_ID_Producto INT,
    Precio_anterior DECIMAL(10, 2),
    Precio_nuevo DECIMAL(10, 2),
    Fecha_Cambio DATE NOT NULL,
    CONSTRAINT FK_Producto_Historial FOREIGN KEY (FK_ID_Producto) REFERENCES Productos(ID_Producto)
);

-- Crear tabla Inventario
CREATE TABLE Inventario (
    ID_Inventario INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Cantidad INT NOT NULL,
    Fecha DATE NOT NULL,
    TipoMovimiento VARCHAR2(20),
    FK_ID_Producto INT,
    CONSTRAINT FK_Producto_Inventario FOREIGN KEY (FK_ID_Producto) REFERENCES Productos(ID_Producto)
);

-- Crear tabla Descuentos_Productos
CREATE TABLE Descuentos_Productos (
    ID_Producto INT,
    ID_Descuento INT,
    CONSTRAINT PK_Descuentos_Productos PRIMARY KEY (ID_Producto, ID_Descuento),
    CONSTRAINT FK_Producto_Descuento FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto),
    CONSTRAINT FK_Descuento_Producto FOREIGN KEY (ID_Descuento) REFERENCES Descuentos(ID_Descuento)
);

