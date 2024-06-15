# DDBORACLE
Se muestra el codigo de un gestor de ventas

## Funciones

### Función: `add_cliente`

#### Descripción General:
La función `add_cliente` se encarga de añadir un nuevo cliente a la tabla `Clientes` en la base de datos. Recibe cuatro parámetros de entrada: `p_nombre`, `p_apellido`, `p_num_tel`, y `p_direccion`, que representan el nombre, apellido, número de teléfono y dirección del cliente, respectivamente. La función retorna un mensaje indicando si el cliente se añadió correctamente o si hubo un error.

### Código de la Función:

```sql
CREATE OR REPLACE FUNCTION add_cliente(
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_num_tel IN VARCHAR2,
    p_direccion IN VARCHAR2
) RETURN VARCHAR2 IS
BEGIN
    -- Inserta un nuevo cliente en la tabla Clientes.
    INSERT INTO Clientes (Nombre, Apellido, Num_tel, Dirección)
    VALUES (p_nombre, p_apellido, p_num_tel, p_direccion);
    RETURN 'Cliente añadido correctamente';
EXCEPTION
    -- Manejo de errores: captura cualquier excepción y retorna un mensaje de error.
    WHEN OTHERS THEN
        RETURN 'Error al añadir cliente: ' || SQLERRM;
END add_cliente;
/
```

### Explicación Detallada:

1. **Declaración de la Función**:
   ```sql
   CREATE OR REPLACE FUNCTION add_cliente(
       p_nombre IN VARCHAR2,
       p_apellido IN VARCHAR2,
       p_num_tel IN VARCHAR2,
       p_direccion IN VARCHAR2
   ) RETURN VARCHAR2 IS
   ```
   - `CREATE OR REPLACE FUNCTION add_cliente`: Esta línea declara la función y especifica que se debe crear o reemplazar la función existente con el mismo nombre.
   - `p_nombre IN VARCHAR2`: Parámetro de entrada para el nombre del cliente, de tipo `VARCHAR2`.
   - `p_apellido IN VARCHAR2`: Parámetro de entrada para el apellido del cliente, de tipo `VARCHAR2`.
   - `p_num_tel IN VARCHAR2`: Parámetro de entrada para el número de teléfono del cliente, de tipo `VARCHAR2`.
   - `p_direccion IN VARCHAR2`: Parámetro de entrada para la dirección del cliente, de tipo `VARCHAR2`.
   - `RETURN VARCHAR2`: Especifica que la función retorna un valor de tipo `VARCHAR2`.

2. **Inicio del Bloque PL/SQL**:
   ```sql
   BEGIN
   ```
   - Esta palabra clave indica el inicio del bloque de código PL/SQL donde se define la lógica de la función.

3. **Inserción de Datos**:
   ```sql
   INSERT INTO Clientes (Nombre, Apellido, Num_tel, Dirección)
   VALUES (p_nombre, p_apellido, p_num_tel, p_direccion);
   ```
   - `INSERT INTO Clientes (Nombre, Apellido, Num_tel, Dirección)`: Especifica que se van a insertar datos en la tabla `Clientes`. Los campos en los que se insertarán los valores son `Nombre`, `Apellido`, `Num_tel`, y `Dirección`.
   - `VALUES (p_nombre, p_apellido, p_num_tel, p_direccion)`: Proporciona los valores que se van a insertar en los campos especificados. Estos valores provienen de los parámetros de entrada de la función.

4. **Mensaje de Éxito**:
   ```sql
   RETURN 'Cliente añadido correctamente';
   ```
   - Si la inserción de datos es exitosa, esta línea retorna un mensaje indicando que el cliente se añadió correctamente.

5. **Manejo de Excepciones**:
   ```sql
   EXCEPTION
       WHEN OTHERS THEN
           RETURN 'Error al añadir cliente: ' || SQLERRM;
   ```
   - `EXCEPTION`: Esta palabra clave indica el inicio del bloque de manejo de excepciones.
   - `WHEN OTHERS THEN`: Captura cualquier excepción que no haya sido manejada específicamente. Es una forma general de captura de errores.
   - `RETURN 'Error al añadir cliente: ' || SQLERRM`: Retorna un mensaje de error que incluye el mensaje específico de la excepción capturada (`SQLERRM`).

