use GD2C2022 ;
go

PRINT '**** Comenzando migracion ****';

go

/********* Drop de Stored Procedures *********/


IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Clientes')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Clientes;
go

PRINT '**** SPs dropeados correctamente ****';

GO 

/********* Drop de Funciones *********/


IF EXISTS (SELECT name FROM sys.objects WHERE name = 'GetCategoria')
	DROP FUNCTION UBUNTEAM_THE_SQL.GetCategoria;

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'GetProvincia')
	DROP FUNCTION UBUNTEAM_THE_SQL.GetProvincia;

PRINT '**** Funciones dropeadas correctamente ****';

GO


/********* Drop de Constraints *********/


--Localidad

	alter table  UBUNTEAM_THE_SQL.Localidad  
	drop constraint FK_Provincia ;

--Cliente

	alter table  UBUNTEAM_THE_SQL.Cliente  
	drop constraint FK_Cliente_Localidad;


--MedioEnvioPorLocalidad

	alter table  UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad  
	drop constraint FK_Medio_Envio;
	alter table  UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad 
	drop constraint FK_Medio_Envio_Localidad;

--Envio

	alter table  UBUNTEAM_THE_SQL.Envio  
	drop constraint FK_MedioEnvioPorLocalidad ;

--Venta

	alter table  UBUNTEAM_THE_SQL.Venta 
	drop constraint FK_Venta_Cliente;
	alter table  UBUNTEAM_THE_SQL.Venta 
	drop constraint FK_Venta_Canal ;
	alter table  UBUNTEAM_THE_SQL.Venta 
	drop constraint FK_Venta_MedioDePago ;
	alter table  UBUNTEAM_THE_SQL.Venta
	drop constraint FK_Venta_Envio ;

--Producto

	alter table  UBUNTEAM_THE_SQL.Producto  
	drop constraint FK_Categoria ;



--Variante

	alter table  UBUNTEAM_THE_SQL.Variante  
	drop constraint FK_Tipo_Variante ;


--ProductoPorVariante

	alter table  UBUNTEAM_THE_SQL.ProductoPorVariante  
	drop constraint FK_Prod_Var_Producto ;
	alter table  UBUNTEAM_THE_SQL.ProductoPorVariante  
	drop	constraint FK_Prod_Var_Variante ;



--Compra

	alter table  UBUNTEAM_THE_SQL.Compra  
	drop constraint FK_Proveedor ;
	alter table  UBUNTEAM_THE_SQL.Compra  
	drop constraint FK_Compra_MedioDePago ;



--Proveedor
	alter table  UBUNTEAM_THE_SQL.Proveedor  
	drop constraint FK_Proveedor_Localidad ;


--DescuentoPorVenta

	alter table  UBUNTEAM_THE_SQL.DescuentoPorVenta  
	drop constraint FK_Descuento_Venta ;
	alter table  UBUNTEAM_THE_SQL.DescuentoPorVenta 
	drop	constraint FK_Tipo_Descuento ;

--DescuentoPorCompra

	alter table  UBUNTEAM_THE_SQL.DescuentoPorCompra  
	drop constraint FK_Descuento_Compra ;


--VentaPorCupon


	alter table  UBUNTEAM_THE_SQL.VentaPorCupon  
	drop constraint FK_Venta_Cupon ;
	alter table  UBUNTEAM_THE_SQL.VentaPorCupon  
	drop	constraint FK_Cupon_Venta ;


PRINT '**** CONSTRAINTs dropeadas correctamente ****';

GO


go
/********* Drop de Tablas *********/
if exists (select name from sys.tables where name = 'Canal')
	drop table UBUNTEAM_THE_SQL.Canal;

if exists (select name from sys.tables where name = 'Categoria')
	drop table UBUNTEAM_THE_SQL.Categoria;

if exists (select name from sys.tables where name = 'Cliente')
	drop table UBUNTEAM_THE_SQL.Cliente;

if exists (select name from sys.tables where name = 'Compra')
	drop table UBUNTEAM_THE_SQL.Compra;

if exists (select name from sys.tables where name = 'ConceptoDescuento')
	drop table UBUNTEAM_THE_SQL.ConceptoDescuento;

if exists (select name from sys.tables where name = 'Cupon')
	drop table UBUNTEAM_THE_SQL.Cupon;

if exists (select name from sys.tables where name = 'DescuentoPorCompra')
	drop table UBUNTEAM_THE_SQL.DescuentoPorCompra;

