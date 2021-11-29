USE TP_Final3
go


--INSERT RUBRO
INSERT INTO Rubros(Codigo,	Descripcion) VALUES('CNS'	,'Consolas')
INSERT INTO Rubros(Codigo,	Descripcion) VALUES('INS'	,'Insumos')
INSERT INTO Rubros(Codigo,	Descripcion) VALUES('PCU'	,'Computacion')
INSERT INTO Rubros(Codigo,	Descripcion) VALUES('PER'	,'Perifericos')
INSERT INTO Rubros(Codigo,	Descripcion) VALUES('TEV'	,'Televisores y Monitores')

--INSERT MARCAS
INSERT INTO Marcas(Codigo, Descripcion) VALUES('APL',	'Apple')
INSERT INTO Marcas(Codigo, Descripcion) VALUES('LG'	,'Life is Good')
INSERT INTO Marcas(Codigo, Descripcion) VALUES('PLP',	'Phillips')
INSERT INTO Marcas(Codigo, Descripcion) VALUES('SMS',	'Samsung')
INSERT INTO Marcas(Codigo, Descripcion) VALUES('SNY',	'SONY')


--INSERT MEDIOS PAGOS
INSERT INTO MediosPagos(Codigo,Descripcion) VALUES('CDT',	'Credito')
INSERT INTO MediosPagos(Codigo,Descripcion) VALUES('DBT',	'Debito')
INSERT INTO MediosPagos(Codigo,Descripcion) VALUES('EFC',	'Efectivo')
INSERT INTO MediosPagos(Codigo,Descripcion) VALUES('TFR',	'Transferencia')


--INSERT CLIENTES

Insert Into Clientes(DNI,Nombre,Apellido,Direccion,Telefono,Email) VALUES('37458905','Alan','Brado','Alsina 598', '1534031931', 'Brado@hotmail.com.ar')

Insert Into Clientes(DNI,Nombre,Apellido,Direccion,Telefono,Email) VALUES('42895136','Esteban','Quito','Av. Peron 45', '1589643587', 'EQuito@gmail.com')

Insert Into Clientes(DNI,Nombre,Apellido,Direccion,Telefono,Email) VALUES('29458632','Elsa','Balero','Junin 1478', '541147442088', 'EBalero@yahoo.com.ar')

Insert Into Clientes(DNI,Nombre,Apellido,Direccion,Telefono,Email) VALUES('25897005','Laura Luz','Amasifuen','Psj. Granaderos 58', '47457373', 'AmasifuenLL@gmail.com')

--INSERT PROVEEDORES

Insert Into Proveedores(CUIT, RazonSocial, Direccion, Telefono, Mail, Cod_Rubro, PersonaContacto) VALUES('30588117002','COGNIS S.A.','Caseros 1609', '42821517','Congnis@gmail.com','CNS','Juan Conte')
Insert Into Proveedores(CUIT, RazonSocial, Direccion, Telefono, Mail, Cod_Rubro, PersonaContacto) VALUES('30692158012','GRUPO ASAP', 'Leiva 4676','43425799','gasap@gmail.com','INS','Lucas Rodriguez')
Insert Into Proveedores(CUIT, RazonSocial, Direccion, Telefono, Mail, Cod_Rubro, PersonaContacto) VALUES('30501196424','GLENSOL S.A.', 'Av. Italia 1119','48575418','GlensolSa@gmail.com','PCU','Esteban Sandoval')
Insert Into Proveedores(CUIT, RazonSocial, Direccion, Telefono, Mail, Cod_Rubro, PersonaContacto) VALUES('30708852038','M.C. ZAMUDIO', 'Av Corrientes 753','47490778','ZamudioMC@gmail.com','PER','Paula Contrera')
Insert Into Proveedores(CUIT, RazonSocial, Direccion, Telefono, Mail, Cod_Rubro, PersonaContacto) VALUES('30715855816','SAFE PACK S.A.', 'Garcia del Rio 4062','52733404','SafePack@gmail.com','TEV','Alicia G. Falcon')

-- INSERT USUARIOS 
INSERT into Usuarios(NombreUsuario,Clave,NivelUsuario,Email) VALUES('Admin', 'Andylisco',0,'andy_fdra@hotmail.com')
INSERT into Usuarios(NombreUsuario,Clave,NivelUsuario,Email) VALUES('Vendedor1','vende1',1,'RaulCaballero@yahoo.com.ar')
INSERT into Usuarios(NombreUsuario,Clave,NivelUsuario,Email) VALUES('Vendedor2','1759Lucas',1,'LucasFury@gmail.com')

--INSERT PRODUCTOS

INSERT Productos(Codigo, Descripcion, URL_Imagen, Cod_Rubro, Cod_Marca, Stock, Stock_Minimo, PorcentajeGanancia) VALUES('T00001', 'Televisión 50', 'https://coppelar.vtexassets.com/arquivos/ids/1568379-800-auto?v=637631654615730000&width=800&height=auto&aspect=true', 'TEV','SMS',	0,	5,	250)
INSERT Productos(Codigo, Descripcion, URL_Imagen, Cod_Rubro, Cod_Marca, Stock, Stock_Minimo, PorcentajeGanancia) VALUES('C00001', 'Play Station 4', 'https://gmedia.playstation.com/is/image/SIEPDC/ps4-pro-console-02-en-26oct18?$facebook$',	'CNS',	'SNY',	0	,5,	250)
INSERT Productos(Codigo, Descripcion, URL_Imagen, Cod_Rubro, Cod_Marca, Stock, Stock_Minimo, PorcentajeGanancia) VALUES('A00001', 'Air Pods', 'https://www.mgmstore.com.ar/193-large_default/Apple-Airpods-Pro.jpg',	'PER',	'APL',	0,	10,	150)
INSERT Productos(Codigo, Descripcion, URL_Imagen, Cod_Rubro, Cod_Marca, Stock, Stock_Minimo, PorcentajeGanancia) VALUES('T00002', 'Sony Bravia', 'https://www.muycomputer.com/wp-content/uploads/2012/01/Sony-KDL-46HX750-1.jpg', 'TEV', 'SNY',0,3,200)
INSERT Productos(Codigo, Descripcion, URL_Imagen, Cod_Rubro, Cod_Marca, Stock, Stock_Minimo, PorcentajeGanancia) VALUES('P00001','Pro MAC 2019', 'https://i.blogs.es/fd3c57/artboard-copy-2/1366_2000.jpg', 'PCU','APL',0,2,250)
INSERT Productos(Codigo, Descripcion, URL_Imagen, Cod_Rubro, Cod_Marca, Stock, Stock_Minimo, PorcentajeGanancia) VALUES('P00002','Home Theater', 'https://images.philips.com/is/image/PhilipsConsumer/HTS5530_55-IMS-es_AR?$jpglarge$&wid=1250','PER','PLP',0,5,200)
INSERT Productos(Codigo, Descripcion, URL_Imagen, Cod_Rubro, Cod_Marca, Stock, Stock_Minimo, PorcentajeGanancia) VALUES('T00003','TV LCD 47"' ,'https://images.philips.com/is/image/PhilipsConsumer/47PFL7403_77-IMS-es_AR?$jpglarge$&wid=960','TEV','PLP',0,2,180)
INSERT Productos(Codigo, Descripcion, URL_Imagen, Cod_Rubro, Cod_Marca, Stock, Stock_Minimo, PorcentajeGanancia) VALUES('A00002','LG TONE','https://s1.eestatic.com/2020/08/06/omicrono/tecnologia/tecnologia-lg-imagen_y_sonido_510959795_157145241_1024x576.jpg','PER','LG',0,4,150)
