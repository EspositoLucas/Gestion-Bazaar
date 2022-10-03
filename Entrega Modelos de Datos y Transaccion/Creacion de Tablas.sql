use GD2C2022 ;

-- Creacion de Tablas - Constraints, Claves PK y FK , Indices


--Cliente

create table Cliente(
	clie_codigo char(6) NOT NULL ,
	clie_nombre nvarchar(255) NULL,
	clie_dni decimal(18,0) NULL,
	clie_cod_postal_codigo decimal(18, 0) NULL,
	clie_provincia nvarchar(255) NULL,
	clie_apellido nvarchar(255) NULL,
	clie_fecha_nac date NULL,
	clie_localidad nvarchar(255)NULL,
	clie_mail nvarchar(255) NULL,
	clie_direccion nvarchar(255),
	clie_telefono char(100) NULL
	) ;
	alter schema UBUNTEAM_THE_SQL transfer Cliente ;


	alter table  UBUNTEAM_THE_SQL.Cliente  add constraint PK_Cliente primary key ( clie_codigo);

	alter table UBUNTEAM_THE_SQL.Cliente alter column clie_localidad nvarchar(255) NOT NULL

	alter table  UBUNTEAM_THE_SQL.Cliente  add constraint FK_Cliente_Localidad foreign key (clie_localidad) references UBUNTEAM_THE_SQL.Localidad(loc_codigo);


--Localidad 

create table Localidad(
	loc_codigo nvarchar(255) NOT NULL,
	loc_descripcion nvarchar(50)NULL,
	prov_codigo nvarchar(255) NOT NULL

);

	alter schema UBUNTEAM_THE_SQL transfer Localidad ;

	alter table  UBUNTEAM_THE_SQL.Localidad  add constraint PK_Localidad primary key ( loc_codigo);

	alter table  UBUNTEAM_THE_SQL.Localidad  add constraint FK_Provincia foreign key ( prov_codigo) references UBUNTEAM_THE_SQL.Provincia(prov_codigo);


--Provincia

create table Provincia(
	prov_codigo nvarchar(255) NOT NULL,
	prov_descripcion nvarchar(50)NULL,

);

	alter schema UBUNTEAM_THE_SQL transfer Provincia ;

	alter table  UBUNTEAM_THE_SQL.Provincia  add constraint PK_Provincia primary key ( prov_codigo);


-- Venta

create table Venta(
	venta_codigo decimal(19,0) NOT NULL,
	venta_fecha date NULL,
	venta_cliente char(6) NOT NULL,
	venta_total decimal(18,2) NULL,
	venta_canal nvarchar(2255) NOT NULL,
	venta_medio_de_pago numeric(6) NOT NULL,
	venta_envio numeric(6) NOT NULL

);

	alter schema UBUNTEAM_THE_SQL transfer Venta ;

	alter table  UBUNTEAM_THE_SQL.Venta  add constraint PK_Venta primary key ( venta_codigo);

	alter table  UBUNTEAM_THE_SQL.Venta  add constraint FK_Cliente foreign key ( venta_cliente) references UBUNTEAM_THE_SQL.Cliente(clie_codigo);
	alter table  UBUNTEAM_THE_SQL.Venta  add constraint FK_Canal foreign key ( venta_canal) references UBUNTEAM_THE_SQL.Canal(canal_codigo);
	alter table  UBUNTEAM_THE_SQL.Venta  add constraint FK_MedioDePago foreign key ( venta_medio_de_pago) references UBUNTEAM_THE_SQL.medioDePago(medio_pago_codigo);
	alter table  UBUNTEAM_THE_SQL.Venta  add constraint FK_Envio foreign key ( venta_envio) references UBUNTEAM_THE_SQL.Envio(envio_codigo);
	 

-- Canal

create table Canal(
	canal_codigo nvarchar(2255) NOT NULL,
	canal_costo decimal(18,2) NULL,
	canal_descripcion nvarchar(50)

);


alter schema UBUNTEAM_THE_SQL transfer Canal ;

alter table  UBUNTEAM_THE_SQL.Canal  add constraint PK_Canal primary key ( canal_codigo);


--Medio De Pago

create table MedioDePago(
	medio_pago_codigo numeric(6) NOT NULL,
	medio_nombre nvarchar(255) NULL,
	medio_costo decimal(18,2) NULL,
	medio_porcentaje decimal(18,2) NULL

);

alter schema UBUNTEAM_THE_SQL transfer MedioDePago ;