if exists (select name from sys.tables where name = 'DescuentoPorVenta')
	drop table UBUNTEAM_THE_SQL.DescuentoPorVenta;

	if exists (select name from sys.tables where name = 'TipooDescuento')
	drop table UBUNTEAM_THE_SQL.TipoDescuento;

if exists (select name from sys.tables where name = 'Envio')
	drop table UBUNTEAM_THE_SQL.Envio;

if exists (select name from sys.tables where name = 'Localidad')
	drop table UBUNTEAM_THE_SQL.Localidad;

if exists (select name from sys.tables where name = 'MedioDePago')
	drop table UBUNTEAM_THE_SQL.MedioDePago;

if exists (select name from sys.tables where name = 'MedioEnvio')
	drop table UBUNTEAM_THE_SQL.MedioEnvio;

if exists (select name from sys.tables where name = 'MedioEnvioPorLocalidad')
	drop table UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad;

if exists (select name from sys.tables where name = 'Producto')
	drop table UBUNTEAM_THE_SQL.Producto;

if exists (select name from sys.tables where name = 'ProductoPorVariante')
	drop table UBUNTEAM_THE_SQL.ProductoPorVariante;

if exists (select name from sys.tables where name = 'Proveedor')
	drop table UBUNTEAM_THE_SQL.Proveedor;

if exists (select name from sys.tables where name = 'Provincia')
	drop table UBUNTEAM_THE_SQL.Provincia;

if exists (select name from sys.tables where name = 'TipoVariante')
	drop table UBUNTEAM_THE_SQL.TipoVariante;

if exists (select name from sys.tables where name = 'Variante')
	drop table UBUNTEAM_THE_SQL.Variante;

if exists (select name from sys.tables where name = 'Venta')
	drop table UBUNTEAM_THE_SQL.Venta;

if exists (select name from sys.tables where name = 'VentaPorCupon')
	drop table UBUNTEAM_THE_SQL.VentaPorCupon;


print '**** Tablas dropeadas correctamente ****';

go


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
	Id int identity NOT NULL ,
	clie_nombre nvarchar(255) NOT NULL,
	clie_dni decimal(18,0) NOT NULL,
	Id_localidad int NOT NULL,
	clie_telefono char(100) NOT NULL,
	clie_apellido nvarchar(255) NOT NULL,
	clie_fecha_nac date NOT NULL,
	clie_direccion nvarchar(255) NOT NULL,
	clie_mail nvarchar(255) 
	

	) ;


--Localidad 

create table UBUNTEAM_THE_SQL.Localidad(
	Id int identity NOT NULL,
	loc_descripcion nvarchar(255) NOT NULL,
	Id_provincia int NOT NULL,
	loc_cod_postal_codigo decimal(18, 0) NOT NULL

);

--Provincia

create table UBUNTEAM_THE_SQL.Provincia(
	Id int identity,
	prov_descripcion nvarchar(255)NOT NULL,

);


-- Venta

create table UBUNTEAM_THE_SQL.Venta(
	Id int identity NOT NULL,	
	venta_codigo decimal(19,0) NOT NULL,
	Id_prod_por_var int NOT NULL,
	venta_fecha date NOT NULL,
	Id_cliente int NOT NULL,
	venta_total decimal(18,2) NOT NULL,
	Id_canal int NOT NULL,
	Id_medio_de_pago int NOT NULL,
	Id_envio int NOT NULL,
	venta_canal_costo decimal(18,2) NOT NULL,
	venta_medio_de_pago_costo decimal(18,2) NOT NULL

);


-- Canal

create table UBUNTEAM_THE_SQL.Canal(
	Id int identity,
	canal_descripcion nvarchar(2255) NOT NULL,
	canal_costo decimal(18,2) NOT NULL,

);

--Medio De Pago

create table UBUNTEAM_THE_SQL.MedioDePago(
	Id int identity,
	medio_descripcion nvarchar(255) NOT NULL,
	medio_costo_transaccion decimal(18,2) NOT NULL

);

-- Envio

create table UBUNTEAM_THE_SQL.Envio(
	id int identity NOT NULL,
	envio_medio_localidad int NOT NULL
);

--MedioEnvio

create table UBUNTEAM_THE_SQL.MedioEnvio(
	Id int identity,
	medio_descripcion nvarchar(255)NOT NULL,
	envio_tiempo_estimado smalldatetime 
	 
);