6. **Fin del Bloque PL/SQL**:
   ```sql
   END add_cliente;
   ```
   - `END add_cliente`: Indica el final de la función `add_cliente`.

#### Resumen:
La función `add_cliente` es una manera segura y estructurada de insertar nuevos clientes en la tabla `Clientes` de la base de datos. Utiliza parámetros de entrada para recibir los datos del cliente y manejar las posibles excepciones que puedan ocurrir durante la operación de inserción, proporcionando mensajes claros tanto en caso de éxito como de error.



### Función: `actualizar_precio_producto`

#### Descripción General:
La función `actualizar_precio_producto` permite actualizar el precio unitario de un producto en los registros de detalle de pedidos. Recibe como parámetros el ID del producto (`p_id_producto`) y el nuevo precio (`p_nuevo_precio`) que se va a asignar. Retorna un valor booleano (`TRUE` si la actualización fue exitosa, `FALSE` si no).

### Código de la Función:

```sql
CREATE OR REPLACE FUNCTION actualizar_precio_producto(
    p_id_producto IN INT,
    p_nuevo_precio IN DECIMAL
) RETURN BOOLEAN IS
    v_resultado BOOLEAN := FALSE;
BEGIN
    -- Actualiza el precio del producto en el detalle de pedidos.
    UPDATE Detalle_Pedido
    SET Precio_Unit = p_nuevo_precio
    WHERE ID_Producto = p_id_producto;

    -- Verifica si se realizó la actualización correctamente.
    IF SQL%ROWCOUNT > 0 THEN
        v_resultado := TRUE;
    END IF;

    RETURN v_resultado;
EXCEPTION
    -- Manejo de errores: captura cualquier excepción y retorna FALSE.
    WHEN OTHERS THEN
        RETURN FALSE;
END actualizar_precio_producto;
/
```

### Explicación Detallada:

1. **Declaración de la Función**:
   ```sql
   CREATE OR REPLACE FUNCTION actualizar_precio_producto(
       p_id_producto IN INT,
       p_nuevo_precio IN DECIMAL
   ) RETURN BOOLEAN IS
   ```
   - `CREATE OR REPLACE FUNCTION actualizar_precio_producto`: Define la función `actualizar_precio_producto` o la reemplaza si ya existe.
   - `p_id_producto IN INT`: Parámetro de entrada que especifica el ID del producto que se desea actualizar.
   - `p_nuevo_precio IN DECIMAL`: Parámetro de entrada que indica el nuevo precio que se asignará al producto, de tipo `DECIMAL`.

2. **Variable Local**:
   ```sql
   v_resultado BOOLEAN := FALSE;
   ```
   - `v_resultado BOOLEAN := FALSE;`: Declara una variable local `v_resultado` de tipo `BOOLEAN` e inicializa su valor como `FALSE`. Esta variable se usará para indicar si la actualización del precio fue exitosa (`TRUE`) o no (`FALSE`).

3. **Inicio del Bloque PL/SQL**:
   ```sql
   BEGIN
   ```
   - Inicio del bloque de código PL/SQL donde se define la lógica de la función.

4. **Sentencia UPDATE**:
   ```sql
   UPDATE Detalle_Pedido
   SET Precio_Unit = p_nuevo_precio
   WHERE ID_Producto = p_id_producto;
   ```
   - `UPDATE Detalle_Pedido`: Realiza una actualización en la tabla `Detalle_Pedido`.
   - `SET Precio_Unit = p_nuevo_precio`: Actualiza el campo `Precio_Unit` con el valor especificado en `p_nuevo_precio`.
   - `WHERE ID_Producto = p_id_producto;`: Filtra los registros para actualizar solo aquellos donde el `ID_Producto` coincida con `p_id_producto`.

5. **Verificación de la Actualización**:
   ```sql
   IF SQL%ROWCOUNT > 0 THEN
       v_resultado := TRUE;
   END IF;
   ```
   - `IF SQL%ROWCOUNT > 0 THEN`: Verifica si al menos una fila fue afectada por la operación de actualización.
   - `v_resultado := TRUE;`: Si se actualizaron filas, establece `v_resultado` en `TRUE`.

6. **Retorno del Resultado**:
   ```sql
   RETURN v_resultado;
   ```
   - `RETURN v_resultado;`: Retorna `TRUE` si la actualización del precio del producto fue exitosa, de lo contrario, retorna `FALSE`.