alter table  UBUNTEAM_THE_SQL.MedioDepago  add constraint PK_MedioDePago primary key (medio_pago_codigo);


-- Envio

create table Envio(
	envio_codigo numeric(6) NOT NULL,
	envio_medio nvarchar(255) NULL,
	envio_precio decimal(18,2) NULL,
	envio_tiempo_estimado smalldatetime NULL
	 
);

alter schema UBUNTEAM_THE_SQL transfer Envio ;

alter table  UBUNTEAM_THE_SQL.Envio  add constraint PK_Envio primary key (envio_codigo);



--Producto

create table Producto(
	prod_codigo nvarchar(50) NOT NULL,
	prod_descripcion nvarchar NULL,
	prod_categoria nvarchar(255)NULL,
	prod_variante nvarchar(50) NOT NULL,
	prod_cantidad decimal(12,2) NULL,
	prod_precio decimal(12,2) NULL,
	prod_total decimal(12,2) NULL,
	prod_nombre nvarchar(50) NULL,
	prod_material nvarchar(50) NULL,
	prod_marca nvarchar(255)


);

alter schema UBUNTEAM_THE_SQL transfer Producto ;

alter table  UBUNTEAM_THE_SQL.Producto  add constraint PK_Producto primary key (prod_codigo);

alter table  UBUNTEAM_THE_SQL.Producto  add constraint FK_Categoria foreign key ( prod_categoria) references UBUNTEAM_THE_SQL.Categoria(categoria_codigo);

alter table UBUNTEAM_THE_SQL.Producto alter column prod_categoria nvarchar(50) NOT NULL

alter table UBUNTEAM_THE_SQL.Producto alter column prod_variante nvarchar(50) NULL



--Categoria

create table Categoria(
	categoria_codigo nvarchar(50) NOT NULL,
	var_descripcion nvarchar(50)NULL
);

alter schema UBUNTEAM_THE_SQL transfer Categoria ;

alter table  UBUNTEAM_THE_SQL.Categoria  add constraint PK_Categoria primary key (categoria_codigo);


--Variante

create table Variante(
	var_codigo nvarchar(50) NOT NULL,
	var_descripcion nvarchar(50) NULL,
	var_tipo nvarchar(50) NOT NULL

);

alter schema UBUNTEAM_THE_SQL transfer Variante ;

alter table  UBUNTEAM_THE_SQL.Variante  add constraint PK_Variante primary key (var_codigo);

alter table UBUNTEAM_THE_SQL.Variante alter column var_tipo nvarchar(50) NOT NULL

alter table  UBUNTEAM_THE_SQL.Variante  add constraint FK_Tipo_Variante foreign key ( var_tipo) references UBUNTEAM_THE_SQL.TipoVariante(tipo_var_codigo);


--TipoVariante

create table TipoVariante(
	tipo_var_codigo nvarchar(50) NOT NULL,
	tipo_var_descripcion nvarchar(50)
);

alter schema UBUNTEAM_THE_SQL transfer TipoVariante ;

alter table  UBUNTEAM_THE_SQL.TipoVariante  add constraint PK_Tipo_Variante primary key (tipo_var_codigo);


--ProductoPorVariante

create table ProductoPorVariante(
	prod_codigo nvarchar(50) NOT NULL,
	var_codigo nvarchar(50)NOT NULL,
	prod_variante_precio decimal(18,0) NULL
);

alter schema UBUNTEAM_THE_SQL transfer ProductoPorVariante ;

alter table  UBUNTEAM_THE_SQL.ProductoPorVariante  add constraint PK_Producto_Por_Variante primary key (prod_codigo,var_codigo);

alter table  UBUNTEAM_THE_SQL.ProductoPorVariante  add constraint FK_Prod_Var_Variante foreign key ( var_codigo) references UBUNTEAM_THE_SQL.Variante(var_codigo);
alter table  UBUNTEAM_THE_SQL.ProductoPorVariante  add constraint FK_Prod_Var_Producto foreign key ( prod_codigo) references UBUNTEAM_THE_SQL.Producto(prod_codigo);


-- ProductoPorVenta

create table ProductoPorVenta(
	venta_codigo decimal(19,0) NOT NULL,
	prod_codigo nvarchar(50) NOT NULL,
	prod_venta_precio decimal(12,2) NULL,
	prod_venta_cantidad decimal(12,2) NULL

);

alter schema UBUNTEAM_THE_SQL transfer ProductoPorVenta ;