--MedioEnvioPorLocalidad


create table UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad(
	Id int identity NOT NULL,
	Id_medio_envio int  NOT NULL,
	Id_localidad int  NOT NULL,
	medio_envio_precio decimal(18,2) NOT NULL,
	medio_envio_tiempo_estimado smalldatetime NOT NULL
	 
); 



--Producto

create table UBUNTEAM_THE_SQL.Producto(
	Id int identity,
	prod_codigo nvarchar(50) NOT NULL,
	prod_descripcion nvarchar(50) NOT NULL,
	Id_categoria int NOT NULL,
	prod_marca nvarchar(255) NOT NULL,
	prod_material nvarchar(50) NOT NULL,
	prod_nombre nvarchar(50) NOT NULL


);



--Categoria

create table UBUNTEAM_THE_SQL.Categoria(
	Id int identity ,
	categoria_descripcion nvarchar(255) NOT NULL
);

--Variante

create table UBUNTEAM_THE_SQL.Variante(
	Id int identity NOT NULL,
	var_descripcion nvarchar(50) NOT NULL,
	Id_tipo_variante nvarchar(50) NOT NULL

);


--TipoVariante

create table UBUNTEAM_THE_SQL.TipoVariante(
	Id int identity,
	tipo_var_descripcion nvarchar(50) NOT NULL
);


--ProductoPorVariante

create table UBUNTEAM_THE_SQL.ProductoPorVariante(
	Id int identity NOT NULL,
	Id_producto int  NOT NULL,
	Id_variante int NOT NULL,
	precio_compra decimal(18,2) NOT NULL,
	precio_venta decimal(18,2) NOT NULL,
	prod_var_cantidad decimal(12,2) NOT NULL

);




--Compra

create table UBUNTEAM_THE_SQL.Compra(
	Id int identity ,
	compra_numero decimal(19,0) NOT NULL,
	Id_prod_por_var int NOT NULL,
	compra_fecha date NOT NULL,
	Id_proveedor int NOT NULL,
	compra_total decimal(18,2) NOT NULL,
	Id_medio_pago int NOT NULL

);



--Proveedor

create table UBUNTEAM_THE_SQL.Proveedor(
	Id int identity,
	proveedor_cuit nvarchar(50) NOT NULL,
	proveedor_razon_social nvarchar(50) NOT NULL,
	proveedor_domicilio nvarchar(50) NOT NULL,
	proveedor_telefono decimal(18,0) NOT NULL,
	id_localidad int NOT NULL,
	proveedor_mail nvarchar(50) NOT NULL

);


--DescuentoPorVenta

create table UBUNTEAM_THE_SQL.DescuentoPorVenta(
	Id int identity NOT NULL,
	Id_venta int NOT NULL,
	desc_venta_importe decimal(18,2)NOT NULL,
	Id_tipo_descuento int NOT NULL ,

);

--DescuentoPorCompra

create table UBUNTEAM_THE_SQL.DescuentoPorCompra(
	Id int identity NOT NULL,
	Id_compra int NOT NULL,
	desc_compra_valor decimal(18,2)NOT NULL,

);



--TipoDescuento

create table UBUNTEAM_THE_SQL.TipoDescuento(
	Id int identity NOT NULL,
	concepto_descripcion nvarchar(255) NOT NULL
);


--Cupon

create table UBUNTEAM_THE_SQL.Cupon(
	Id int identity NOT NULL,
	cupon_codigo nvarchar(255) NOT NULL,
	cupon_valor decimal(18,2) NOT NULL,
	cupon_fecha_desde date NOT NULL,
	cupon_fecha_hasta date NOT NULL,
	cupon_tipo nvarchar(50) NOT NULL


);


--VentaPorCupon

create table UBUNTEAM_THE_SQL.VentaPorCupon (
	Id_venta int NOT NULL,
	Id_cupon int NOT NULL,
	venta_cupon_importe decimal(18,2) NOT NULL


);

print '**** Tablas creadas correctamente ****';

go



/********* Creacion de Constraints/PKs/FKs *********/



--TipoVariante

	alter table  UBUNTEAM_THE_SQL.TipoVariante  
	add 
		constraint PK_Tipo_Variante primary key (Id);



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


--Localidad

	alter table  UBUNTEAM_THE_SQL.Localidad  
	add 
		constraint PK_Localidad primary key ( Id),
		constraint FK_Provincia foreign key ( Id_provincia) references UBUNTEAM_THE_SQL.Provincia(Id);