7. **Manejo de Excepciones**:
   ```sql
   EXCEPTION
       WHEN OTHERS THEN
           RETURN FALSE;
   ```
   - `EXCEPTION`: Maneja cualquier excepción que pueda ocurrir durante la ejecución de la función.
   - `WHEN OTHERS THEN`: Captura cualquier tipo de excepción no manejada específicamente.
   - `RETURN FALSE;`: Retorna `FALSE` si ocurre alguna excepción durante la actualización del precio.

8. **Fin del Bloque PL/SQL**:
   ```sql
   END actualizar_precio_producto;
   ```
   - `END actualizar_precio_producto;`: Finaliza la definición de la función `actualizar_precio_producto`.

### Resumen:
La función `actualizar_precio_producto` permite modificar el precio unitario de un producto en la tabla `Detalle_Pedido` basado en su ID. Utiliza un parámetro para especificar el nuevo precio y retorna un valor booleano que indica si la operación fue exitosa (`TRUE`) o no (`FALSE`). La función maneja posibles excepciones durante la ejecución y proporciona un mecanismo para manejar errores de manera controlada.

### Función: `calcular_total_pedido`

#### Descripción General:
La función `calcular_total_pedido` se encarga de calcular el total de un pedido específico en base a sus detalles (productos, cantidades y precios unitarios). Recibe como parámetro el ID del pedido (`p_id_pedido`) y retorna el total calculado. La función suma el producto de la cantidad y el precio unitario de cada producto en el pedido para obtener el total del pedido.

### Código de la Función:

```sql
CREATE OR REPLACE FUNCTION calcular_total_pedido(
    p_id_pedido IN INT
) RETURN DECIMAL IS
    v_total DECIMAL(10, 2);
BEGIN
    -- Calcula el total sumando el producto de cantidad y precio unitario de cada detalle del pedido.
    SELECT SUM(Cantidad * Precio_Unit)
    INTO v_total
    FROM Detalle_Pedido
    WHERE ID_Pedido = p_id_pedido;

    -- Retorna el total calculado.
    RETURN v_total;
EXCEPTION
    -- Manejo de errores: captura cualquier excepción y retorna 0.
    WHEN OTHERS THEN
        RETURN 0;
END calcular_total_pedido;
/
```

### Explicación Detallada:

1. **Declaración de la Función**:
   ```sql
   CREATE OR REPLACE FUNCTION calcular_total_pedido(
       p_id_pedido IN INT
   ) RETURN DECIMAL IS
   ```
   - `CREATE OR REPLACE FUNCTION calcular_total_pedido`: Esta línea declara la función y especifica que se debe crear o reemplazar la función existente con el mismo nombre.
   - `p_id_pedido IN INT`: Parámetro de entrada que representa el ID del pedido, de tipo `INT`.
   - `RETURN DECIMAL`: Especifica que la función retorna un valor de tipo `DECIMAL`.

2. **Declaración de Variables**:
   ```sql
   v_total DECIMAL(10, 2);
   ```
   - `v_total DECIMAL(10, 2)`: Declara una variable local `v_total` de tipo `DECIMAL(10, 2)` para almacenar el total calculado del pedido.

3. **Inicio del Bloque PL/SQL**:
   ```sql
   BEGIN
   ```
   - Esta palabra clave indica el inicio del bloque de código PL/SQL donde se define la lógica de la función.

4. **Cálculo del Total del Pedido**:
   ```sql
   SELECT SUM(Cantidad * Precio_Unit)
   INTO v_total
   FROM Detalle_Pedido
   WHERE ID_Pedido = p_id_pedido;
   ```
   - `SELECT SUM(Cantidad * Precio_Unit)`: Realiza una suma del producto de la cantidad y el precio unitario de cada detalle del pedido.
   - `INTO v_total`: Almacena el resultado de la suma en la variable `v_total`.
   - `FROM Detalle_Pedido`: Especifica la tabla `Detalle_Pedido` de donde se obtienen los datos.
   - `WHERE ID_Pedido = p_id_pedido`: Filtra los detalles del pedido para incluir solo aquellos cuyo `ID_Pedido` coincide con el valor del parámetro `p_id_pedido`.

