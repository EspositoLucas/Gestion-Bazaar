
use GD2C2022 ;

GO

PRINT '**** Comenzando carga BI  ****';
GO

DECLARE @DropConstraints NVARCHAR(max) = ''

SELECT @DropConstraints += 'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) + '.'

                        +  QUOTENAME(OBJECT_NAME(parent_object_id)) + ' ' + 'DROP CONSTRAINT' + QUOTENAME(name)

FROM sys.foreign_keys

EXECUTE sp_executesql @DropConstraints;

PRINT '**** CONSTRAINTs dropeadas correctamente ****';

GO

DECLARE @DropTables NVARCHAR(max) = ''

SELECT @DropTables += 'DROP TABLE UBUNTEAM_THE_SQL. ' + QUOTENAME(TABLE_NAME)

FROM INFORMATION_SCHEMA.TABLES

WHERE TABLE_SCHEMA = 'UBUNTEAM_THE_SQL' and TABLE_TYPE = 'BASE TABLE'

EXECUTE sp_executesql @DropTables;

PRINT '**** TABLAS dropeadas correctamente ****';

GO


/********* Drop de Stored Procedures *********/



IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Dimension_Categorias')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Dimension_Categorias;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Dimension_MediosDeEnvio')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Dimension_MediosDeEnvio;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Dimension_Canales')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Dimension_Canales;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Dimension_MediosDePago')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Dimension_MediosDePago;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Dimension_Provincias')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Dimension_Provincias;
go


IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Dimension_Clientes')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Dimension_Clientes;
go


IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Dimension_MediosDeEnvioPorLocalidad')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Dimension_MediosDeEnvioPorLocalidad;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Hechos_Ventas')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Hechos_Ventas;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Dimension_Productos')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Dimension_Productos;
go


IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Dimension_Proveedores')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Dimension_Proveedores;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Hechos_Compras')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Hechos_Compras;
go


IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Dimension_TiposDeDescuento')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Dimension_TiposDeDescuento;
go




PRINT '**** SPs dropeados correctamente ****';

go



PRINT '**** Vistas BI dropeadas correctamente ****';

GO

/********* Drop de Vistas *********/


/********* Drop de Schema *********/


if exists (select name from sys.schemas where name = 'UBUNTEAM_THE_SQL')
	drop schema UBUNTEAM_THE_SQL;
go


/********* Creacion de Schema *********/
create schema UBUNTEAM_THE_SQL;
go


/********* Creacion de Tablas *********/


--Cliente

create table UBUNTEAM_THE_SQL.Dimension_Cliente(
	Id int identity  ,
	clie_nombre nvarchar(255) NOT NULL,
	clie_dni decimal(18,0) NOT NULL,
	Id_localidad int NOT NULL,
	clie_telefono char(100) ,
	clie_apellido nvarchar(255) ,
	clie_fecha_nac date ,
	clie_direccion nvarchar(255) ,
	clie_mail nvarchar(255),
	clie_edad int 
	

	) ;



--Provincia

create table UBUNTEAM_THE_SQL.Dimension_Provincia(
	Id int identity,
	prov_descripcion nvarchar(255),

);


--MedioEnvioPorProvincia

/*
create table UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad(
	Id int identity ,
	Id_medio_envio int  NOT NULL,
	Id_localidad int  NOT NULL,
	medio_envio_precio decimal(18,2),
	medio_envio_tiempo_estimado smalldatetime 
	 
); 

*/
-- Venta