--Cliente

	alter table  UBUNTEAM_THE_SQL.Cliente  
	add 
		constraint PK_Cliente primary key ( Id),
	    constraint FK_Cliente_Localidad foreign key (Id_localidad) references UBUNTEAM_THE_SQL.Localidad(Id);


--MedioEnvioPorLocalidad



	alter table  UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad  
	add 
		constraint PK_MedioEnvioPorLocalidad primary key (Id),
		constraint FK_Medio_Envio foreign key (Id_medio_envio) references UBUNTEAM_THE_SQL.MedioEnvio(Id),
		constraint FK_Medio_Envio_Localidad foreign key ( Id_localidad) references UBUNTEAM_THE_SQL.Localidad(Id);

--Envio

	alter table  UBUNTEAM_THE_SQL.Envio  
	add 
		constraint PK_Envio primary key (id),
		constraint FK_MedioEnvioPorLocalidad foreign key ( envio_medio_localidad) references UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad(Id);

--Venta

	alter table  UBUNTEAM_THE_SQL.Venta 
	add 
		constraint PK_Venta primary key ( Id),
		constraint UC_Venta_Codigo unique (venta_codigo),
		constraint FK_Producto_Por_Variante_Venta foreign key (Id_prod_por_var) references UBUNTEAM_THE_SQL.ProductoPorVariante(Id),
		constraint FK_Venta_Cliente foreign key ( Id_cliente) references UBUNTEAM_THE_SQL.Cliente(Id),
		constraint FK_Venta_Canal foreign key ( Id_canal) references UBUNTEAM_THE_SQL.Canal(Id),
		constraint FK_Venta_MedioDePago foreign key ( Id_medio_de_pago) references UBUNTEAM_THE_SQL.medioDePago(id),
		constraint FK_Venta_Envio foreign key ( id_envio) references UBUNTEAM_THE_SQL.Envio(id);


--Producto

	alter table  UBUNTEAM_THE_SQL.Producto  
	add 
		constraint PK_Producto primary key (Id),
		constraint UC_Producto_Codigo unique (producto_codigo),
		constraint FK_Categoria foreign key ( Id_categoria) references UBUNTEAM_THE_SQL.Categoria(Id);


--Variante

	alter table  UBUNTEAM_THE_SQL.Variante  
	add 
		constraint PK_Variante primary key (Id),
		constraint FK_Tipo_Variante foreign key ( Id_tipo_variante) references UBUNTEAM_THE_SQL.TipoVariante(id);


--ProductoPorVariante

	alter table  UBUNTEAM_THE_SQL.ProductoPorVariante  
	add 
		constraint PK_Producto_Por_Variante primary key (Id),
		constraint FK_Prod_Var_Producto foreign key (Id_producto) references UBUNTEAM_THE_SQL.Producto(Id),
		constraint FK_Prod_Var_Variante foreign key (Id_variante) references UBUNTEAM_THE_SQL.Variante(Id);



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
		constraint FK_Producto_Por_Variante_Compra foreign key (Id_prod_por_var) references UBUNTEAM_THE_SQL.ProductoPorVariante(Id),
		constraint FK_Proveedor foreign key ( Id_proveedor) references UBUNTEAM_THE_SQL.Proveedor(id),
		constraint FK_Compra_MedioDePago foreign key ( Id_medio_de_pago) references UBUNTEAM_THE_SQL.MedioDePago(Id);

	
--ConceptoDescuento

	alter table  UBUNTEAM_THE_SQL.TipoDescuento  
	add 
		constraint PK_tipo_Descuento primary key (Id);

--DescuentoPorVenta

	alter table  UBUNTEAM_THE_SQL.DescuentoPorVenta  
	add 
		constraint PK_Descuento_Venta primary key (Id),
		constraint FK_Descuento_Venta foreign key (Id_venta) references UBUNTEAM_THE_SQL.Venta(Id),
		constraint FK_Tipo_Descuento foreign key (Id_tipo_descuento) references UBUNTEAM_THE_SQL.TipooDescuento(Id);


--DescuentoPorCompra

	alter table  UBUNTEAM_THE_SQL.DescuentoPorCompra  
	add 
		constraint PK_Descuento_Compra primary key (Id),
		constraint FK_Descuento_Compra foreign key (Id_compra) references UBUNTEAM_THE_SQL.Compra(Id);