5. **Retorno del Total Calculado**:
   ```sql
   RETURN v_total;
   ```
   - Si la consulta y el cálculo son exitosos, esta línea retorna el valor de `v_total`, que es el total calculado del pedido.

6. **Manejo de Excepciones**:
   ```sql
   EXCEPTION
       WHEN OTHERS THEN
           RETURN 0;
   ```
   - `EXCEPTION`: Esta palabra clave indica el inicio del bloque de manejo de excepciones.
   - `WHEN OTHERS THEN`: Captura cualquier excepción que no haya sido manejada específicamente. Es una forma general de captura de errores.
   - `RETURN 0`: Retorna 0 en caso de que ocurra alguna excepción durante la ejecución de la función.

7. **Fin del Bloque PL/SQL**:
   ```sql
   END calcular_total_pedido;
   ```
   - `END calcular_total_pedido`: Indica el final de la función `calcular_total_pedido`.

#### Resumen:
La función `calcular_total_pedido` permite calcular el total de un pedido específico sumando el producto de la cantidad y el precio unitario de cada producto en los detalles del pedido. La función maneja posibles excepciones y retorna 0 en caso de error, asegurando así que el sistema pueda manejar situaciones inesperadas sin interrumpir su funcionamiento.
### Función: `obtener_informacion_cliente`
### Función: `obtener_historial_precios`

#### Funicion: 'obtener_historial_precios:'
La función `obtener_historial_precios` se encarga de obtener el historial de precios de un producto específico a partir de su ID. Recibe como parámetro el ID del producto (`p_id_producto`) y retorna un cursor que contiene todos los registros de la tabla `Historial_Precios` asociados a ese producto.

### Código de la Función:

```sql
CREATE OR REPLACE FUNCTION obtener_historial_precios(
    p_id_producto IN INT
) RETURN SYS_REFCURSOR IS
    v_historial SYS_REFCURSOR;
BEGIN
    -- Abre el cursor y selecciona el historial de precios del producto con el ID especificado.
    OPEN v_historial FOR
    SELECT ID_Historial, Precio_anterior, Precio_nuevo, Fecha_Cambio
    FROM Historial_Precios
    WHERE ID_Producto = p_id_producto
    ORDER BY Fecha_Cambio DESC;

    -- Retorna el cursor con el historial de precios.
    RETURN v_historial;
EXCEPTION
    -- Manejo de errores: captura cualquier excepción y cierra el cursor.
    WHEN OTHERS THEN
        IF v_historial%ISOPEN THEN
            CLOSE v_historial;
        END IF;
        RETURN NULL;
END obtener_historial_precios;
/
```

### Explicación Detallada:

1. **Declaración de la Función**:
   ```sql
   CREATE OR REPLACE FUNCTION obtener_historial_precios(
       p_id_producto IN INT
   ) RETURN SYS_REFCURSOR IS
   ```
   - `CREATE OR REPLACE FUNCTION obtener_historial_precios`: Esta línea declara la función y especifica que se debe crear o reemplazar la función existente con el mismo nombre.
   - `p_id_producto IN INT`: Parámetro de entrada que representa el ID del producto, de tipo `INT`.
   - `RETURN SYS_REFCURSOR IS`: Especifica que la función retorna un valor de tipo `SYS_REFCURSOR`, que es un cursor de referencia que permite devolver múltiples filas.

2. **Declaración de Variables**:
   ```sql
   v_historial SYS_REFCURSOR;
   ```
   - `v_historial SYS_REFCURSOR`: Declara una variable local `v_historial` de tipo `SYS_REFCURSOR` para almacenar el cursor que contendrá el historial de precios del producto.

3. **Inicio del Bloque PL/SQL**:
   ```sql
   BEGIN
   ```
   - Esta palabra clave indica el inicio del bloque de código PL/SQL donde se define la lógica de la función.

