USE Estudiante_28_202214;

DROP TABLE Movimiento;
DROP TABLE Fecha;
DROP TABLE TipoTransaccion;
DROP TABLE Cliente;
DROP TABLE Producto;
DROP TABLE Proveedor;

-- Entregable CREATE 

CREATE TABLE Fecha (
Fecha datetime, 
Dia TINYINT, 
Mes VARCHAR(20), 
Anio SMALLINT,
Numero_semana_ISO TINYINT,
PRIMARY KEY(Fecha));

CREATE TABLE Producto (
ID_Producto INT, 
Nombre VARCHAR(100),
Marca VARCHAR(30), 
Paquete_de_compra VARCHAR(20), 
Color VARCHAR(10), 
Necesita_refrigeracion BOOLEAN, 
Dias_tiempo_entrega SMALLINT, 
cantidad_por_salida INT, 
Precio_minorista_recomendado FLOAT, 
Paquete_de_venta VARCHAR(20), 
Precio_unitario FLOAT,
PRIMARY KEY(ID_Producto));

CREATE TABLE Proveedor(
ID_proveedor INT,
Nombre VARCHAR(20),
Categoria VARCHAR(20),
Contacto_principal VARCHAR(30),
Referencia VARCHAR(30),
Dias_pago INT, 
Codigo_postal INT,
PRIMARY KEY (ID_proveedor) );

CREATE TABLE TipoTransaccion(
ID_Tipo_transaccion tinyint,
Tipo VARCHAR(25),
PRIMARY KEY(ID_Tipo_transaccion)
);

CREATE TABLE Cliente (
ID_Categoria smallint,
ID_GrupoCompra smallint,
ID_Cliente smallint,
Nombre varchar(25),
ClienteFactura int,
ID_CiudadEntrega smallint,
LimiteCredito decimal,
FechaAperturaCuenta datetime,
DiasPago INT,
NombresGrupoCompra varchar(25),
NombresCategoria varchar(25),
PRIMARY KEY(ID_Cliente)
);

CREATE TABLE Movimiento (
FechaMovimiento datetime,
ID_Producto INT,
ID_Proveedor INT,
ID_Cliente smallint,
ID_TipoTransaccion tinyint,
Cantidad int,
PRIMARY KEY(FechaMovimiento, ID_Producto, ID_Proveedor, ID_Cliente, ID_TipoTransaccion),
FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_proveedor),
FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto),
FOREIGN KEY (FechaMovimiento) REFERENCES Fecha(Fecha),
FOREIGN KEY (ID_TipoTransaccion) REFERENCES TipoTransaccion(ID_Tipo_transaccion)
);

-- Entregable INSERT
INSERT INTO Fecha 
	(Fecha, Dia, Mes, Anio, Numero_semana_ISO)
    values
    ('2021-12-31 01:15:00', 31, 'Dec', 2021, 1),
    ('2021-12-30 01:15:00', 30, 'Dec', 2021, 2),
    ('2021-12-29 01:15:00', 29, 'Dec', 2021, 3),
    ('2021-12-28 01:15:00', 28, 'Dec', 2021, 4),
    ('2021-12-27 01:15:00', 27, 'Dec', 2021, 5);

INSERT INTO TipoTransaccion
	(ID_Tipo_transaccion, Tipo)
    values
    (1, 'Ingreso'),
    (2, 'Ingreso Cta Corriente'),
    (3, 'Gasto'),
    (4, 'Pago cta corriente'),
    (5, 'Pago cheque');

INSERT INTO Cliente
	(ID_Cliente, ID_Categoria, ID_GrupoCompra, Nombre, ClienteFactura, ID_CiudadEntrega, LimiteCredito, FechaAperturaCuenta, DiasPago)
    values
    (1, 1, 1, 'Andres F', 1, 1, 1000000, '2020-10-27 01:15:00', 15),
    (2, 2, 2, 'Juliana Rincon', 2, 1, 9000000, '2020-10-27 01:15:00', 19),
    (3, 3, 3, 'Mateo Cardona', 3, 1, 9999999, '2019-10-27 01:15:00', 9),
    (4, 4, 4, 'Juan David Kyu', 4, 1, 213123, '2020-10-27 01:15:00', 7),
    (5, 5, 5, 'Juliana Silva', 5, 2, 32132, '2020-10-27 01:15:00', 9);

INSERT INTO Producto
	(ID_Producto, Nombre, Marca, Paquete_de_compra, Color,Necesita_refrigeracion, Dias_tiempo_entrega, 
    cantidad_por_salida, Precio_minorista_recomendado, Paquete_de_venta,Precio_unitario)
    values
    (1, 'Finca', 'Los Nogales', 'Amarilo', 'VIP', True, 20, 15, 43434243, 'juvilando', 43434243),
    (2, 'Camioneta', 'Audi', 'paq', 'VIP Plus', True, 15, 4, 8674243, 'lux', 8674243),
    (3, 'Apartamento', 'La colina', 'Amarilo', 'Premium', True, 20, 30, 436654243, 'Sona', 436654243),
    (4, 'Casa', 'La richuela', 'Amarilo', 'HTML', True, 20, 32, 54315455, 'La dicha', 54315455),
    (5, 'Moto', '1560 TX', 'BMW', 'Trust', True, 5, 5, 143434243, 'Nautilus', 23434243);

INSERT INTO Proveedor
	(ID_proveedor, Nombre, Categoria, Contacto_principal, Referencia, Dias_pago, Codigo_postal)
    values
    (1, 'Amarilo', 'Hogar', 'Lucho', 'Marco', 3, 3455029),
    (2, 'BMW', 'Vehiculos', 'Don Francisco', 'Mr K R', 4, 105029),
    (3, 'Los Nogales', 'VIP', 'Edwin', 'Moor', 4, 748310),
    (4, 'Marver', 'motos', 'rayos', 'Juanchito', 8, 483924),
    (5, 'EU Luxury', 'Churimba', 'Carelok', 'Marycury', 5, 92743);
    
INSERT INTO Movimiento
	(FechaMovimiento, ID_Producto, ID_Proveedor, ID_Cliente, ID_TipoTransaccion, Cantidad)
    values
    ('2021-12-31 01:15:00', 1, 1, 1, 1, 8),
    ('2021-12-30 01:15:00', 2, 2, 2, 2, 3),
    ('2021-12-29 01:15:00', 3, 3, 3, 3, 90),
    ('2021-12-28 01:15:00', 4, 4, 4, 4, 23),
    ('2021-12-27 01:15:00', 5, 5, 1, 5, 4),
    ('2021-12-27 01:15:00', 5, 5, 5, 4, 9);


-- Entregable SELECT

SELECT COUNT(*) as TotalProductos FROM Movimiento
WHERE FechaMovimiento >= '2020-12-1 01:15:00'
AND FechaMovimiento < '2022-12-20 01:15:00'
AND ID_Cliente = 1

-- Entregable EJECUTAR