--Cupon
	
	alter table  UBUNTEAM_THE_SQL.Cupon  
	add 
		constraint PK_Cupon primary key (Id),
		constraint UC_Cupon_Codigo unique (cupon_codigo);


--VentaPorCupon


	alter table  UBUNTEAM_THE_SQL.VentaPorCupon  
	add 
		constraint PK_Venta_Por_Cupon primary key (Id),
		constraint FK_Venta_Cupon foreign key (Id_venta) references UBUNTEAM_THE_SQL.Venta(Id),
		constraint FK_Cupon_Venta foreign key (Id_cupon) references UBUNTEAM_THE_SQL.Cupon(Id);



print '**** CONSTRAINTs y PKs creadas correctamente ****';

go

/********* Creacion de Funciones *********/

--GetCategoria

create function UBUNTEAM_THE_SQL.GetCategoria (
	@categoria_descripcion nvarchar(255)
)
returns int
as
begin
	declare @idCategoria int = (select Categoria.Id from UBUNTEAM_THE_SQL.Categoria  
									 where Categoria.categoria_descripcion = @categoria_descripcion);
	return @idCategoria;
end
go

--GetTipoVariante

create function UBUNTEAM_THE_SQL.GetTipoVariante (
	@tipo_var_descripcion nvarchar(50)
)
returns int
as
begin
	declare @idTipoVariante int = (select TipoVariante.Id from UBUNTEAM_THE_SQL.TipoVariante  
									 where TipoVariante.tipo_var_descripcion = @tipo_var_descripcion);
	return @idTipoVariante;
end
go

-- GetMedioEnvio

create function UBUNTEAM_THE_SQL.GetMedioEnvio (
	@medio_envio_descripcion nvarchar(50)
)
returns int
as
begin
	declare @idMedioEnvio int = (select MedioEnvio.Id from UBUNTEAM_THE_SQL.MedioEnvio
									 where MedioEnvio.medio_descripcion = @medio_envio_descripcion );
	return @idMedioEnvio;
end
go

--GetCanal

create function UBUNTEAM_THE_SQL.GetCanal (
	@canal_descripcion nvarchar(2255),
	@canal_costo decimal(18,2)
)
returns int
as
begin
	declare @idCanal int = (select Canal.Id from UBUNTEAM_THE_SQL.Canal
									 where Canal.canal_descripcion = @canal_descripcion and Canal.canal_costo = @canal_costo);
	return @idCanal;
end
go


--GetMedioDePago

create function UBUNTEAM_THE_SQL.GetMedioDePago (
	@medio_descripcion nvarchar(2255),
	@medio_costo_transaccion decimal(18,2)
)
returns int
as
begin
	declare @idMedioDePago int = (select MedioDePago.Id from UBUNTEAM_THE_SQL.MedioDePago
									 where MedioDePago.medio_descripcion = @medio_descripcion and MedioDePago.medio_costo_transaccion = @medio_costo_transaccion);
	return @idMedioDePago;
end
go

--GetProvincia
create function UBUNTEAM_THE_SQL.GetProvincia (
	@prov_descripcion nvarchar(255)
)
returns int
as
begin
	declare @idProvincia int = (select Provincia.Id from UBUNTEAM_THE_SQL.Provincia
									 where Provincia.prov_descripcion = @prov_descripcion );
	return @idProvincia;
end
go


--GetLocalidad

create function UBUNTEAM_THE_SQL.GetLocalidad (
	@loc_descripcion nvarchar(255),
	@id_provincia int,
	@loc_cod_postal_codigo decimal(18,0)

)
returns int
as
begin
	declare @idLocalidad int = (select Localidad.Id from UBUNTEAM_THE_SQL.Localidad
									 where Localidad.loc_descripcion = @loc_descripcion 
									 and Localidad.Id_provincia = @id_provincia and Localidad.loc_cod_postal_codigo = @loc_cod_postal_codigo);
	return @idLocalidad;
end
go


create function UBUNTEAM_THE_SQL.GetMedioEnvioPorLocalidad (
	@id_medio_envio int,
	@id_localidad int,
	@medio_envio_precio decimal(18,2)
	

)
returns int
as
begin
	declare @idMedioEnviPorLocalidad int = (select MedioEnvioPorLocalidad.Id from UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad
									 where MedioEnvioPorLocalidad.Id_medio_envio = @id_medio_envio 
									 and MedioEnvioPorLocalidad.Id_localidad = @id_localidad
									 and MedioEnvioPorLocalidad.medio_envio_precio = @medio_envio_precio);
	return @idMedioEnviPorLocalidad;
