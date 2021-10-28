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


RazonSocial, Telefono, Direccion, Mail, Cod_Rubro, PersonaContacto