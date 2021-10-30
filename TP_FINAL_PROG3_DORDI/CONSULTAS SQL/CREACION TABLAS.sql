create table Proveedores(
CUIT varchar(11) primary key,
RazonSocial varchar(100) not null,
Telefono varchar(20) null,
Direccion varchar(100) null,
Mail varchar(100) null,
Cod_Rubro int  not null,
PersonaContacto varchar(100) null
)

create table Rubros(
Codigo varchar(3) primary key,
Descripcion varchar(100) not null,
)

Create Table Usuarios(
NombreUsuario nvarchar(50) primary key,
Clave nvarchar(20) not null,
NivelUsuario int not null,
Estado bit not null default(1),
)

