
use GD2C2022 ;

GO

PRINT '**** Comenzando Migracion  ****';
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



IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Categorias')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Categorias;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_MediosDeEnvio')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_MediosDeEnvio;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Canales')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Canales;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_MediosDePago')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_MediosDePago;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Provincias')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Provincias;
go


IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Clientes')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Clientes;
go


IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_MediosDeEnvioPorLocalidad')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_MediosDeEnvioPorLocalidad;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Ventas')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Ventas;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Productos')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Productos;
go


IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Proveedores')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Proveedores;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Compras')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Compras;
go


IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_TiposDeDescuento')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_TiposDeDescuento;
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

create table UBUNTEAM_THE_SQL.Cliente(
	Id int identity  ,
	clie_nombre nvarchar(255) NOT NULL,
	clie_dni decimal(18,0) NOT NULL,
	Id_localidad int NOT NULL,
	clie_telefono char(100) ,
	clie_apellido nvarchar(255) ,
	clie_fecha_nac date ,
	clie_direccion nvarchar(255) ,
	clie_mail nvarchar(255) 
	

	) ;



--Provincia

create table UBUNTEAM_THE_SQL.Provincia(
	Id int identity,
	prov_descripcion nvarchar(255),

);


--MedioEnvioPorProvincia


create table UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad(
	Id int identity ,
	Id_medio_envio int  NOT NULL,
	Id_localidad int  NOT NULL,
	medio_envio_precio decimal(18,2),
	medio_envio_tiempo_estimado smalldatetime 
	 
); 

-- Venta

create table UBUNTEAM_THE_SQL.Venta(
	Id int identity ,	
	venta_codigo decimal(19,0) NOT NULL,
	venta_fecha date ,
	Id_cliente int NOT NULL,
	venta_total decimal(18,2) ,
	Id_canal int NOT NULL,
	Id_medio_de_pago int NOT NULL,
	Id_medio_envio_por_localidad int NOT NULL,
	venta_envio_precio decimal(18,2),
	venta_canal_costo decimal(18,2) ,
	venta_medio_de_pago_costo decimal(18,2) 

);


-- Canal

create table UBUNTEAM_THE_SQL.Canal(
	Id int identity,
	canal_descripcion nvarchar(2255) ,
	canal_costo decimal(18,2) ,

);

--Medio De Pago

create table UBUNTEAM_THE_SQL.MedioDePago(
	Id int identity,
	medio_pago_descripcion nvarchar(255) ,
	medio_costo_transaccion decimal(18,2) 

);


--MedioEnvio

create table UBUNTEAM_THE_SQL.MedioEnvio(
	Id int identity,
	medio_descripcion nvarchar(255)
	 
);



--Producto

create table UBUNTEAM_THE_SQL.Producto(
	Id int identity,
	prod_codigo nvarchar(50) NOT NULL,
	prod_descripcion nvarchar(50) ,
	Id_categoria int NOT NULL,
	prod_marca nvarchar(255) ,
	prod_material nvarchar(50) ,
	prod_nombre nvarchar(50) 


);



--Categoria

create table UBUNTEAM_THE_SQL.Categoria(
	Id int identity ,
	categoria_descripcion nvarchar(255) 
);




--Compra

create table UBUNTEAM_THE_SQL.Compra(
	Id int identity ,
	compra_numero decimal(19,0) NOT NULL,
	compra_fecha date ,
	Id_proveedor int NOT NULL,
	compra_total decimal(18,2) ,
	Id_medio_pago int NOT NULL
);



--Proveedor

create table UBUNTEAM_THE_SQL.Proveedor(
	Id int identity,
	proveedor_cuit nvarchar(50) NOT NULL,
	proveedor_razon_social nvarchar(50) ,
	proveedor_domicilio nvarchar(50) ,
	id_localidad int NOT NULL,
	proveedor_mail nvarchar(50) 

);


--TipoDescuento

create table UBUNTEAM_THE_SQL.TipoDescuento(
	Id int identity ,
	concepto_descripcion nvarchar(255) 
);



print '**** Tablas creadas correctamente ****';

go



/********* Creacion de Constraints/PKs/FKs *********/




--Categoria

	alter table  UBUNTEAM_THE_SQL.Categoria  
	add 
		constraint PK_Categoria primary key (Id);


--MedioEnvio

	alter table  UBUNTEAM_THE_SQL.MedioEnvio  
	add 
		constraint PK_MedioEnvio primary key (Id);