end
go

--GetProducto

create function UBUNTEAM_THE_SQL.GetProducto (
	@prod_descripcion nvarchar(50),
	@prod_marca nvarchar(255),
	@prod_material nvarchar(50),
	@prod_nombre nvarchar(50)
)
returns int
as
begin
	declare @idProducto nvarchar = (select Producto.prod_codigo from UBUNTEAM_THE_SQL.Producto  
									where producto.prod_descripcion = @prod_descripcion 
									and Producto.prod_marca = @prod_marca
									and Producto.prod_material = @prod_material
									and Producto.prod_nombre = @prod_nombre);
	return @idProducto;
end
go




print '**** Funciones creadas correctamente ****';

go


/********* Creacion de Indices *********/
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
create index IX_Envio on UBUNTEAM_THE_SQL.Envio (envio_codigo);
create index IX_Medio_De_Pago on UBUNTEAM_THE_SQL.MedioDePago (medio_pago_codigo);
create index IX_Localidad on UBUNTEAM_THE_SQL.Localidad (loc_codigo);
create index IX_ConceptoDescuento on UBUNTEAM_THE_SQL.ConceptoDescuento (concepto_codigo);
GO */

/********* Creacion de StoredProcedures para migracion *********/

--TipoVariante

create procedure UBUNTEAM_THE_SQL.Migrar_TiposDeVariante
as
begin
	insert into UBUNTEAM_THE_SQL.TipoVariante(tipo_var_descripcion)
		select distinct M.PRODUCTO_TIPO_VARIANTE
		from gd_esquema.Maestra as M
		where M.PRODUCTO_TIPO_VARIANTE is not null 
end
go


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
	insert into UBUNTEAM_THE_SQL.Canal(canal_descripcion,canal_costo)
	select distinct M.VENTA_CANAL, M.VENTA_CANAL_COSTO 
	from gd_esquema.Maestra as M
	where M.VENTA_CANAL is not null
end
go



-- MedioDePago

create procedure UBUNTEAM_THE_SQL.Migrar_MediosDePago
as
begin 
	insert into UBUNTEAM_THE_SQL.MedioDePago(medio_descripcion,medio_costo_transaccion)
	select distinct M.VENTA_MEDIO_PAGO, M.VENTA_MEDIO_PAGO_COSTO 
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

	insert into UBUNTEAM_THE_SQL.Provincia(prov_descripcion)
	select distinct M.PROVEEDOR_PROVINCIA 
	from gd_esquema.Maestra as M
	where M.PROVEEDOR_PROVINCIA is not null and not exists (select prov_descripcion from UBUNTEAM_THE_SQL.Provincia)
end
go


-- Localidad


create procedure UBUNTEAM_THE_SQL.Migrar_Localidades
as
begin 

	insert into UBUNTEAM_THE_SQL.Localidad(loc_descripcion,Id_provincia,loc_cod_postal_codigo)
	
	select distinct M.CLIENTE_LOCALIDAD,UBUNTEAM_THE_SQL.GetProvincia(M.CLIENTE_PROVINCIA),M.CLIENTE_CODIGO_POSTAL
	from gd_esquema.Maestra as M
	where M.CLIENTE_LOCALIDAD is not null and M.CLIENTE_PROVINCIA is not null  and M.CLIENTE_CODIGO_POSTAL is not null
	union 
	select distinct M.PROVEEDOR_LOCALIDAD,UBUNTEAM_THE_SQL.GetProvincia(M.PROVEEDOR_PROVINCIA),M.PROVEEDOR_CODIGO_POSTAL
	from gd_esquema.Maestra as M
	where M.PROVEEDOR_LOCALIDAD is not null and M.PROVEEDOR_PROVINCIA is not null  and M.PROVEEDOR_CODIGO_POSTAL is not null
end
go


-- Cliente