4. **Apertura del Cursor y Selección del Historial de Precios**:
   ```sql
   OPEN v_historial FOR
   SELECT ID_Historial, Precio_anterior, Precio_nuevo, Fecha_Cambio
   FROM Historial_Precios
   WHERE ID_Producto = p_id_producto
   ORDER BY Fecha_Cambio DESC;
   ```
   - `OPEN v_historial FOR`: Abre el cursor `v_historial` para la consulta especificada.
   - `SELECT ID_Historial, Precio_anterior, Precio_nuevo, Fecha_Cambio`: Selecciona los campos `ID_Historial`, `Precio_anterior`, `Precio_nuevo`, y `Fecha_Cambio` de la tabla `Historial_Precios`.
   - `FROM Historial_Precios`: Especifica la tabla `Historial_Precios` de donde se obtienen los datos.
   - `WHERE ID_Producto = p_id_producto`: Filtra los registros para incluir solo aquellos cuyo `ID_Producto` coincide con el valor del parámetro `p_id_producto`.
   - `ORDER BY Fecha_Cambio DESC`: Ordena los registros por la fecha de cambio de precio en orden descendente, mostrando primero los cambios más recientes.

5. **Retorno del Cursor con el Historial de Precios**:
   ```sql
   RETURN v_historial;
   ```
   - Si la consulta y la apertura del cursor son exitosas, esta línea retorna el cursor `v_historial`, que contiene el historial de precios del producto.

6. **Manejo de Excepciones**:
   ```sql
   EXCEPTION
       WHEN OTHERS THEN
           IF v_historial%ISOPEN THEN
               CLOSE v_historial;
           END IF;
           RETURN NULL;
   ```
   - `EXCEPTION`: Esta palabra clave indica el inicio del bloque de manejo de excepciones.
   - `WHEN OTHERS THEN`: Captura cualquier excepción que no haya sido manejada específicamente. Es una forma general de captura de errores.
   - `IF v_historial%ISOPEN THEN`: Verifica si el cursor `v_historial` está abierto.
   - `CLOSE v_historial`: Cierra el cursor `v_historial` si está abierto para liberar recursos.
   - `RETURN NULL`: Retorna `NULL` en caso de que ocurra alguna excepción durante la ejecución de la función.

7. **Fin del Bloque PL/SQL**:
   ```sql
   END obtener_historial_precios;
   ```
   - `END obtener_historial_precios`: Indica el final de la función `obtener_historial_precios`.

### Resumen:
La función `obtener_historial_precios` permite obtener el historial de precios de un producto específico en base a su ID, retornando un cursor que contiene los registros del historial de precios asociados a ese producto. La función maneja posibles excepciones, cerrando el cursor y retornando `NULL` en caso de error, asegurando así que el sistema pueda manejar situaciones inesperadas sin interrupciones.

### Función: `obtener_productos_por_categoria`

#### Descripción General:
La función `obtener_productos_por_categoria` se encarga de obtener y devolver los productos pertenecientes a una categoría específica. Recibe como parámetro el ID de la categoría (`p_id_categoria`) y retorna un cursor que contiene todos los registros de la tabla `Productos` asociados a esa categoría.

### Código de la Función:

```sql
CREATE OR REPLACE FUNCTION obtener_productos_por_categoria(
    p_id_categoria IN INT
) RETURN SYS_REFCURSOR IS
    v_productos SYS_REFCURSOR;
BEGIN
    -- Abre el cursor y selecciona los productos de la categoría con el ID especificado.
    OPEN v_productos FOR
    SELECT ID_Producto, Nombre, Descripcion
    FROM Productos
    WHERE ID_Categoria = p_id_categoria
    ORDER BY Nombre;

    -- Retorna el cursor con los productos de la categoría.
    RETURN v_productos;
EXCEPTION
    -- Manejo de errores: captura cualquier excepción y cierra el cursor.
    WHEN OTHERS THEN
        IF v_productos%ISOPEN THEN
            CLOSE v_productos;
        END IF;
        RETURN NULL;
END obtener_productos_por_categoria;
/
```

### Explicación Detallada:

1. **Declaración de la Función**:
   ```sql
   CREATE OR REPLACE FUNCTION obtener_productos_por_categoria(
       p_id_categoria IN INT
   ) RETURN SYS_REFCURSOR IS
   ```
   - `CREATE OR REPLACE FUNCTION obtener_productos_por_categoria`: Esta línea declara la función y especifica que se debe crear o reemplazar la función existente con el mismo nombre.
   - `p_id_categoria IN INT`: Parámetro de entrada que representa el ID de la categoría, de tipo `INT`.
   - `RETURN SYS_REFCURSOR IS`: Especifica que la función retorna un valor de tipo `SYS_REFCURSOR`, que es un cursor de referencia que permite devolver múltiples filas.

