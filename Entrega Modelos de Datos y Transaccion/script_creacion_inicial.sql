use GD2C2022 ;
go

go

/*
print '**** Comenzando migracion ****';
go

/********* Drop de Tablas *********/
if exists (select name from sys.tables where name = 'Canal')
	drop table UBUNTEAM_THE_SQL.Cliente;

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

if exists (select name from sys.tables where name = 'Envio')
	drop table UBUNTEAM_THE_SQL.Envio;

if exists (select name from sys.tables where name = 'Localidad')
	drop table UBUNTEAM_THE_SQL.Localidad;

if exists (select name from sys.tables where name = 'MedioDePago')
	drop table UBUNTEAM_THE_SQL.MedioDePago;

if exists (select name from sys.tables where name = 'MedioEnvio')
	drop table UBUNTEAM_THE_SQL.MedioEnvio;

if exists (select name from sys.tables where name = 'Producto')
	drop table UBUNTEAM_THE_SQL.Producto;

if exists (select name from sys.tables where name = 'ProductoPorCompra')
	drop table UBUNTEAM_THE_SQL.ProductoPorCompra;

if exists (select name from sys.tables where name = 'ProductoPorVariante')
	drop table UBUNTEAM_THE_SQL.ProductoPorVariante;

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

/********* Creacion de Schema *********/
--create schema UBUNTEAM_THE_SQL;
--go


/********* Drop de Schema *********/
if exists (select name from sys.schemas where name = 'UBUNTEAM_THE_SQL')
	drop schema UBUNTEAM_THE_SQL;
go


*/


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
	clie_mail nvarchar(255) NOT NULL
	

	) ;


--Localidad 

create table UBUNTEAM_THE_SQL.Localidad(
	loc_codigo nvarchar(255) NOT NULL,
	loc_descripcion nvarchar(50) NOT NULL,
	prov_codigo nvarchar(255) NOT NULL,
	loc_cod_postal_codigo decimal(18, 0) NOT NULL

);

--Provincia

create table UBUNTEAM_THE_SQL.Provincia(
	prov_codigo nvarchar(255) NOT NULL,
	prov_descripcion nvarchar(50)NOT NULL,

);


-- Venta

create table UBUNTEAM_THE_SQL.Venta(
	venta_codigo decimal(19,0) NOT NULL,
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
	canal_codigo nvarchar(2255) NOT NULL,
	canal_costo decimal(18,2) NOT NULL,
	canal_descripcion nvarchar(50)NOT NULL

);

--Medio De Pago

create table UBUNTEAM_THE_SQL.MedioDePago(
	medio_pago_codigo numeric(6) NOT NULL,
	medio_nombre nvarchar(255) NOT NULL,
	medio_costo_transaccion decimal(18,2) NOT NULL

);

-- Envio

create table UBUNTEAM_THE_SQL.Envio(
	envio_codigo numeric(6) NOT NULL,
	envio_medio numeric(6) NOT NULL,
	envio_localidad nvarchar(255)NOT NULL,
	envio_precio decimal(18,2) NOT NULL,
	 
);

--MedioEnvio

create table UBUNTEAM_THE_SQL.MedioEnvio(
	medio_envio_medio numeric(6) NOT NULL,
	medio_descripcion nvarchar(255)NOT NULL,
	envio_tiempo_estimado smalldatetime NOT NULL
	 
);

--Producto

create table UBUNTEAM_THE_SQL.Producto(
	prod_codigo nvarchar(50) NOT NULL,
	prod_descripcion nvarchar NOT NULL,
	prod_categoria nvarchar(255)NOT NULL,
	prod_marca nvarchar(255) NOT NULL,
	prod_material nvarchar(50) NOT NULL,
	prod_cantidad decimal(12,2) NOT NULL,
	prod_precio decimal(12,2)NOT NULL,
	prod_total decimal(12,2) NOT NULL,
	prod_nombre nvarchar(50) NOT NULL


);

--Categoria

create table UBUNTEAM_THE_SQL.Categoria(
	categoria_codigo nvarchar(50) NOT NULL,
	var_descripcion nvarchar(50) NOT NULL
);


--Variante

create table UBUNTEAM_THE_SQL.Variante(
	var_codigo nvarchar(50) NOT NULL,
	var_descripcion nvarchar(50) NOT NULL,
	var_tipo nvarchar(50) NOT NULL

);


--TipoVariante