--Canal 

	alter table  UBUNTEAM_THE_SQL.Canal  
	add 
		constraint PK_Canal primary key (Id);


--MedioDePago

	alter table  UBUNTEAM_THE_SQL.MedioDePago  
	add 
		constraint PK_MedioDePago primary key (Id);


--Provincia

	alter table  UBUNTEAM_THE_SQL.Provincia
	add
		constraint PK_Provincia primary key ( Id);


--Cliente

	alter table  UBUNTEAM_THE_SQL.Cliente  
	add 
		constraint PK_Cliente primary key ( Id),
	    constraint FK_Cliente_Localidad foreign key (Id_localidad) references UBUNTEAM_THE_SQL.Localidad(Id);


--MedioEnvioPorProvincia



	alter table  UBUNTEAM_THE_SQL.MedioEnvioPorProvincia
	add 
		constraint PK_MedioEnvioPorLocalidad primary key (Id),
		constraint FK_Medio_Envio foreign key (Id_medio_envio) references UBUNTEAM_THE_SQL.MedioEnvio(Id),
		constraint FK_Medio_Envio_Localidad foreign key ( Id_localidad) references UBUNTEAM_THE_SQL.Localidad(Id);


--Producto

	alter table  UBUNTEAM_THE_SQL.Producto  
	add 
		constraint PK_Producto primary key (Id),
		constraint UC_Producto_Codigo unique (prod_codigo),
		constraint FK_Categoria foreign key ( Id_categoria) references UBUNTEAM_THE_SQL.Categoria(Id);



--Venta

	alter table  UBUNTEAM_THE_SQL.Venta 
	add 
		constraint PK_Venta primary key ( Id),
		constraint UC_Venta_Codigo unique (venta_codigo),
		constraint FK_Venta_Cliente foreign key ( Id_cliente) references UBUNTEAM_THE_SQL.Cliente(Id),
		constraint FK_Venta_Canal foreign key ( Id_canal) references UBUNTEAM_THE_SQL.Canal(Id),
		constraint FK_Venta_MedioDePago foreign key ( Id_medio_de_pago) references UBUNTEAM_THE_SQL.medioDePago(Id),
		constraint FK_Venta_Medio_Envio_Por_Localidad foreign key ( Id_medio_envio_por_localidad) references UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad(Id);



--Proveedor
	alter table  UBUNTEAM_THE_SQL.Proveedor  
	add 
		constraint PK_Proveedor primary key (Id),
		constraint UC_proveedor_Cuit unique (proveedor_cuit),
		constraint FK_Proveedor_Localidad foreign key (Id_localidad) references UBUNTEAM_THE_SQL.Localidad(Id);


--Compra

	alter table  UBUNTEAM_THE_SQL.Compra  
	add 
		constraint PK_Compra primary key (Id),
		constraint UC_Compra_Numero unique (compra_numero),
		constraint FK_Proveedor foreign key ( Id_proveedor) references UBUNTEAM_THE_SQL.Proveedor(id),
		constraint FK_Compra_MedioDePago foreign key ( Id_medio_pago) references UBUNTEAM_THE_SQL.MedioDePago(Id);

	
--TipooDescuento

	alter table  UBUNTEAM_THE_SQL.TipoDescuento  
	add 
		constraint PK_tipo_Descuento primary key (Id);



print '**** CONSTRAINTs creadas correctamente ****';

go

/********* Creacion de Vistas *********/



PRINT '**** Vistas BI creadas correctamente ****';

GO



/********* Creacion de Indices *********/  -- Ver mas adelante si coviene usarlos o no
/*
create index IX_Cliente on UBUNTEAM_THE_SQL.Cliente (clie_codigo);
create index IX_Venta on UBUNTEAM_THE_SQL.Venta (venta_codigo);
create index IX_Producto on UBUNTEAM_THE_SQL.Producto (prod_codigo);
create index IX_Compra on UBUNTEAM_THE_SQL.Compra (compra_numero);
create index IX_Proveedor on UBUNTEAM_THE_SQL.Proveedor (proveedor_cuit);
create index IX_Variante on UBUNTEAM_THE_SQL.Variante (var_codigo);
create index IX_Producto_Por_Variante on UBUNTEAM_THE_SQL.ProductoPorVariante (prod_var_codigo);
create index IX_Descuento_Compra on UBUNTEAM_THE_SQL.DescuentoPorCompra (compra_numero);
create index IX_Descuento_Venta on UBUNTEAM_THE_SQL.DescuentoPorVenta (venta_codigo);
create index IX_Canal on UBUNTEAM_THE_SQL.Canal (canal_codigo);
create index IX_Medio_De_Pago on UBUNTEAM_THE_SQL.MedioDePago (medio_pago_codigo);
create index IX_Localidad on UBUNTEAM_THE_SQL.Localidad (loc_codigo);
create index IX_ConceptoDescuento on UBUNTEAM_THE_SQL.TipoDescuento (concepto_codigo);
GO */



