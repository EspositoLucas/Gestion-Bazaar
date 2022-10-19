use GD2C2022 ;
go

go
-- SQL Server, Azure SQL Database 

DROP FUNCTION UBUNTEAM_THE_SQL.GetCategoria;
DROP FUNCTION UBUNTEAM_THE_SQL.GetProducto;

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
	drop constraint FK_Envio_MedioENvioPorLocalidad ;

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
	drop table UBUNTEAM_THE_SQL.TipooDescuento;

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

if exists (select name from sys.tables where name = 'ProductoPorCompra')
	drop table UBUNTEAM_THE_SQL.ProductoPorCompra;

if exists (select name from sys.tables where name = 'ProductoPorVariante')
	drop table UBUNTEAM_THE_SQL.ProductoPorVariante;

if exists (select name from sys.tables where name = 'ProductosVariante')
	drop table UBUNTEAM_THE_SQL.ProductosVariante;

if exists (select name from sys.tables where name = 'ProductoPorVenta')
	drop table UBUNTEAM_THE_SQL.ProductoPorVenta;

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

print '**** Comenzando migracion ****';
/********* Creacion de Tablas *********/


--Cliente

create table UBUNTEAM_THE_SQL.Cliente(
	clie_codigo char(6) NOT NULL ,
	clie_nombre nvarchar(255) NOT NULL,
	clie_dni decimal(18,0) NOT NULL,
	clie_localidad nvarchar(255) NOT NULL,
	clie_telefono char(100) NOT NULL,
	clie_apellido nvarchar(255) NOT NULL,
	clie_fecha_nac date NOT NULL,
	clie_direccion nvarchar(255) NOT NULL,
	clie_mail nvarchar(255) 
	

	) ;

select * from gd_esquema.Maestra

--Localidad 

create table UBUNTEAM_THE_SQL.Localidad(
	loc_codigo nvarchar(255) NOT NULL,
	loc_descripcion nvarchar(50) NOT NULL,
	prov_codigo nvarchar(255) NOT NULL,
	loc_cod_postal_codigo decimal(18, 0) NOT NULL

);

--Provincia

create table UBUNTEAM_THE_SQL.Provincia(
	Id int identity,
	prov_descripcion nvarchar(255)NOT NULL,

);


-- Venta

create table UBUNTEAM_THE_SQL.Venta(
	venta_codigo decimal(19,0) NOT NULL,
	prod_por_var_codigo numeric(6) NOT NULL,
	venta_fecha date NOT NULL,
	venta_cliente char(6) NOT NULL,
	venta_total decimal(18,2) NOT NULL,
	venta_canal nvarchar(2255) NOT NULL,
	venta_medio_de_pago numeric(6) NOT NULL,
	venta_envio numeric(6) NOT NULL,
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
	id int identity,
	medio_descripcion nvarchar(255) NOT NULL,
	medio_costo_transaccion decimal(18,2) NOT NULL

);

-- Envio

create table UBUNTEAM_THE_SQL.Envio(
	envio_codigo numeric(6) NOT NULL,
	envio_medio_localidad numeric(6) NOT NULL
);

--MedioEnvio

create table UBUNTEAM_THE_SQL.MedioEnvio(
	Id int identity,
	medio_descripcion nvarchar(255)NOT NULL,
	envio_tiempo_estimado smalldatetime 
	 
);


--MedioEnvioPorLocalidad


create table UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad(
	medio_envio_localidad_codigo numeric(6) NOT NULL,
	medio_envio_codigo numeric(6)  NOT NULL,
	loc_codigo nvarchar(255)  NOT NULL,
	medio_envio_precio decimal(18,2) NOT NULL,
	medio_envio_tiempo_estimado smalldatetime NOT NULL
	 
); 



--Producto

create table UBUNTEAM_THE_SQL.Producto(
	Id int identity,
	prod_codigo nvarchar(50) NOT NULL,
	prod_descripcion nvarchar(50) NOT NULL,
	prod_categoria int NOT NULL,
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
	var_codigo nvarchar(50) NOT NULL,
	var_descripcion nvarchar(50) NOT NULL,
	var_tipo nvarchar(50) NOT NULL

);


--TipoVariante

create table UBUNTEAM_THE_SQL.TipoVariante(
	id int identity,
	tipo_var_descripcion nvarchar(50) NOT NULL
);


--ProductoPorVariante

create table UBUNTEAM_THE_SQL.ProductoPorVariante(
	prod_por_var_codigo numeric(6) NOT NULL,
	prod_codigo nvarchar(50)  NOT NULL,
	var_codigo nvarchar(50)NOT NULL,
	precio_compra decimal(18,2) NOT NULL,
	precio_venta decimal(18,2) NOT NULL,
	prod_var_cantidad decimal(12,2) NOT NULL

);




--Compra