create procedure UBUNTEAM_THE_SQL.Migrar_Clientes
as
begin 

	insert into UBUNTEAM_THE_SQL.Cliente(clie_nombre,clie_dni,Id_localidad,clie_telefono,clie_apellido,clie_fecha_nac,clie_direccion,clie_mail)
	select distinct M.CLIENTE_NOMBRE,M.CLIENTE_DNI,UBUNTEAM_THE_SQL.GetLocalidad(M.CLIENTE_LOCALIDAD,UBUNTEAM_THE_SQL.GetProvincia(M.CLIENTE_PROVINCIA),M.CLIENTE_CODIGO_POSTAL),M.CLIENTE_TELEFONO,
					M.CLIENTE_APELLIDO,M.CLIENTE_FECHA_NAC,M.CLIENTE_DIRECCION,M.CLIENTE_MAIL
	from gd_esquema.Maestra as M
	where M.CLIENTE_NOMBRE is not null and  M.CLIENTE_LOCALIDAD is not null and M.CLIENTE_PROVINCIA is not null  and M.CLIENTE_CODIGO_POSTAL is not null

end
go


--MedioEnvioPorLocalidad

create procedure UBUNTEAM_THE_SQL.Migrar_MediosDeEnvioPorLocalidad
as
begin 

	insert into UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad(Id_localidad,Id_medio_envio,medio_envio_precio)
	select distinct UBUNTEAM_THE_SQL.GetLocalidad(M.CLIENTE_LOCALIDAD,UBUNTEAM_THE_SQL.GetProvincia(M.CLIENTE_PROVINCIA),M.CLIENTE_CODIGO_POSTAL),
					UBUNTEAM_THE_SQL.GetMedioEnvio(M.VENTA_MEDIO_ENVIO), M.VENTA_ENVIO_PRECIO
	from gd_esquema.Maestra as M
	where M.CLIENTE_LOCALIDAD is not null and M.CLIENTE_PROVINCIA is not null and M.CLIENTE_CODIGO_POSTAL is not null and M.VENTA_MEDIO_ENVIO is not null

end
go

-- Envio


create procedure UBUNTEAM_THE_SQL.Migrar_Envios
as
begin 

	insert into UBUNTEAM_THE_SQL.Envio
	select distinct UBUNTEAM_THE_SQL.GetMedioEnvioPorLocalidad(UBUNTEAM_THE_SQL.GetMedioEnvio(M.VENTA_MEDIO_ENVIO),UBUNTEAM_THE_SQL.GetLocalidad(M.CLIENTE_LOCALIDAD,UBUNTEAM_THE_SQL.GetProvincia(M.CLIENTE_PROVINCIA),M.CLIENTE_CODIGO_POSTAL),M.VENTA_ENVIO_PRECIO)
	from gd_esquema.Maestra as M
	where M.VENTA_MEDIO_ENVIO is not null and M.CLIENTE_LOCALIDAD is not null and M.CLIENTE_PROVINCIA is not null and M.CLIENTE_CODIGO_POSTAL is not null and M.VENTA_MEDIO_ENVIO is not null


end
go


--Venta

--Producto

create procedure UBUNTEAM_THE_SQL.Migrar_Productos
as
begin
	insert into UBUNTEAM_THE_SQL.Producto(prod_codigo,prod_descripcion,Id_categoria,prod_marca,prod_material,prod_nombre)
		select distinct  M.PRODUCTO_CODIGO,M.PRODUCTO_DESCRIPCION,UBUNTEAM_THE_SQL.GetCategoria(M.PRODUCTO_CATEGORIA) PRODUCTO_CATEGORIA,M.PRODUCTO_MARCA,M.PRODUCTO_MATERIAL,M.PRODUCTO_NOMBRE
		from gd_esquema.Maestra as M
		where M.PRODUCTO_CATEGORIA is not null and M.PRODUCTO_CODIGO is not null
		order by M.PRODUCTO_DESCRIPCION asc
end
go


--Variante



--ProductoPorVariante

--Proveedor
create procedure UBUNTEAM_THE_SQL.Migrar_Proveedores
as
begin
	insert into UBUNTEAM_THE_SQL.Proveedor(proveedor_cuit, proveedor_razon_social, proveedor_domicilio, proveedor_telefono, id_localidad, proveedor_mail)
		select distinct M.proveedor_cuit, M.proveedor_razon_social,M.proveedor_domicilio,
		 UBUNTEAM_THE_SQL.GetLocalidad(M.PROVEEDOR_LOCALIDAD,UBUNTEAM_THE_SQL.GetProvincia(M.PROVEEDOR_PROVINCIA),M.PROVEEDOR_CODIGO_POSTAL),
		 M.PROVEEDOR_MAIL
		from gd_esquema.Maestra M
		where M.proveedor_cuit is not null and  M.PROVEEDOR_LOCALIDAD is not null and M.PROVEEDOR_PROVINCIA is not null and M.PROVEEDOR_CODIGO_POSTAL is not null