create table UBUNTEAM_THE_SQL.TipoVariante(
	tipo_var_codigo nvarchar(50) NOT NULL,
	tipo_var_descripcion nvarchar(50) NOT NULL
);


--ProductoPorVariante

create table UBUNTEAM_THE_SQL.ProductoPorVariante(
	prod_por_var_codigo numeric(6) NOT NULL,
	prod_codigo nvarchar(50)  NOT NULL,
	var_codigo nvarchar(50)NOT NULL,
);


--ProductosVariante

create table UBUNTEAM_THE_SQL.ProductosVariante(
	productos_variante_codigo numeric(6) NOT NULL,
	prod_por_var_codigo numeric(6)  NOT NULL,
	prod_variante_precio decimal(18,0) NOT NULL,
	prod_variante_cantidad decimal(12,2)NOT NULL
);


-- ProductoPorVenta

create table UBUNTEAM_THE_SQL.ProductoPorVenta(
	venta_codigo decimal(19,0) NOT NULL,
	productos_variante_codigo numeric(6) NOT NULL,
	prod_venta_cantidad decimal(12,2) NOT NULL,
	prod_venta_precio decimal(12,2) NOT NULL,

);

--Compra

create table UBUNTEAM_THE_SQL.Compra(
	compra_numero decimal(19,0) NOT NULL,
	compra_fecha date NOT NULL,
	compra_proveedor nvarchar(50) NOT NULL,
	compra_total decimal(18,2) NOT NULL,
	compra_medio_pago nvarchar(255) NOT NULL

);


--ProductoPorCompra

create table UBUNTEAM_THE_SQL.ProductoPorCompra(
	compra_numero decimal(19,0) NOT NULL,
	productos_variante_codigo numeric(6) NOT NULL,
	prod_compra_precio decimal(18,0) NOT NULL,
	prod_compra_cantidad decimal(18,2) NOT NULL

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
	desc_concepto nvarchar(255) NOT NULL,

);


--ConceptoDescuento