create table UBUNTEAM_THE_SQL.Compra(
	Id int identity ,
	compra_numero decimal(19,0) NOT NULL,
	prod_por_var_codigo numeric(6) NOT NULL,
	compra_fecha date NOT NULL,
	compra_proveedor nvarchar(50) NOT NULL,
	compra_total decimal(18,2) NOT NULL,
	compra_medio_pago numeric(6) NOT NULL

);



--Proveedor

create table UBUNTEAM_THE_SQL.Proveedor(
	proveedor_cuit nvarchar(50) NOT NULL,
	proveedor_razon_social nvarchar(50) NOT NULL,
	proveedor_domicilio nvarchar(50) NOT NULL,
	proveedor_telefono decimal(18,0) NOT NULL,
	proveedor_localidad nvarchar(255) NOT NULL,
	proveedor_mail nvarchar(50) NOT NULL

);


--DescuentoPorVenta

create table UBUNTEAM_THE_SQL.DescuentoPorVenta(
	venta_codigo decimal(19,0) NOT NULL,
	desc_venta_importe decimal(18,2)NOT NULL,
	desc_tipo numeric(6) NOT NULL,

);

--DescuentoPorCompra

create table UBUNTEAM_THE_SQL.DescuentoPorCompra(
	compra_numero decimal(19,0) NOT NULL,
	desc_compra_valor decimal(18,2)NOT NULL,

);



--ConceptoDescuento

create table UBUNTEAM_THE_SQL.TipooDescuento(
	tipo_descuento_codigo numeric(6) NOT NULL,
	concepto_descripcion nvarchar(255) NOT NULL
);


--Cupon

create table UBUNTEAM_THE_SQL.Cupon(
	cupon_codigo nvarchar(255) NOT NULL,
	cupon_valor decimal(18,2) NOT NULL,
	cupon_fecha_desde date NOT NULL,
	cupon_fecha_hasta date NOT NULL,
	cupon_tipo nvarchar(50) NOT NULL


);


--VentaPorCupon

create table UBUNTEAM_THE_SQL.VentaPorCupon (
	venta_codigo decimal(19,0) NOT NULL,
	cupon_codigo nvarchar(255) NOT NULL,
	venta_cupon_importe decimal(18,2) NOT NULL


);

print '**** Tablas creadas correctamente ****';

go



/********* Creacion de Constraints/PKs/FKs *********/



--TipoVariante

	alter table  UBUNTEAM_THE_SQL.TipoVariante  
	add 
		constraint PK_Tipo_Variante primary key (tipo_var_codigo);



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
		constraint FK_Provincia foreign key ( prov_codigo) references UBUNTEAM_THE_SQL.Provincia(prov_codigo);

--Cliente

	alter table  UBUNTEAM_THE_SQL.Cliente  
	add 
		constraint PK_Cliente primary key ( Id),
		constraint UC_Cliente_Codigo unique (cliente_codigo),
	    constraint FK_Cliente_Localidad foreign key (clie_localidad) references UBUNTEAM_THE_SQL.Localidad(loc_codigo);


--MedioEnvioPorLocalidad



	alter table  UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad  
	add 
		constraint PK_MedioEnvioPorLocalidad primary key (Id),
		constraint FK_Medio_Envio foreign key ( medio_envio_codigo) references UBUNTEAM_THE_SQL.MedioEnvio(medio_envio_codigo),
		constraint FK_Medio_Envio_Localidad foreign key ( loc_codigo) references UBUNTEAM_THE_SQL.Localidad(loc_codigo);

--Envio

	alter table  UBUNTEAM_THE_SQL.Envio  
	add 
		constraint PK_Envio primary key (id),
		constraint FK_Envio_MedioENvioPorLocalidad foreign key ( envio_medio_localidad) references UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad(medio_envio_localidad_codigo);

--Venta

	alter table  UBUNTEAM_THE_SQL.Venta 
	add 
		constraint PK_Venta primary key ( Id),
		constraint FK_Producto_Por_Variante_Venta foreign key (prod_por_var_codigo) references UBUNTEAM_THE_SQL.ProductoPorVariante(prod_por_var_codigo),
		constraint FK_Venta_Cliente foreign key ( venta_cliente) references UBUNTEAM_THE_SQL.Cliente(clie_codigo),
		constraint FK_Venta_Canal foreign key ( venta_canal) references UBUNTEAM_THE_SQL.Canal(canal_codigo),
		constraint FK_Venta_MedioDePago foreign key ( venta_medio_de_pago) references UBUNTEAM_THE_SQL.medioDePago(medio_pago_codigo),
		constraint FK_Venta_Envio foreign key ( venta_envio) references UBUNTEAM_THE_SQL.Envio(envio_codigo);