2. **Declaración de Variables**:
   ```sql
   v_productos SYS_REFCURSOR;
   ```
   - `v_productos SYS_REFCURSOR`: Declara una variable local `v_productos` de tipo `SYS_REFCURSOR` para almacenar el cursor que contendrá los productos de la categoría.

3. **Inicio del Bloque PL/SQL**:
   ```sql
   BEGIN
   ```
   - Esta palabra clave indica el inicio del bloque de código PL/SQL donde se define la lógica de la función.

4. **Apertura del Cursor y Selección de los Productos de la Categoría**:
   ```sql
   OPEN v_productos FOR
   SELECT ID_Producto, Nombre, Descripcion
   FROM Productos
   WHERE ID_Categoria = p_id_categoria
   ORDER BY Nombre;
   ```
   - `OPEN v_productos FOR`: Abre el cursor `v_productos` para la consulta especificada.
   - `SELECT ID_Producto, Nombre, Descripcion`: Selecciona los campos `ID_Producto`, `Nombre`, y `Descripcion` de la tabla `Productos`.
   - `FROM Productos`: Especifica la tabla `Productos` de donde se obtienen los datos.
   - `WHERE ID_Categoria = p_id_categoria`: Filtra los registros para incluir solo aquellos cuyo `ID_Categoria` coincide con el valor del parámetro `p_id_categoria`.
   - `ORDER BY Nombre`: Ordena los registros por el campo `Nombre` en orden ascendente, para una mejor legibilidad.

5. **Retorno del Cursor con los Productos de la Categoría**:
   ```sql
   RETURN v_productos;
   ```
   - Si la consulta y la apertura del cursor son exitosas, esta línea retorna el cursor `v_productos`, que contiene los productos de la categoría especificada.

6. **Manejo de Excepciones**:
   ```sql
   EXCEPTION
       WHEN OTHERS THEN
           IF v_productos%ISOPEN THEN
               CLOSE v_productos;
           END IF;
           RETURN NULL;
   ```
   - `EXCEPTION`: Esta palabra clave indica el inicio del bloque de manejo de excepciones.
   - `WHEN OTHERS THEN`: Captura cualquier excepción que no haya sido manejada específicamente. Es una forma general de captura de errores.
   - `IF v_productos%ISOPEN THEN`: Verifica si el cursor `v_productos` está abierto.
   - `CLOSE v_productos`: Cierra el cursor `v_productos` si está abierto para liberar recursos.
   - `RETURN NULL`: Retorna `NULL` en caso de que ocurra alguna excepción durante la ejecución de la función.

7. **Fin del Bloque PL/SQL**:
   ```sql
   END obtener_productos_por_categoria;
   ```
   - `END obtener_productos_por_categoria`: Indica el final de la función `obtener_productos_por_categoria`.

### Resumen:
La función `obtener_productos_por_categoria` permite obtener los productos de una categoría específica en base a su ID, retornando un cursor que contiene los registros de los productos asociados a esa categoría. La función maneja posibles excepciones, cerrando el cursor y retornando `NULL` en caso de error, asegurando así que el sistema pueda manejar situaciones inesperadas sin interrupciones.

### Función: `obtener_detalles_pago`

#### Descripción General:
La función `obtener_detalles_pago` se encarga de obtener y devolver los detalles de pago de un pedido específico. Recibe como parámetro el ID del pedido (`p_id_pedido`) y retorna un cursor que contiene todos los registros de la tabla `Pago` asociados a ese pedido.

### Código de la Función:

```sql
CREATE OR REPLACE FUNCTION obtener_detalles_pago(
    p_id_pedido IN INT
) RETURN SYS_REFCURSOR IS
    v_detalles_pago SYS_REFCURSOR;
BEGIN
    -- Abre el cursor y selecciona los detalles de pago del pedido con el ID especificado.
    OPEN v_detalles_pago FOR
    SELECT ID_Pago, Fecha, Total, Estado
    FROM Pago
    WHERE ID_Pedido = p_id_pedido
    ORDER BY Fecha;

    -- Retorna el cursor con los detalles de pago del pedido.
    RETURN v_detalles_pago;
EXCEPTION
    -- Manejo de errores: captura cualquier excepción y cierra el cursor.
    WHEN OTHERS THEN
        IF v_detalles_pago%ISOPEN THEN
            CLOSE v_detalles_pago;
        END IF;
        RETURN NULL;
END obtener_detalles_pago;
/
```