create table UBUNTEAM_THE_SQL.Hechos_Ventas(
	Id int identity ,
	Id_cliente int NOT NULL,
	Id_canal int NOT NULL,
	Id_medio_de_pago int NOT NULL,
	Id_medio_envio int NOT NULL,
	id_tiempo int NOT NULL,
	id_producto int NOT NULL,
	id_tipo_descuento int NOT NULL,
	venta_codigo decimal(19,0) NOT NULL,
	venta_fecha date ,
	venta_total decimal(18,2) ,
	venta_envio_precio decimal(18,2),
	venta_canal_costo decimal(18,2) ,
	venta_medio_de_pago_costo decimal(18,2),
	venta_producto_precio decimal(18,2,
	venta_producto_cantidad decimal(12,2)
	 

);


-- Canal

create table UBUNTEAM_THE_SQL.Dimension_Canal(
	Id int identity,
	canal_descripcion nvarchar(2255) ,
	canal_costo decimal(18,2) ,

);

--Medio De Pago

create table UBUNTEAM_THE_SQL.Dimension_MedioDePago(
	Id int identity,
	medio_pago_descripcion nvarchar(255) ,
	medio_costo_transaccion decimal(18,2) 

);


--MedioEnvio

create table UBUNTEAM_THE_SQL.Dimension_MedioEnvio(
	Id int identity,
	medio_descripcion nvarchar(255)
	 
);



--Producto

create table UBUNTEAM_THE_SQL.Dimension_Producto(
	Id int identity,
	prod_codigo nvarchar(50) NOT NULL,
	prod_descripcion nvarchar(50) ,
	Id_categoria int NOT NULL,
	prod_marca nvarchar(255) ,
	prod_material nvarchar(50) ,
	prod_nombre nvarchar(50) 


);



--Categoria

create table UBUNTEAM_THE_SQL.Dimension_Categoria(
	Id int identity ,
	categoria_descripcion nvarchar(255) 
);




--Compra

create table UBUNTEAM_THE_SQL.Hechos_Compras(
	Id int identity ,
	Id_proveedor int NOT NULL,
	id_producto int NOT NULL,
	id_tiempo int NOT NULL,
	Id_medio_pago int NOT NULL,
	compra_numero decimal(19,0) NOT NULL,
	compra_fecha date ,
	compra_total decimal(18,2),
	compra_producto_precio decimal(18,2),
	compra_producto_cantidad decimal(18,2)

);



--Proveedor

create table UBUNTEAM_THE_SQL.Dimension_Proveedor(
	Id int identity,
	proveedor_cuit nvarchar(50) NOT NULL,
	proveedor_razon_social nvarchar(50) ,
	proveedor_domicilio nvarchar(50) ,
	id_localidad int NOT NULL,
	proveedor_mail nvarchar(50) 

);


--TipoDescuento

create table UBUNTEAM_THE_SQL.Dimension_TipoDescuento(
	Id int identity ,
	concepto_descripcion nvarchar(255) 
);


--Tiempo

create table UBUNTEAM_THE_SQL.Dimension_Tiempo(
	Id int identity ,
	anio int,
	mes int
);



print '**** Tablas creadas correctamente ****';

go



/********* Creacion de Constraints/PKs/FKs *********/




--Categoria

	alter table  UBUNTEAM_THE_SQL.Dimension_Categoria  
	add 
		constraint PK_Categoria primary key (Id);


--MedioEnvio

	alter table  UBUNTEAM_THE_SQL.Dimension_MedioEnvio  
	add 
		constraint PK_MedioEnvio primary key (Id);

--Canal 

	alter table  UBUNTEAM_THE_SQL.Dimension_Canal  
	add 
		constraint PK_Canal primary key (Id);


--MedioDePago

	alter table  UBUNTEAM_THE_SQL.Dimension_MedioDePago  
	add 
		constraint PK_MedioDePago primary key (Id);


--Provincia

	alter table  UBUNTEAM_THE_SQL.Dimension_Provincia
	add
		constraint PK_Provincia primary key ( Id);


--Cliente

	alter table  UBUNTEAM_THE_SQL.Dimension_Cliente  
	add 
		constraint PK_Cliente primary key ( Id),
	    --constraint FK_Cliente_Localidad foreign key (Id_localidad) references UBUNTEAM_THE_SQL.Dimension_Localidad(Id);

/*
--MedioEnvioPorProvincia



	alter table  UBUNTEAM_THE_SQL.MedioEnvioPorProvincia
	add 
		constraint PK_MedioEnvioPorLocalidad primary key (Id),
		constraint FK_Medio_Envio foreign key (Id_medio_envio) references UBUNTEAM_THE_SQL.MedioEnvio(Id),
		constraint FK_Medio_Envio_Localidad foreign key ( Id_localidad) references UBUNTEAM_THE_SQL.Localidad(Id);


*/

--Producto

	alter table  UBUNTEAM_THE_SQL.Dimension_Producto  
	add 
		constraint PK_Producto primary key (Id),
		constraint UC_Producto_Codigo unique (prod_codigo),
		constraint FK_Categoria foreign key ( Id_categoria) references UBUNTEAM_THE_SQL.Dimension_Categoria(Id);



--Venta

	alter table  UBUNTEAM_THE_SQL.Hechos_Venta 
	add 
		constraint PK_Venta primary key ( Id),
		constraint UC_Venta_Codigo unique (venta_codigo),
		constraint FK_Venta_Cliente foreign key ( Id_cliente) references UBUNTEAM_THE_SQL.Dimension_Cliente(Id),
		constraint FK_Venta_Canal foreign key ( Id_canal) references UBUNTEAM_THE_SQL.Dimension_Canal(Id),
		constraint FK_Venta_MedioDePago foreign key ( Id_medio_de_pago) references UBUNTEAM_THE_SQL.Dimension_MedioDePago(Id),
		constraint FK_Venta_Medio_Envio foreign key ( Id_medio_envio) references UBUNTEAM_THE_SQL.Dimension_MedioEnvio(Id),
		constraint FK_Tiempo foreign key ( Id_tiempo) references UBUNTEAM_THE_SQL.Dimension_Tiempo(id),
		constraint FK_Producto_Venta foreign key ( Id_producto) references UBUNTEAM_THE_SQL.Dimension_Producto(id),



--Proveedor

	alter table  UBUNTEAM_THE_SQL.Dimension_Proveedor  
	add 
		constraint PK_Proveedor primary key (Id),
		constraint UC_proveedor_Cuit unique (proveedor_cuit),
		constraint FK_Proveedor_Localidad foreign key (Id_localidad) references UBUNTEAM_THE_SQL.Dimension_Localidad(Id);


--Compra

	alter table  UBUNTEAM_THE_SQL.Hechos_Compra  
	add 
		constraint PK_Compra primary key (Id),
		constraint UC_Compra_Numero unique (compra_numero),
		constraint FK_Proveedor foreign key ( Id_proveedor) references UBUNTEAM_THE_SQL.Dimension_Proveedor(id),
		constraint FK_Producto_Compra foreign key ( Id_producto) references UBUNTEAM_THE_SQL.Dimension_Producto(id),
		constraint FK_Tiempo foreign key ( Id_tiempo) references UBUNTEAM_THE_SQL.Dimension_Tiempo(id),
		constraint FK_Compra_MedioDePago foreign key ( Id_medio_pago) references UBUNTEAM_THE_SQL.Dimension_MedioDePago(Id);


	
--TipooDescuento

	alter table  UBUNTEAM_THE_SQL.Dimension_TipoDescuento  
	add 
		constraint PK_Tipo_Descuento primary key (Id);



print '**** CONSTRAINTs creadas correctamente ****';

go

/********* Creacion de Vistas *********/



PRINT '**** Vistas BI creadas correctamente ****';

GO



/********* Creacion de StoredProcedures para migracion *********/


--Categoria

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Categorias
as
begin
	insert into UBUNTEAM_THE_SQL.Dimension_Categoria(categoria_descripcion)
		select categoria_descripcion
		from UBUNTEAM_THE_SQL.Categoria
		
end
go


--MedioEnvio

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_MediosDeEnvio
as
begin
	insert into UBUNTEAM_THE_SQL.Dimension_MedioEnvio(medio_descripcion)
	select medio_pago_descripcion
	from UBUNTEAM_THE_SQL.MedioDePago
end
go



-- Canal

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Canales
as
begin 
	insert into UBUNTEAM_THE_SQL.Dimension_Canal(canal_descripcion)
	select canal_descripcion
	from UBUNTEAM_THE_SQL.Canal
end
go



-- MedioDePago

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_MediosDePago
as
begin 
	insert into UBUNTEAM_THE_SQL.Dimension_MedioDePago(medio_pago_descripcion,medio_costo_transaccion)
	select medio_pago_descripcion,medio_costo_transaccion
	from UBUNTEAM_THE_SQL.Dimension_MedioDePago
end
go

--Provincia

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Provincias
as
begin 
	insert into UBUNTEAM_THE_SQL.Dimension_Provincia(prov_descripcion)

	select prov_descripcion
	from UBUNTEAM_THE_SQL.Provincia

end
go



-- Cliente

/*
create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Clientes
as
begin 

	insert into UBUNTEAM_THE_SQL.Dimension_Cliente(clie_nombre,clie_dni,Id_localidad,clie_telefono,clie_apellido,clie_fecha_nac,clie_direccion,clie_mail)

end
go

*/

--MedioEnvioPorProvincia

/*
create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_MediosEnvioPorProvincia
as
begin 

	insert into UBUNTEAM_THE_SQL.Dimension_MedioEnvioPorLocalidad(Id_medio_envio,Id_localidad)


end
go

*/

--Venta

/*
create procedure UBUNTEAM_THE_SQL.Migrar_Ventas
as
begin 

	insert into UBUNTEAM_THE_SQL.Dimension_Venta(venta_codigo,venta_fecha,Id_cliente,venta_total,Id_canal,Id_medio_de_pago,Id_medio_envio_por_localidad,venta_envio_precio, venta_canal_costo,venta_medio_de_pago_costo)

end
go

*/



--Producto

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Productos
as
begin
	insert into UBUNTEAM_THE_SQL.Dimension_Producto(prod_codigo,prod_descripcion,Id_categoria,prod_marca,prod_material,prod_nombre)
	
	select prod_codigo,prod_descripcion,UBUNTEAM_THE_SQL.Categoria.Id,prod_marca,prod_material,prod_nombre

	from UBUNTEAM_THE_SQL.Producto
	join Categoria on Id_categoria = Categoria.Id
end
go




--Proveedor

/*
create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Proveedores
as
begin
	insert into UBUNTEAM_THE_SQL.Dimension_Proveedor(proveedor_cuit, proveedor_razon_social, proveedor_domicilio,id_localidad, proveedor_mail)
		
end
go

*/
--Compra

/*
create procedure UBUNTEAM_THE_SQL.Migrar_Hechos_Compras 
 as
 begin 	insert into UBUNTEAM_THE_SQL.Dimension_Compra(compra_numero, compra_fecha, Id_proveedor, compra_total,Id_medio_pago)
		
end
go 

*/

--TipoDescuento

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_TiposDeDescuento
 as
 begin 	insert into UBUNTEAM_THE_SQL.Dimension_TipoDescuento(concepto_descripcion)
		
		select TipoDescuento.concepto_descripcion

		from UBUNTEAM_THE_SQL.TipoDescuento
end
go 



print '**** Store Procedures creados correctamente ****';

go

/********* Ejecucion de StoredProcedures para migracion *********/


--Tablas sin FKs (tienen que ir primero porque el resto de las tablas depende de estas)

	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_Categorias;
	print '**** Migracion de Dimension_Categorias Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_MediosDeEnvio;
	print '**** Migracion de Dimension_Medios de Envio Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_MediosDePago;
	print '**** Migracion de Dimension_ Medios de Pago Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_Provincias;
	print '**** Migracion de Dimension_Provincias Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_Canales ;
	print '**** Migracion de Dimension_Canales Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_TiposDeDescuento;
	print '**** Migracion de Dimension_Tipos de Descuento Exitosa****';


	--Tablas con FKs a tablas que tienen FKs (tener cuidado porque aca s  importa el orden de EXEC de los SPs)

	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_Productos ;
	print '**** Migracion de Dimension_Productos Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_MediosEnvioPorProvincia;
	print '**** Migracion de Dimension_Medios de Envio por Localidad Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_Proveedores ;
	print '**** Migracion de Dimension_Proveedores Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_Clientes;
	print '**** Migracion de Dimension_Clientes Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Hechos_Compras;
	print '**** Migracion de Hechos_Compras Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Hechos_Ventas;
	print '**** Migracion de Hechos_Ventas Exitosa****';

	--Tablas con FKs a tablas que no tienen FKs (van ahora porque ya se migraron las tablas sin FKs, que son de las que dependen estas tablas)




IF (
	EXISTS (SELECT  * FROM UBUNTEAM_THE_SQL.Dimension_Canal)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Categoria)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Cliente)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Proveedor)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Hechos_Compras)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Producto)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_MedioEnvio)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_MedioDePago)
	--and EXISTS (SELECT  * FROM UBUNTEAM_THE_SQL.Dimension_MedioEnvioPorProvincia)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Hechos_Ventas)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_TipoDescuento)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Provincia)
	
)


	PRINT 'Tablas BI migradas correctamente.';



/*

/********* TESTEO *********/

*/