--Producto

	alter table  UBUNTEAM_THE_SQL.Producto  
	add 
		constraint PK_Producto primary key (Id),
		constraint FK_Categoria foreign key ( prod_categoria) references UBUNTEAM_THE_SQL.Categoria(Id);


--Variante

	alter table  UBUNTEAM_THE_SQL.Variante  
	add 
		constraint PK_Variante primary key (Id),
		constraint FK_Tipo_Variante foreign key ( var_tipo) references UBUNTEAM_THE_SQL.TipoVariante(tipo_var_codigo);


--ProductoPorVariante

	alter table  UBUNTEAM_THE_SQL.ProductoPorVariante  
	add 
		constraint PK_Producto_Por_Variante primary key (Id),
		constraint FK_Prod_Var_Producto foreign key ( prod_codigo) references UBUNTEAM_THE_SQL.Producto(prod_codigo),
		constraint FK_Prod_Var_Variante foreign key (var_codigo) references UBUNTEAM_THE_SQL.Variante(var_codigo);



--Proveedor
	alter table  UBUNTEAM_THE_SQL.Proveedor  
	add 
		constraint PK_Proveedor primary key (proveedor_cuit),
		constraint FK_Proveedor_Localidad foreign key (proveedor_localidad) references UBUNTEAM_THE_SQL.Localidad(loc_codigo);


--Compra

	alter table  UBUNTEAM_THE_SQL.Compra  
	add 
		constraint PK_Compra primary key (Id),
		constraint FK_Producto_Por_Variante_Compra foreign key (prod_por_var_codigo) references UBUNTEAM_THE_SQL.ProductoPorVariante(prod_por_var_codigo),
		constraint FK_Proveedor foreign key ( compra_proveedor) references UBUNTEAM_THE_SQL.Proveedor(proveedor_cuit),
		constraint FK_Compra_MedioDePago foreign key ( compra_medio_pago) references UBUNTEAM_THE_SQL.MedioDePago(medio_pago_codigo);

	
--ConceptoDescuento

	alter table  UBUNTEAM_THE_SQL.TipooDescuento  
	add 
		constraint PK_tipo_Descuento primary key (tipo_descuento_codigo);

--DescuentoPorVenta

	alter table  UBUNTEAM_THE_SQL.DescuentoPorVenta  
	add 
		constraint PK_Descuento_Venta primary key (venta_codigo),
		constraint FK_Descuento_Venta foreign key (venta_codigo) references UBUNTEAM_THE_SQL.Venta(venta_codigo),
		constraint FK_Tipo_Descuento foreign key (desc_tipo) references UBUNTEAM_THE_SQL.TipooDescuento(tipo_descuento_codigo);


--DescuentoPorCompra

	alter table  UBUNTEAM_THE_SQL.DescuentoPorCompra  
	add 
		constraint PK_Descuento_Compra primary key (compra_numero),
		constraint FK_Descuento_Compra foreign key (compra_numero) references UBUNTEAM_THE_SQL.Compra(compra_numero);


--Cupon
	
	alter table  UBUNTEAM_THE_SQL.Cupon  
	add 
		constraint PK_Cupon primary key (cupon_codigo);