### Explicación Detallada:

1. **Declaración de la Función**:
   ```sql
   CREATE OR REPLACE FUNCTION obtener_detalles_pago(
       p_id_pedido IN INT
   ) RETURN SYS_REFCURSOR IS
   ```
   - `CREATE OR REPLACE FUNCTION obtener_detalles_pago`: Esta línea declara la función y especifica que se debe crear o reemplazar la función existente con el mismo nombre.
   - `p_id_pedido IN INT`: Parámetro de entrada que representa el ID del pedido, de tipo `INT`.
   - `RETURN SYS_REFCURSOR IS`: Especifica que la función retorna un valor de tipo `SYS_REFCURSOR`, que es un cursor de referencia que permite devolver múltiples filas.

2. **Declaración de Variables**:
   ```sql
   v_detalles_pago SYS_REFCURSOR;
   ```
   - `v_detalles_pago SYS_REFCURSOR`: Declara una variable local `v_detalles_pago` de tipo `SYS_REFCURSOR` para almacenar el cursor que contendrá los detalles de pago del pedido.

3. **Inicio del Bloque PL/SQL**:
   ```sql
   BEGIN
   ```
   - Esta palabra clave indica el inicio del bloque de código PL/SQL donde se define la lógica de la función.

4. **Apertura del Cursor y Selección de los Detalles de Pago del Pedido**:
   ```sql
   OPEN v_detalles_pago FOR
   SELECT ID_Pago, Fecha, Total, Estado
   FROM Pago
   WHERE ID_Pedido = p_id_pedido
   ORDER BY Fecha;
   ```
   - `OPEN v_detalles_pago FOR`: Abre el cursor `v_detalles_pago` para la consulta especificada.
   - `SELECT ID_Pago, Fecha, Total, Estado`: Selecciona los campos `ID_Pago`, `Fecha`, `Total`, y `Estado` de la tabla `Pago`.
   - `FROM Pago`: Especifica la tabla `Pago` de donde se obtienen los datos.
   - `WHERE ID_Pedido = p_id_pedido`: Filtra los registros para incluir solo aquellos cuyo `ID_Pedido` coincide con el valor del parámetro `p_id_pedido`.
   - `ORDER BY Fecha`: Ordena los registros por el campo `Fecha` en orden ascendente, para una mejor legibilidad.

5. **Retorno del Cursor con los Detalles de Pago del Pedido**:
   ```sql
   RETURN v_detalles_pago;
   ```
   - Si la consulta y la apertura del cursor son exitosas, esta línea retorna el cursor `v_detalles_pago`, que contiene los detalles de pago del pedido especificado.

6. **Manejo de Excepciones**:
   ```sql
   EXCEPTION
       WHEN OTHERS THEN
           IF v_detalles_pago%ISOPEN THEN
               CLOSE v_detalles_pago;
           END IF;
           RETURN NULL;
   ```
   - `EXCEPTION`: Esta palabra clave indica el inicio del bloque de manejo de excepciones.
   - `WHEN OTHERS THEN`: Captura cualquier excepción que no haya sido manejada específicamente. Es una forma general de captura de errores.
   - `IF v_detalles_pago%ISOPEN THEN`: Verifica si el cursor `v_detalles_pago` está abierto.
   - `CLOSE v_detalles_pago`: Cierra el cursor `v_detalles_pago` si está abierto para liberar recursos.
   - `RETURN NULL`: Retorna `NULL` en caso de que ocurra alguna excepción durante la ejecución de la función.

7. **Fin del Bloque PL/SQL**:
   ```sql
   END obtener_detalles_pago;
   ```
   - `END obtener_detalles_pago`: Indica el final de la función `obtener_detalles_pago`.

### Resumen:
La función `obtener_detalles_pago` permite obtener los detalles de pago de un pedido específico en base a su ID, retornando un cursor que contiene los registros de los pagos asociados a ese pedido. La función maneja posibles excepciones, cerrando el cursor y retornando `NULL` en caso de error, asegurando así que el sistema pueda manejar situaciones inesperadas sin interrupciones.
