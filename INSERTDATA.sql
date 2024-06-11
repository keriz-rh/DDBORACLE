-- Insertar datos en la tabla Roles
INSERT INTO Roles (Nombre, Cargo) VALUES ('Admin', 'Administrador del sistema');
INSERT INTO Roles (Nombre, Cargo) VALUES ('Vendedor', 'Encargado de ventas');
INSERT INTO Roles (Nombre, Cargo) VALUES ('Cajero', 'Responsable de caja');
INSERT INTO Roles (Nombre, Cargo) VALUES ('Supervisor', 'Supervisor de tienda');
INSERT INTO Roles (Nombre, Cargo) VALUES ('Gerente', 'Gerente de tienda');

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (Nombre, Apellido, Telefono, Email, Puesto, Fecha_contratacion) VALUES ('Carlos', 'Mendoza', '123123123', 'carlos@correo.com', 'Gerente', TO_DATE('2020-01-01', 'YYYY-MM-DD'));
INSERT INTO Empleados (Nombre, Apellido, Telefono, Email, Puesto, Fecha_contratacion) VALUES ('Lucia', 'Fernandez', '456456456', 'lucia@correo.com', 'Vendedor', TO_DATE('2021-02-01', 'YYYY-MM-DD'));
INSERT INTO Empleados (Nombre, Apellido, Telefono, Email, Puesto, Fecha_contratacion) VALUES ('Miguel', 'Rodriguez', '789789789', 'miguel@correo.com', 'Cajero', TO_DATE('2022-03-01', 'YYYY-MM-DD'));
INSERT INTO Empleados (Nombre, Apellido, Telefono, Email, Puesto, Fecha_contratacion) VALUES ('Sofia', 'Martinez', '321321321', 'sofia@correo.com', 'Administrador', TO_DATE('2019-04-01', 'YYYY-MM-DD'));
INSERT INTO Empleados (Nombre, Apellido, Telefono, Email, Puesto, Fecha_contratacion) VALUES ('David', 'Gonzalez', '654654654', 'david@correo.com', 'Supervisor', TO_DATE('2018-05-01', 'YYYY-MM-DD'));

-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios (Nombre, Contraseña, FK_ID_Empleado, FK_ID_Rol) VALUES ('usuario1', 'pass1', 1, 1);
INSERT INTO Usuarios (Nombre, Contraseña, FK_ID_Empleado, FK_ID_Rol) VALUES ('usuario2', 'pass2', 2, 2);
INSERT INTO Usuarios (Nombre, Contraseña, FK_ID_Empleado, FK_ID_Rol) VALUES ('usuario3', 'pass3', 3, 3);
INSERT INTO Usuarios (Nombre, Contraseña, FK_ID_Empleado, FK_ID_Rol) VALUES ('usuario4', 'pass4', 4, 1);
INSERT INTO Usuarios (Nombre, Contraseña, FK_ID_Empleado, FK_ID_Rol) VALUES ('usuario5', 'pass5', 5, 2);

-- Insertar datos en la tabla Categorias
INSERT INTO Categorias (Nombre_Cat, Descripcion) VALUES ('Electrónica', 'Dispositivos electrónicos y gadgets');
INSERT INTO Categorias (Nombre_Cat, Descripcion) VALUES ('Ropa', 'Vestimenta y accesorios de moda');
INSERT INTO Categorias (Nombre_Cat, Descripcion) VALUES ('Alimentos', 'Productos alimenticios y bebidas');
INSERT INTO Categorias (Nombre_Cat, Descripcion) VALUES ('Hogar', 'Artículos para el hogar y la cocina');
INSERT INTO Categorias (Nombre_Cat, Descripcion) VALUES ('Deportes', 'Equipos y ropa deportiva');

-- Insertar datos en la tabla Proveedores
INSERT INTO Proveedores (Nombre, Telefono, Email, Dirección, Pais) VALUES ('Proveedor A', '123123123', 'proveedora@correo.com', 'Calle A, Ciudad F', 'México');
INSERT INTO Proveedores (Nombre, Telefono, Email, Dirección, Pais) VALUES ('Proveedor B', '456456456', 'proveedorb@correo.com', 'Avenida B, Ciudad G', 'Argentina');
INSERT INTO Proveedores (Nombre, Telefono, Email, Dirección, Pais) VALUES ('Proveedor C', '789789789', 'proveedorc@correo.com', 'Calle C, Ciudad H', 'Chile');
INSERT INTO Proveedores (Nombre, Telefono, Email, Dirección, Pais) VALUES ('Proveedor D', '321321321', 'proveedord@correo.com', 'Avenida D, Ciudad I', 'Perú');
INSERT INTO Proveedores (Nombre, Telefono, Email, Dirección, Pais) VALUES ('Proveedor E', '654654654', 'proveedore@correo.com', 'Calle E, Ciudad J', 'Colombia');

-- Insertar datos en la tabla Productos
INSERT INTO Productos (Nombre, Descripcion, FK_ID_Categoria) VALUES ('Televisor', 'Televisor de 50 pulgadas', 1);
INSERT INTO Productos (Nombre, Descripcion, FK_ID_Categoria) VALUES ('Camisa', 'Camisa de algodón talla M', 2);
INSERT INTO Productos (Nombre, Descripcion, FK_ID_Categoria) VALUES ('Cereal', 'Cereal de maíz 500g', 3);
INSERT INTO Productos (Nombre, Descripcion, FK_ID_Categoria) VALUES ('Sartén', 'Sartén antiadherente 24cm', 4);
INSERT INTO Productos (Nombre, Descripcion, FK_ID_Categoria) VALUES ('Pelota', 'Pelota de fútbol profesional', 5);

-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (Nombre, Apellido, Num_tel, Dirección) VALUES ('Juan', 'Perez', '123456789', 'Calle 123, Ciudad A');
INSERT INTO Clientes (Nombre, Apellido, Num_tel, Dirección) VALUES ('Maria', 'Gomez', '987654321', 'Avenida 456, Ciudad B');
INSERT INTO Clientes (Nombre, Apellido, Num_tel, Dirección) VALUES ('Pedro', 'Lopez', '456123789', 'Calle 789, Ciudad C');
INSERT INTO Clientes (Nombre, Apellido, Num_tel, Dirección) VALUES ('Ana', 'Martinez', '321654987', 'Avenida 789, Ciudad D');
INSERT INTO Clientes (Nombre, Apellido, Num_tel, Dirección) VALUES ('Luis', 'Hernandez', '654987321', 'Calle 456, Ciudad E');

-- Insertar datos en la tabla Descuentos
INSERT INTO Descuentos (FechaInicio, FechaFin, Porcentaje, Descripcion) VALUES (TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-10', 'YYYY-MM-DD