alter table  UBUNTEAM_THE_SQL.ProductoPorVenta  add constraint PK_ProductoPorVenta primary key (venta_codigo,prod_por_var_prod_codigo,prod_por_var_var_codigo);


alter table  UBUNTEAM_THE_SQL.ProductoPorVenta  add constraint FK_Venta foreign key ( venta_codigo) references UBUNTEAM_THE_SQL.Venta(venta_codigo);
alter table  UBUNTEAM_THE_SQL.ProductoPorVenta  add constraint FK_Producto_Prod_Var foreign key ( prod_por_var_prod_codigo) references UBUNTEAM_THE_SQL.ProductoPorVariante(prod_codigo);
alter table  UBUNTEAM_THE_SQL.ProductoPorVenta  add constraint FK_Variante_Prod_Var foreign key ( prod_por_var_var_codigo) references UBUNTEAM_THE_SQL.ProductoPorVariante(var_codigo);


alter table UBUNTEAM_THE_SQL.ProductoPorVenta drop constraint PK_ProductoPorVenta

alter table UBUNTEAM_THE_SQL.ProductoPorVenta add prod_por_var_prod_codigo nvarchar(50) NOT NULL

alter table UBUNTEAM_THE_SQL.ProductoPorVenta add prod_por_var_var_codigo nvarchar(50) NOT NULL

alter table UBUNTEAM_THE_SQL.ProductoPorVenta drop prod_codigo


--Compra

create table Compra(
	compra_numero decimal(19,0) NOT NULL,
	compra_fecha date NULL,
	compra_proveedor nvarchar(50) NOT NULL,
	compra_total decimal(18,2) NULL,
	compra_medio_pago nvarchar(255) NULL

);

alter schema UBUNTEAM_THE_SQL transfer Compra ;

alter table  UBUNTEAM_THE_SQL.Compra  add constraint PK_Compra primary key (compra_numero);


alter table  UBUNTEAM_THE_SQL.Compra  add constraint FK_Proveedor foreign key ( compra_proveedor) references UBUNTEAM_THE_SQL.Proveedor(proveedor_cuit);
alter table  UBUNTEAM_THE_SQL.Compra  add constraint FK_Compra_MedioDePago foreign key ( compra_medio_pago) references UBUNTEAM_THE_SQL.MedioDePago(medio_pago_codigo);


alter table UBUNTEAM_THE_SQL.Compra alter column compra_medio_pago numeric(6) NOT NULL


--ProductoPorCompra

create table ProductoPorCompra(
	compra_numero decimal(19,0) NOT NULL,
	prod_codigo nvarchar(50) NOT NULL,
	prod_compra_precio decimal(18,0) NULL,
	prod_compra_cantidad decimal(18,2) NULL

);


alter schema UBUNTEAM_THE_SQL transfer ProductoPorCompra ;

alter table  UBUNTEAM_THE_SQL.ProductoPorCompra  add constraint PK_ProductoPorCompra primary key (compra_numero,prod_por_var_prod_codigo,prod_por_var_var_codigo);

alter table  UBUNTEAM_THE_SQL.ProductoPorCompra  add constraint FK_Compra foreign key ( compra_numero) references UBUNTEAM_THE_SQL.Compra(compra_numero);
alter table  UBUNTEAM_THE_SQL.ProductoPorCompra  add constraint FK_Producto_Prod_Var foreign key ( prod_por_var_prod_codigo) references UBUNTEAM_THE_SQL.ProductoPorVariante(prod_codigo);
alter table  UBUNTEAM_THE_SQL.ProductoPorCompra  add constraint FK_Variante_Prod_Var foreign key ( prod_por_var_var_codigo) references UBUNTEAM_THE_SQL.ProductoPorVariante(var_codigo);

alter table UBUNTEAM_THE_SQL.ProductoPorCompra add prod_por_var_prod_codigo nvarchar(50) NOT NULL

alter table UBUNTEAM_THE_SQL.ProductoPorCompra add prod_por_var_var_codigo nvarchar(50) NOT NULL

alter table UBUNTEAM_THE_SQL.ProductoPorCompra drop constraint FK_Producto_Compra


--Proveedor