end
go


--Compra

-- create table UBUNTEAM_THE_SQL.Compra(
-- 	Id int identity ,
-- 	compra_numero decimal(19,0) NOT NULL,
-- 	Id_prod_por_var int NOT NULL,
-- 	compra_fecha date NOT NULL,
-- 	Id_proveedor int NOT NULL,
-- 	compra_total decimal(18,2) NOT NULL,
-- 	Id_medio_pago int NOT NULL

-- );


 create procedure UBUNTEAM_THE_SQL.Migrar_Compras
 as
 begin 	insert into UBUNTEAM_THE_SQL.Compra(compra_numero,Id_prod_por_var, compra_fecha, Id_proveedor, compra_total,Id_medio_pago)
		select distinct M.compra_numero, M.compra_fecha, M.compra_total,
						UBUNTEAM_THE_SQL.GetMedioDePago(M.compra_medio_pago,null) 
		
		from gd_esquema.Maestra M
 		where M.proveedor_cuit is not null  and M.COMPRA_NUMERO is not null and M.COMPRA_MEDIO_PAGO is not null and M.PRODUCTO_CODIGO is not null 
		and M.PRODUCTO_VARIANTE is not null
end
go 



--TipoDescuento

--DescuentoPorCompra

--DescuentoPorVenta

--Cupon

-- create table UBUNTEAM_THE_SQL.Cupon(
-- 	Id int identity NOT NULL,
-- 	cupon_codigo nvarchar(255) NOT NULL,
-- 	cupon_valor decimal(18,2) NOT NULL,
-- 	cupon_fecha_desde date NOT NULL,
-- 	cupon_fecha_hasta date NOT NULL,
-- 	cupon_tipo nvarchar(50) NOT NULL
-- );

create procedure UBUNTEAM_THE_SQL.Migrar_Cupones
as
begin
	insert into UBUNTEAM_THE_SQL.Cupon(cupon_codigo, cupon_valor, cupon_fecha_desde, cupon_fecha_hasta, cupon_tipo)
		select distinct M.VENTA_CUPON_CODIGO, M.VENTA_CUPON_VALOR, M.VENTA_CUPON_FECHA_DESDE, 
						M.VENTA_CUPON_FECHA_HASTA, M.VENTA_CUPON_TIPO
		from gd_esquema.Maestra M 
		where M.VENTA_CUPON_CODIGO is not null
end
go


--VentaPorCupon



print '**** SPs creados correctamente ****';

go

/********* Ejecucion de StoredProcedures para migracion *********/

BEGIN TRANSACTION
BEGIN TRY
	/* Tablas sin FKs (tienen que ir primero porque el resto de las tablas depende de estas) */
	EXECUTE UBUNTEAM_THE_SQL.Migrar_TiposDeVariante;

	/* Tablas con FKs a tablas que no tienen FKs (van ahora porque ya se migraron las tablas sin FKs, que son de las que dependen estas tablas) */
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Clientes;

	/* Tablas con FKs a tablas que tienen FKs (tener cuidado porque aca s� importa el orden de EXEC de los SPs) */
	EXECUTE UBUNTEAM_THE_SQL.Migrar_MediosDeEnvioPorLocalidad;

END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	DECLARE @mensajeError nvarchar(MAX) = 'Error al ejecutar los SPs de migracion de tablas:- ' + ERROR_MESSAGE();
	THROW 50001, @mensajeError, 1;
END CATCH

IF (
	EXISTS (SELECT TOP 1 1 FROM UBUNTEAM_THE_SQL.Cliente)
	AND EXISTS (SELECT TOP 1 1 FROM UBUNTEAM_THE_SQL.Producto)
	
)
BEGIN
	COMMIT TRANSACTION;
	PRINT 'Tablas migradas correctamente.';
END
ELSE
BEGIN
	ROLLBACK TRANSACTION;
	THROW 50002, 'Ocurrio un error al migrar las tablas (hay tablas a las que no se le llenaron filas).', 1;
END

GO

/********* TESTEO *********/

--select * from UBUNTEAM_THE_SQL.Envio
--select distinct M.VENTA_MEDIO_ENVIO,M.CLIENTE_LOCALIDAD,M.CLIENTE_PROVINCIA , M.CLIENTE_CODIGO_POSTAL,M.VENTA_ENVIO_PRECIO from gd_esquema.Maestra M