--VentaPorCupon


	alter table  UBUNTEAM_THE_SQL.VentaPorCupon  
	add 
		constraint PK_Venta_Por_Cupon primary key (venta_codigo,cupon_codigo),
		constraint FK_Venta_Cupon foreign key (venta_codigo) references UBUNTEAM_THE_SQL.Venta(venta_codigo),
		constraint FK_Cupon_Venta foreign key (cupon_codigo) references UBUNTEAM_THE_SQL.Cupon(cupon_codigo);



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
	declare @idCategoria nvarchar = (select Categoria.Id from UBUNTEAM_THE_SQL.Categoria  
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
	declare @idTipoVariante nvarchar = (select TipoVariante.Id from UBUNTEAM_THE_SQL.TipoVariante  
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
	declare @idMedioEnvio nvarchar = (select MedioEnvio.Id from UBUNTEAM_THE_SQL.MedioEnvi
									 where MedioEnvio.medio_descripcion = @medio_envio_descripcion );
	return @idMedioEnvio;
end
go

--GetCanal

create function UBUNTEAM_THE_SQL.GetCanal (
	@canal_descripcion nvarchar(2255)
	@canal_costo decimal(18,2)
)
returns int
as
begin
	declare @idCanal nvarchar = (select Canal.Id from UBUNTEAM_THE_SQL.Canal
									 where Canal.canal_descripcion = @canal_descripcion and Canal.canal_costo = @canal_costo);
	return @idCanal;
end
go


--GetMedioDePago

create function UBUNTEAM_THE_SQL.GetMedioDePago (
	@medio_descripcion nvarchar(2255)
	@medio_costo_transaccion decimal(18,2)
)
returns int
as
begin
	declare @idMedioDePago nvarchar = (select MedioDePago.Id from UBUNTEAM_THE_SQL.MedioDePago
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
	declare @idProvincia nvarchar = (select Provincia.Id from UBUNTEAM_THE_SQL.Provincia
									 where Provincia.prov_descripcion = @prov_descripcion );
	return @idProvincia;
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

create procedure UBUNTEAM_THE_SQL.Migrar_TipoVariante
as
begin
	insert into UBUNTEAM_THE_SQL.TipoVariante(tipo_var_descripcion)
		select distinct M.PRODUCTO_TIPO_VARIANTE
		from gd_esquema.Maestra as M
		where M.PRODUCTO_TIPO_VARIANTE is not null 
end
go

--Categoria

create procedure UBUNTEAM_THE_SQL.Migrar_Categoria
as
begin
	insert into UBUNTEAM_THE_SQL.Categoria(categoria_descripcion)
		select distinct M.PRODUCTO_CATEGORIA
		from gd_esquema.Maestra as M
		where M.PRODUCTO_CATEGORIA is not null;
		
end
go

select distinct (gd_esquema.Maestra.PRODUCTO_CATEGORIA) from gd_esquema.Maestra

select * from UBUNTEAM_THE_SQL.Categoria

--MedioEnvio

create procedure UBUNTEAM_THE_SQL.Migrar_MedioEnvio
as
begin
	insert into UBUNTEAM_THE_SQL.MedioEnvio(medio_descripcion)
	select distinct M.VENTA_MEDIO_ENVIO
	from gd_esquema.Maestra as M
	where M.VENTA_MEDIO_ENVIO is not null
end
go

-- Canal

create procedure UBUNTEAM_THE_SQL.Migrar_Canal
as
begin 
	insert into UBUNTEAM_THE_SQL.Canal(canal_descripcion,canal_costo)
	select distinct M.VENTA_CANAL, M.VENTA_CANAL_COSTO 
	from gd_esquema.Maestra as M
	where M.VENTA_CANAL is not null
end
go

-- MedioDePago

create procedure UBUNTEAM_THE_SQL.Migrar_MedioDePago
as
begin 
	insert into UBUNTEAM_THE_SQL.MedioDePago(medio_descripcion,medio_costo_transaccion)
	select distinct M.VENTA_MEDIO_PAGO, M.VENTA_MEDIO_PAGO_COSTO 
	from gd_esquema.Maestra as M
	where M.VENTA_MEDIO_PAGO is not null
end
go

-- Provincia
/*
prov_codigo nvarchar(255) NOT NULL,
prov_descripcion nvarchar(50)NOT NULL,
*/

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

select * from UBUNTEAM_THE_SQL.Provincia
-- Localidad

create procedure UBUNTEAM_THE_SQL.Migrar_Localidad
as
begin 
	insert into UBUNTEAM_THE_SQL.MedioDePago(prov_descripcion)
	select distinct M.CLIENTE_PROVINCIA 
	from gd_esquema.Maestra as M
	where M.CLIENTE_PROVINCIA is not null
end
go


-- Cliente



--Producto

create procedure UBUNTEAM_THE_SQL.Migrar_Productos
as
begin
	insert into UBUNTEAM_THE_SQL.Producto(prod_codigo,prod_descripcion,prod_categoria,prod_marca,prod_material,prod_nombre)
		select distinct  M.PRODUCTO_CODIGO,M.PRODUCTO_DESCRIPCION,UBUNTEAM_THE_SQL.GetCategoria(M.PRODUCTO_CATEGORIA) PRODUCTO_CATEGORIA,M.PRODUCTO_MARCA,M.PRODUCTO_MATERIAL,M.PRODUCTO_NOMBRE
		from gd_esquema.Maestra as M
		where M.PRODUCTO_CATEGORIA is not null and M.PRODUCTO_CODIGO is not null
		order by M.PRODUCTO_DESCRIPCION asc
end
go

select * from UBUNTEAM_THE_SQL.Producto

select distinct(gd_esquema.Maestra.PRODUCTO_CODIGO) from gd_esquema.Maestra
where gd_esquema.Maestra.PRODUCTO_CODIGO is not null
order by gd_esquema.Maestra.PRODUCTO_CODIGO asc





print '**** SPs creados correctamente ****';

go



/*select PRODUCTO_CODIGO,PRODUCTO_VARIANTE,PRODUCTO_TIPO_VARIANTE from gd_esquema.Maestra
order by PRODUCTO_CODIGO desc
select VENTA_CODIGO, VENTA_MEDIO_PAGO,VENTA_MEDIO_PAGO_COSTO, VENTA_DESCUENTO_CONCEPTO,VENTA_DESCUENTO_IMPORTE from gd_esquema.Maestra
order by VENTA_CODIGO,VENTA_DESCUENTO_IMPORTE desc
select * from gd_esquema.Maestra*/