create table Proveedor(
	proveedor_cuit nvarchar(50) NOT NULL,
	proveedor_razon_social nvarchar(50) NULL,
	proveedor_domicilio nvarchar(50) NULL,
	proveedor_telefono decimal(18,0) NULL,
	proveedor_cod_postal_codigo decimal(18, 0) NULL,
	proveedor_mail nvarchar(50) NULL,
	proveedor_localidad nvarchar(255) NULL,
	proveedor_provincia nvarchar(255) NULL

);


	alter schema UBUNTEAM_THE_SQL transfer Proveedor ;

	alter table  UBUNTEAM_THE_SQL.Proveedor  add constraint PK_Proveedor primary key (proveedor_cuit);

	alter table UBUNTEAM_THE_SQL.Proveedor drop proveedor_provincia

	alter table UBUNTEAM_THE_SQL.Proveedor alter column proveedor_localidad nvarchar(255) NOT NULL

	alter table  UBUNTEAM_THE_SQL.Proveedor  add constraint FK_Proveedor_Localidad foreign key (proveedor_localidad) references UBUNTEAM_THE_SQL.Localidad(loc_codigo);


--DescuentoPorVenta

create table DescuentoPorVenta(
	venta_codigo decimal(19,0) NOT NULL,
	desc_venta_importe decimal(18,2) NULL,
	desc_concepto nvarchar(255) NULL,
	desc_tipo nvarchar(50)NULL

);

alter schema UBUNTEAM_THE_SQL transfer DescuentoPorVenta ;

alter table  UBUNTEAM_THE_SQL.DescuentoPorVenta  add constraint PK_Descuento_Venta primary key (venta_codigo);
alter table  UBUNTEAM_THE_SQL.DescuentoPorVenta  add constraint FK_Descuento_Venta foreign key (venta_codigo) references UBUNTEAM_THE_SQL.Venta(venta_codigo);
alter table  UBUNTEAM_THE_SQL.DescuentoPorVenta  add constraint FK_Concepto_Descuento foreign key (desc_concepto) references UBUNTEAM_THE_SQL.ConceptoDescuento(concepto_codigo);
alter table  UBUNTEAM_THE_SQL.DescuentoPorVenta add desc_concepto numeric(6) NOT NULL


--ConceptoDescuento

create table ConceptoDescuento(
	concepto_codigo numeric(6) NOT NULL,
	concepto_tipo nvarchar(255) NULL
);

alter schema UBUNTEAM_THE_SQL transfer ConceptoDescuento ;
alter table  UBUNTEAM_THE_SQL.ConceptoDescuento  add constraint PK_Concepto_Descuento primary key (concepto_codigo);



--DescuentoPorCompra

create table DescuentoPorCompra(
	compra_numero decimal(19,0) NOT NULL,
	desc_compra_valor decimal(18,2) NULL

);

alter schema UBUNTEAM_THE_SQL transfer DescuentoPorCompra ;

alter table  UBUNTEAM_THE_SQL.DescuentoPorCompra  add constraint PK_Descuento_Compra primary key (compra_numero);

alter table  UBUNTEAM_THE_SQL.DescuentoPorCompra  add constraint FK_Descuento_Compra foreign key (compra_numero) references UBUNTEAM_THE_SQL.Compra(compra_numero);


--Cupon

create table Cupon(
	cupon_codigo nvarchar(255) NOT NULL,
	cupon_valor decimal(18,2) NULL,
	cupon_fecha_desde date NULL,
	cupon_fecha_hasta date NULL,
	cupon_tipo nvarchar(50)NULL


);

alter schema UBUNTEAM_THE_SQL transfer Cupon ;

alter table  UBUNTEAM_THE_SQL.Cupon  add constraint PK_Cupon primary key (cupon_codigo);


--VentaPorCupon

create table VentaPorCupon (
	venta_codigo decimal(19,0) NOT NULL,
	cupon_codigo nvarchar(255) NOT NULL,
	venta_cupon_importe decimal(18,2)NULL


);

alter schema UBUNTEAM_THE_SQL transfer VentaPorCupon ;

alter table  UBUNTEAM_THE_SQL.VentaPorCupon  add constraint PK_Venta_Por_Cupon primary key (venta_codigo,cupon_codigo);

alter table  UBUNTEAM_THE_SQL.VentaPorCupon  add constraint FK_Venta_Cupon foreign key (venta_codigo) references UBUNTEAM_THE_SQL.Venta(venta_codigo);
alter table  UBUNTEAM_THE_SQL.VentaPorCupon  add constraint FK_Cupon_Venta foreign key (cupon_codigo) references UBUNTEAM_THE_SQL.Cupon(cupon_codigo);