/********* Creacion de StoredProcedures para migracion *********/


--Categoria

create procedure UBUNTEAM_THE_SQL.Migrar_Categorias
as
begin
	insert into UBUNTEAM_THE_SQL.Categoria(categoria_descripcion)
		select distinct M.PRODUCTO_CATEGORIA
		from gd_esquema.Maestra as M
		where M.PRODUCTO_CATEGORIA is not null;
		
end
go


--MedioEnvio

create procedure UBUNTEAM_THE_SQL.Migrar_MediosDeEnvio
as
begin
	insert into UBUNTEAM_THE_SQL.MedioEnvio(medio_descripcion)
	select distinct M.VENTA_MEDIO_ENVIO
	from gd_esquema.Maestra as M
	where M.VENTA_MEDIO_ENVIO is not null
end
go



-- Canal

create procedure UBUNTEAM_THE_SQL.Migrar_Canales
as
begin 
	insert into UBUNTEAM_THE_SQL.Canal(canal_descripcion)
	select distinct M.VENTA_CANAL
	from gd_esquema.Maestra as M
	where M.VENTA_CANAL is not null
end
go



-- MedioDePago

create procedure UBUNTEAM_THE_SQL.Migrar_MediosDePago
as
begin 
	insert into UBUNTEAM_THE_SQL.MedioDePago(medio_pago_descripcion,medio_costo_transaccion)
	select distinct M.VENTA_MEDIO_PAGO,M.VENTA_MEDIO_PAGO_COSTO
	from gd_esquema.Maestra as M
	where M.VENTA_MEDIO_PAGO is not null
end
go

--Provincia

create procedure UBUNTEAM_THE_SQL.Migrar_Provincias
as
begin 
	insert into UBUNTEAM_THE_SQL.Provincia(prov_descripcion)

	select distinct M.CLIENTE_PROVINCIA
	from gd_esquema.Maestra as M
	where M.CLIENTE_PROVINCIA is not null 

	union

	select distinct M.PROVEEDOR_PROVINCIA 
	from gd_esquema.Maestra as M
	where M.PROVEEDOR_PROVINCIA is not null and not exists (select prov_descripcion from UBUNTEAM_THE_SQL.Provincia)
end
go




-- Cliente

create procedure UBUNTEAM_THE_SQL.Migrar_Clientes
as
begin 

	insert into UBUNTEAM_THE_SQL.Cliente(clie_nombre,clie_dni,Id_localidad,clie_telefono,clie_apellido,clie_fecha_nac,clie_direccion,clie_mail)
	select distinct M.CLIENTE_NOMBRE,

					M.CLIENTE_DNI,
	
	(select top 1 Id from UBUNTEAM_THE_SQL.Localidad where loc_cod_postal_codigo = 	M.CLIENTE_CODIGO_POSTAL 
														   and loc_descripcion = M.CLIENTE_LOCALIDAD  and Id_provincia =  (select top 1 Id from UBUNTEAM_THE_SQL.Provincia where prov_descripcion = M.CLIENTE_PROVINCIA ) ),
	
					M.CLIENTE_TELEFONO,

					M.CLIENTE_APELLIDO,M.CLIENTE_FECHA_NAC,M.CLIENTE_DIRECCION,M.CLIENTE_MAIL

	from gd_esquema.Maestra as M

	where M.CLIENTE_NOMBRE is not null 

end
go


--MedioEnvioPorProvincia

create procedure UBUNTEAM_THE_SQL.Migrar_MediosEnvioPorProvincia
as
begin 

	insert into UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad(Id_medio_envio,Id_localidad)
	select distinct  (select top 1 Id from UBUNTEAM_THE_SQL.MedioEnvio where medio_descripcion = M.VENTA_MEDIO_ENVIO ),
	
	(select top 1 Id from UBUNTEAM_THE_SQL.Localidad where loc_cod_postal_codigo = 	M.CLIENTE_CODIGO_POSTAL 
														   and loc_descripcion = M.CLIENTE_LOCALIDAD  and Id_provincia = (select top 1 Id from UBUNTEAM_THE_SQL.Provincia where prov_descripcion = M.CLIENTE_PROVINCIA ) )


	from gd_esquema.Maestra as M

	where M.VENTA_MEDIO_ENVIO is not null

