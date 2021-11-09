create table Proveedores(
CUIT varchar(11) primary key,
RazonSocial varchar(50) not null,
Telefono varchar(20) null,
Direccion varchar(50) null,
Mail varchar(50) null,
Cod_Rubro int  not null,
PersonaContacto varchar(50) null,
Estado bit not null
)

create table Rubros(
Codigo varchar(3) primary key,
Descripcion varchar(50) not null,
)

Create Table Usuarios(
NombreUsuario nvarchar(50) primary key,
Clave nvarchar(20) not null,
NivelUsuario int not null,
Email nvarchar(20) not null,
Estado bit not null default(1),
)


Create Table Clientes(
DNI varchar(8) primary key,
Nombre nvarchar(50) not null,
Apellido nvarchar(50) not null,
Email nvarchar(50) null,
Telefono nvarchar(20) null,
Direccion varchar(50) null,
FechaUltCompra date not null default(getdate()),
Estado bit not null default(1),
)

create table Marcas(
Codigo varchar(3) primary key,
Descripcion varchar(50) not null,
)


create table MediosPagos(
Codigo varchar(3) primary key,
Descripcion varchar(50) not null,
)

create table Productos(
ID bigint primary key identity(1,1),
Codigo varchar(6) not null,
Descripcion varchar(50) not null,
URL_Imagen varchar(50) null,
Cod_Rubro varchar(3) foreign key references Rubros(Codigo),
Cod_Marca varchar(3) foreign key references Marcas(Codigo),
Stock int not null default(0) check(Stock >= 0),
Stock_Minimo int not null check(Stock_Minimo > 0),
PorcentajeGanancia int not null check(PorcentajeGanancia > 0),
PrecioU_Compra decimal(10,2) null check(PrecioU_Compra > 0),
Estado bit not null default(1)
)

Create table Compras(
Nro_Factura int primary key identity(1,1),
Renglon int not null,
CUIT_Prov varchar(11) foreign key references Proveedores(Cuit),
Fecha date not null,
Tipo_Factura char(1) not null,
ID_Producto bigint not null Foreign key references Productos(ID),
ID_MedioPago varchar(3) not null Foreign key references MediosPagos(Codigo),
NombreUsuario nvarchar(50) not null Foreign key references Usuarios(NombreUsuario),
PrecioU decimal(10,2) not null check(PrecioU > 0),
Cantidad int not null check(Cantidad > 0),
Estado bit not null default(1)
) 