create table UBUNTEAM_THE_SQL.ConceptoDescuento(
	concepto_codigo numeric(6) NOT NULL,
	concepto_tipo nvarchar(255) NOT NULL,
	conepto_porcentaje_descuento decimal(18,2)NOT NULL
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


/********* Creacion de Constraints/PKs *********/


--Cliente

	alter table  UBUNTEAM_THE_SQL.Cliente  
	add 
		constraint PK_Cliente primary key ( clie_codigo),
	    constraint FK_Cliente_Localidad foreign key (clie_localidad) references UBUNTEAM_THE_SQL.Localidad(loc_codigo);
	

--Localidad

	alter table  UBUNTEAM_THE_SQL.Localidad  
	add 
		constraint PK_Localidad primary key ( loc_codigo),
		constraint FK_Provincia foreign key ( prov_codigo) references UBUNTEAM_THE_SQL.Provincia(prov_codigo);

--Provincia

	alter table  UBUNTEAM_THE_SQL.Provincia
	add
		constraint PK_Provincia primary key ( prov_codigo);


--Venta

	alter table  UBUNTEAM_THE_SQL.Venta 
	add 
		constraint PK_Venta primary key ( venta_codigo),
		constraint FK_Venta_Cliente foreign key ( venta_cliente) references UBUNTEAM_THE_SQL.Cliente(clie_codigo),
		constraint FK_Venta_Canal foreign key ( venta_canal) references UBUNTEAM_THE_SQL.Canal(canal_codigo),
		constraint FK_Venta_MedioDePago foreign key ( venta_medio_de_pago) references UBUNTEAM_THE_SQL.medioDePago(medio_pago_codigo),
		constraint FK_Venta_Envio foreign key ( venta_envio) references UBUNTEAM_THE_SQL.Envio(envio_codigo);
	

--Canal 

	alter table  UBUNTEAM_THE_SQL.Canal  
	add 
		constraint PK_Canal primary key ( canal_codigo);


--MedioDePago

	alter table  UBUNTEAM_THE_SQL.MedioDePago  
	add 
		constraint PK_MedioDePago primary key (medio_pago_codigo);


--Envio

	alter table  UBUNTEAM_THE_SQL.Envio  
	add 
		constraint PK_Envio primary key (envio_codigo),
		constraint FK_Envio_Medio foreign key ( envio_medio) references UBUNTEAM_THE_SQL.MedioEnvio(medio_envio_codigo),
		constraint FK_Envio_Localidad foreign key ( envio_localidad) references UBUNTEAM_THE_SQL.Localidad(loc_codigo);


--MedioEnvio

	alter table  UBUNTEAM_THE_SQL.MedioEnvio  
	add 
		constraint PK_MedioEnvio primary key (medio_envio_codigo);


--Producto

	alter table  UBUNTEAM_THE_SQL.Producto  
	add 
		constraint PK_Producto primary key (prod_codigo),
		constraint FK_Categoria foreign key ( prod_categoria) references UBUNTEAM_THE_SQL.Categoria(categoria_codigo);


--Categoria

	alter table  UBUNTEAM_THE_SQL.Categoria  
	add 
		constraint PK_Categoria primary key (categoria_codigo);

--Variante

	alter table  UBUNTEAM_THE_SQL.Variante  
	add 
		constraint PK_Variante primary key (var_codigo),
		constraint FK_Tipo_Variante foreign key ( var_tipo) references UBUNTEAM_THE_SQL.TipoVariante(tipo_var_codigo);


--TipoVariante

	alter table  UBUNTEAM_THE_SQL.TipoVariante  
	add 
		constraint PK_Tipo_Variante primary key (tipo_var_codigo);


--ProductoPorVariante

	alter table  UBUNTEAM_THE_SQL.ProductoPorVariante  
	add 
		constraint PK_Producto_Por_Variante primary key (prod_por_var_codigo),
		constraint FK_Prod_Var_Producto foreign key ( prod_codigo) references UBUNTEAM_THE_SQL.Producto(prod_codigo),
		constraint FK_Prod_Var_Variante foreign key (var_codigo) references UBUNTEAM_THE_SQL.Variante(var_codigo);


--ProductoPorVenta

	alter table  UBUNTEAM_THE_SQL.ProductoPorVenta  
	add 
		constraint PK_ProductoPorVenta primary key (venta_codigo,prod_por_var_prod_codigo,prod_por_var_var_codigo),
		constraint FK_Producto_Por_Venta_Venta foreign key ( venta_codigo) references UBUNTEAM_THE_SQL.Venta(venta_codigo),
	
		constraint FK_Producto_Por_Variante_Venta foreign key ( productos_variante_codigo) references UBUNTEAM_THE_SQL.ProductosVariante(productos_variante_codigo);


--Compra

	alter table  UBUNTEAM_THE_SQL.Compra  
	add 
		constraint PK_Compra primary key (compra_numero),
		constraint FK_Proveedor foreign key ( compra_proveedor) references UBUNTEAM_THE_SQL.Proveedor(proveedor_cuit),
		constraint FK_Compra_MedioDePago foreign key ( compra_medio_pago) references UBUNTEAM_THE_SQL.MedioDePago(medio_pago_codigo);


--ProductoPorCompra

	alter table  UBUNTEAM_THE_SQL.ProductoPorCompra  
	add 
		constraint PK_ProductoPorCompra primary key (compra_numero,prod_por_var_prod_codigo,prod_por_var_var_codigo),
		constraint FK_Producto_Por_Compra_Compra foreign key ( compra_numero) references UBUNTEAM_THE_SQL.Compra(compra_numero),
		constraint FK_Producto_Por_Variante_Compra foreign key ( productos_variante_codigo) references UBUNTEAM_THE_SQL.ProductosVariante(productos_variante_codigo);


--Proveedor
	alter table  UBUNTEAM_THE_SQL.Proveedor  
	add 
		constraint PK_Proveedor primary key (proveedor_cuit),
		constraint FK_Proveedor_Localidad foreign key (proveedor_localidad) references UBUNTEAM_THE_SQL.Localidad(loc_codigo);


--DescuentoPorVenta

	alter table  UBUNTEAM_THE_SQL.DescuentoPorVenta  
	add 
		constraint PK_Descuento_Venta primary key (venta_codigo),
		constraint FK_Descuento_Venta foreign key (venta_codigo) references UBUNTEAM_THE_SQL.Venta(venta_codigo),
		constraint FK_Concepto_Descuento foreign key (desc_concepto) references UBUNTEAM_THE_SQL.ConceptoDescuento(concepto_codigo);


--ConceptoDescuento

	alter table  UBUNTEAM_THE_SQL.ConceptoDescuento  
	add 
		constraint PK_Concepto_Descuento primary key (concepto_codigo);


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