end
go



--Venta


create procedure UBUNTEAM_THE_SQL.Migrar_Ventas
as
begin 

	insert into UBUNTEAM_THE_SQL.Venta(venta_codigo,venta_fecha,Id_cliente,venta_total,Id_canal,Id_medio_de_pago,Id_medio_envio_por_localidad,venta_envio_precio, venta_canal_costo,venta_medio_de_pago_costo)
	select distinct M.VENTA_CODIGO,
					M.VENTA_FECHA,
		
		(select top 1 Id from UBUNTEAM_THE_SQL.Cliente where clie_nombre = M.CLIENTE_NOMBRE )


		,M.VENTA_TOTAL,
						(select top 1 Id from UBUNTEAM_THE_SQL.Canal where canal_descripcion = VENTA_CANAL ), (select top 1 Id from UBUNTEAM_THE_SQL.MedioDePago where medio_pago_descripcion =M.VENTA_MEDIO_PAGO ),

						(select top 1 Id from UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad  where Id_localidad = (select top 1 Id from UBUNTEAM_THE_SQL.Localidad where loc_cod_postal_codigo = 	M.CLIENTE_CODIGO_POSTAL 
														   and loc_descripcion = M.CLIENTE_LOCALIDAD  and Id_provincia = (select top 1 Id from UBUNTEAM_THE_SQL.Provincia where prov_descripcion = M.CLIENTE_PROVINCIA ) ) and Id_medio_envio =  (select top 1 Id from UBUNTEAM_THE_SQL.MedioEnvio where medio_descripcion = VENTA_MEDIO_ENVIO ) ) ,
						
						M.VENTA_ENVIO_PRECIO,M.VENTA_CANAL_COSTO,M.VENTA_MEDIO_PAGO_COSTO
	from gd_esquema.Maestra as M


	where M.VENTA_CODIGO is not null  
end
go





--Producto

create procedure UBUNTEAM_THE_SQL.Migrar_Productos
as
begin
	insert into UBUNTEAM_THE_SQL.Producto(prod_codigo,prod_descripcion,Id_categoria,prod_marca,prod_material,prod_nombre)
		select distinct  M.PRODUCTO_CODIGO,M.PRODUCTO_DESCRIPCION,
		
		(select top 1 Id from UBUNTEAM_THE_SQL.Categoria where categoria_descripcion= PRODUCTO_CATEGORIA ),
		
		M.PRODUCTO_MARCA,
		
		M.PRODUCTO_MATERIAL,
		
		M.PRODUCTO_NOMBRE

		from gd_esquema.Maestra as M

		where M.PRODUCTO_CODIGO is not null
end
go




--Proveedor

create procedure UBUNTEAM_THE_SQL.Migrar_Proveedores
as
begin
	insert into UBUNTEAM_THE_SQL.Proveedor(proveedor_cuit, proveedor_razon_social, proveedor_domicilio,id_localidad, proveedor_mail)
		select distinct M.PROVEEDOR_CUIT, 

		M.PROVEEDOR_RAZON_SOCIAL,

		M.PROVEEDOR_DOMICILIO,
	
	(select top 1 Id from UBUNTEAM_THE_SQL.Localidad where loc_cod_postal_codigo = 	M.PROVEEDOR_CODIGO_POSTAL 
														   and loc_descripcion = M.PROVEEDOR_LOCALIDAD and Id_provincia = (select top 1 Id from UBUNTEAM_THE_SQL.Provincia where prov_descripcion = M.PROVEEDOR_PROVINCIA )),

		 M.PROVEEDOR_MAIL

		from gd_esquema.Maestra M

		where M.PROVEEDOR_CUIT is not null 
end
go


--Compra


create procedure UBUNTEAM_THE_SQL.Migrar_Compras 
 as
 begin 	insert into UBUNTEAM_THE_SQL.Compra(compra_numero, compra_fecha, Id_proveedor, compra_total,Id_medio_pago)
		select distinct M.compra_numero,
						M.compra_fecha, 

						(select top 1 Id from UBUNTEAM_THE_SQL.Proveedor where proveedor_cuit = M.PROVEEDOR_CUIT and proveedor_domicilio = M.PROVEEDOR_DOMICILIO
														and proveedor_mail = M.PROVEEDOR_MAIL and proveedor_razon_social = M.PROVEEDOR_RAZON_SOCIAL 
														and Id_localidad = (select top 1 Id from UBUNTEAM_THE_SQL.Localidad where loc_cod_postal_codigo = 	M.PROVEEDOR_CODIGO_POSTAL 
														   and loc_descripcion = M.PROVEEDOR_LOCALIDAD and Id_provincia = (select top 1 Id from UBUNTEAM_THE_SQL.Provincia where prov_descripcion = M.PROVEEDOR_PROVINCIA )   )  ),
						
						M.COMPRA_TOTAL,

						(select top 1 Id from UBUNTEAM_THE_SQL.MedioDePago where medio_pago_descripcion = M.COMPRA_MEDIO_PAGO  )

		from gd_esquema.Maestra M

 		where M.COMPRA_NUMERO is not null and M.COMPRA_MEDIO_PAGO is not null
end
go 


--TipoDescuento

create procedure UBUNTEAM_THE_SQL.Migrar_TiposDeDescuento
 as
 begin 	insert into UBUNTEAM_THE_SQL.TipoDescuento(concepto_descripcion)
		select distinct M.VENTA_DESCUENTO_CONCEPTO
		
		from gd_esquema.Maestra M

 		where M.VENTA_DESCUENTO_CONCEPTO is not null
end
go 



print '**** Store Procedures creados correctamente ****';

go

/********* Ejecucion de StoredProcedures para migracion *********/


--Tablas sin FKs (tienen que ir primero porque el resto de las tablas depende de estas)

	EXECUTE UBUNTEAM_THE_SQL.Migrar_Categorias;
	print '**** Migracion de Categorias Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_MediosDeEnvio;
	print '**** Migracion de Medios de Envio Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_MediosDePago;
	print '**** Migracion de Medios de Pago Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Provincias;
	print '**** Migracion de Provincias Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Canales ;
	print '**** Migracion de Canales Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_TiposDeDescuento;
	print '**** Migracion de Tipos de Descuento Exitosa****';

	/*delete from UBUNTEAM_THE_SQL.Categoria
	delete from UBUNTEAM_THE_SQL.TipoVariante
	delete from UBUNTEAM_THE_SQL.MedioEnvio
	delete from UBUNTEAM_THE_SQL.MedioDePago
	delete from UBUNTEAM_THE_SQL.Provincia
	delete from UBUNTEAM_THE_SQL.Canal
	delete from UBUNTEAM_THE_SQL.Cupon
	delete from UBUNTEAM_THE_SQL.TipoDescuento
	delete from UBUNTEAM_THE_SQL.Producto
	delete from UBUNTEAM_THE_SQL.Variante
	delete from UBUNTEAM_THE_SQL.ProductoPorVariante
	delete from UBUNTEAM_THE_SQL.Localidad
	delete from UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad
	delete from UBUNTEAM_THE_SQL.Proveedor
	delete from UBUNTEAM_THE_SQL.Cliente
	delete from UBUNTEAM_THE_SQL.Compra
	delete from UBUNTEAM_THE_SQL.Venta
	delete from UBUNTEAM_THE_SQL.VentaPorCupon
	delete from UBUNTEAM_THE_SQL.DescuentoPorCompra
	delete from UBUNTEAM_THE_SQL.DescuentoPorVenta
*/
	--Tablas con FKs a tablas que tienen FKs (tener cuidado porque aca s  importa el orden de EXEC de los SPs)

	EXECUTE UBUNTEAM_THE_SQL.Migrar_Productos ;
	print '**** Migracion de Productos Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_MediosEnvioPorProvincia;
	print '**** Migracion de Medios de Envio por Localidad Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Proveedores ;
	print '**** Migracion de Proveedores Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Clientes;
	print '**** Migracion de Clientes Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Compras;
	print '**** Migracion de Compras Exitosa****';
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Ventas;
	print '**** Migracion de Ventas Exitosa****';

	--Tablas con FKs a tablas que no tienen FKs (van ahora porque ya se migraron las tablas sin FKs, que son de las que dependen estas tablas)




IF (
	EXISTS (SELECT  * FROM UBUNTEAM_THE_SQL.Canal)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Categoria)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Cliente)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Proveedor)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Compra)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Producto)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.MedioEnvio)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.MedioDePago)
	and EXISTS (SELECT  * FROM UBUNTEAM_THE_SQL.MedioEnvioPorProvincia)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Venta)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Variante)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.TipoDescuento)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Provincia)
	
)


	PRINT 'Tablas migradas correctamente.';



/*

/********* TESTEO *********/

*/


