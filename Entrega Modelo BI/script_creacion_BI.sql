
use GD2C2022 ;

GO

PRINT '**** Comenzando carga BI  ****';
GO

DECLARE @DropConstraints NVARCHAR(max) = ''

SELECT @DropConstraints += 'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) + '.'

                        +  QUOTENAME(OBJECT_NAME(parent_object_id)) + ' ' + 'DROP CONSTRAINT' + QUOTENAME(name)

FROM sys.foreign_keys

EXECUTE sp_executesql @DropConstraints;

PRINT '**** CONSTRAINTs BI dropeadas correctamente ****';

GO

/*
DECLARE @DropTables NVARCHAR(max) = ''

SELECT @DropTables += 'DROP TABLE UBUNTEAM_THE_SQL. ' + QUOTENAME(TABLE_NAME)

FROM INFORMATION_SCHEMA.TABLES

WHERE TABLE_SCHEMA = 'UBUNTEAM_THE_SQL' and TABLE_TYPE = 'BASE TABLE'

EXECUTE sp_executesql @DropTables;

PRINT '**** TABLAS dropeadas correctamente ****';

GO

*/

/********* Drop de Tablas *********/

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Dimension_Cliente')
	DROP TABLE UBUNTEAM_THE_SQL.Dimension_Cliente;

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Dimension_Provincia')
	DROP TABLE UBUNTEAM_THE_SQL.Dimension_Provincia;

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Dimension_MedioEnvioPorProvincia')
	DROP TABLE UBUNTEAM_THE_SQL.Dimension_MedioEnvioPorProvincia;

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Hechos_Ventas')
	DROP TABLE UBUNTEAM_THE_SQL.Hechos_Ventas;

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Dimension_Canal')
	DROP TABLE UBUNTEAM_THE_SQL.Dimension_Canal;

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Dimension_MedioDePago')
	DROP TABLE UBUNTEAM_THE_SQL.Dimension_MedioDePago;

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Dimension_MedioEnvio')
	DROP TABLE UBUNTEAM_THE_SQL.Dimension_MedioEnvio;

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Dimension_Producto')
	DROP TABLE UBUNTEAM_THE_SQL.Dimension_Producto;

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Dimension_Categoria')
	DROP TABLE UBUNTEAM_THE_SQL.Dimension_Categoria;

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Hechos_Compras')
	DROP TABLE UBUNTEAM_THE_SQL.Hechos_Compras;

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Dimension_Proveedor')
	DROP TABLE UBUNTEAM_THE_SQL.Dimension_Proveedor;

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Dimension_TipoDescuento')
	DROP TABLE UBUNTEAM_THE_SQL.Dimension_TipoDescuento;

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Dimension_Tiempo')
	DROP TABLE UBUNTEAM_THE_SQL.Dimension_Tiempo;

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Hechos_Descuentos')
	DROP TABLE UBUNTEAM_THE_SQL.Hechos_Descuentos;

PRINT '**** Tablas BI dropeadas correctamente ****';

go

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


IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Dimension_MediosEnvioPorProvincia')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Dimension_MediosEnvioPorProvincia;
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

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Dimension_Tiempo')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Dimension_Tiempo;
go

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Hechos_Descuentos')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Hechos_Descuentos;
go


PRINT '**** SPs BI dropeados correctamente ****';

go





/********* Drop de Vistas *********/

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_BI_Canal_Ventas_Ganancias_Mensuales')
	DROP VIEW UBUNTEAM_THE_SQL.v_BI_Canal_Ventas_Ganancias_Mensuales;

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_BI_Productos_Con_Mayor_Rentabilidad')
	DROP VIEW UBUNTEAM_THE_SQL.v_BI_Productos_Con_Mayor_Rentabilidad;

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_BI_Categorias_Mas_Vendidas')
	DROP VIEW UBUNTEAM_THE_SQL.v_BI_Categorias_Mas_Vendidas;

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_BI_Ingresos_Por_Medio_De_Pago')
	DROP VIEW UBUNTEAM_THE_SQL.v_BI_Ingresos_Por_Medio_De_Pago;

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_BI_Importe_Total_Descuentos')
	DROP VIEW UBUNTEAM_THE_SQL.v_BI_Importe_Total_Descuentos;

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_BI_Valor_Promedio_Envio_Por_Provincia')
	DROP VIEW UBUNTEAM_THE_SQL.v_BI_Valor_Promedio_Envio_Por_Provincia;

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_BI_Aumento_Promedio_De_Precios')
	DROP VIEW UBUNTEAM_THE_SQL.v_BI_Aumento_Promedio_De_Precios;

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_BI_Productos_Con_Mayor_Reposicion')
	DROP VIEW UBUNTEAM_THE_SQL.v_BI_Productos_Con_Mayor_Reposicion;

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_BI_Porcentaje_Envios_Por_Provincia')
	DROP VIEW UBUNTEAM_THE_SQL.v_BI_Porcentaje_Envios_Por_Provincia;


PRINT '**** Vistas BI dropeadas correctamente ****';

GO
/********* Drop de Schema *********/

/*
if exists (select name from sys.schemas where name = 'UBUNTEAM_THE_SQL')
	drop schema UBUNTEAM_THE_SQL;
go
*/

/********* Creacion de Schema *********/
/*
create schema UBUNTEAM_THE_SQL;
go

*/
/********* Creacion de Tablas *********/


--Cliente

create table UBUNTEAM_THE_SQL.Dimension_Cliente(
	Id int identity  ,
	clie_nombre nvarchar(255) NOT NULL,
	clie_dni decimal(18,0) NOT NULL,
	Id_provincia int NOT NULL,
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


create table UBUNTEAM_THE_SQL.Dimension_MedioEnvioPorProvincia(
	Id int identity ,
	Id_medio_envio int  NOT NULL,
	Id_provincia int  NOT NULL,
	medio_envio_precio decimal(18,2),
	 
); 


-- Ventas

create table UBUNTEAM_THE_SQL.Hechos_Ventas(
	Id int identity ,
	Id_cliente int NOT NULL,
	Id_canal int NOT NULL,
	Id_medio_de_pago int NOT NULL,
	Id_medio_envio_provincia int NOT NULL,
	id_tiempo int NOT NULL,
	id_producto int NOT NULL,
	venta_codigo decimal(19,0) NOT NULL,
	venta_fecha date ,
	venta_total decimal(18,2) ,
	venta_envio_precio decimal(18,2),
	venta_canal_costo decimal(18,2) ,
	venta_medio_de_pago_costo decimal(18,2),
	venta_producto_precio decimal(18,2),
	venta_producto_cantidad decimal(12,2),

	 

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




--Compras

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
	compra_producto_cantidad decimal(18,2),
	desc_compra_valor decimal(18,2)

);


--Descuentos

create table UBUNTEAM_THE_SQL.Hechos_Descuentos(
	Id_venta int,
	Id_tipo_descuento int,
	desc_importe decimal(18,2)

);

--Proveedor

create table UBUNTEAM_THE_SQL.Dimension_Proveedor(
	Id int identity,
	proveedor_cuit nvarchar(50) NOT NULL,
	proveedor_razon_social nvarchar(50) ,
	proveedor_domicilio nvarchar(50) ,
	id_provincia int NOT NULL,
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



print '**** Tablas BI creadas correctamente ****';

go



/********* Creacion de Constraints/PKs/FKs *********/




--Categoria

	alter table  UBUNTEAM_THE_SQL.Dimension_Categoria  
	add 
		constraint PK_BI_Categoria primary key (Id);


--MedioEnvio

	alter table  UBUNTEAM_THE_SQL.Dimension_MedioEnvio  
	add 
		constraint PK_BI_MedioEnvio primary key (Id);

--Canal 

	alter table  UBUNTEAM_THE_SQL.Dimension_Canal  
	add 
		constraint PK_BI_Canal primary key (Id);


--MedioDePago

	alter table  UBUNTEAM_THE_SQL.Dimension_MedioDePago  
	add 
		constraint PK_BI_MedioDePago primary key (Id);


--Provincia

	alter table  UBUNTEAM_THE_SQL.Dimension_Provincia
	add
		constraint PK_BI_Provincia primary key ( Id);


--Cliente

	alter table  UBUNTEAM_THE_SQL.Dimension_Cliente  
	add 
		constraint PK_BI_Cliente primary key ( Id),
	    constraint FK_BI_Cliente_Provincia foreign key (Id_provincia) references UBUNTEAM_THE_SQL.Dimension_Provincia(Id);


--MedioEnvioPorProvincia



	alter table  UBUNTEAM_THE_SQL.Dimension_MedioEnvioPorProvincia
	add 
		constraint PK_BI_MedioEnvioPorProvincia primary key (Id),
		constraint FK_BI_Medio_Envio foreign key (Id_medio_envio) references UBUNTEAM_THE_SQL.Dimension_MedioEnvio(Id),
		constraint FK_BI_Medio_Envio_Provincia foreign key ( Id_provincia) references UBUNTEAM_THE_SQL.Dimension_Provincia(Id);




--Producto

	alter table  UBUNTEAM_THE_SQL.Dimension_Producto  
	add 
		constraint PK_BI_Producto primary key (Id),
		constraint UC_BI_Producto_Codigo unique (prod_codigo),
		constraint FK_BI_Categoria foreign key ( Id_categoria) references UBUNTEAM_THE_SQL.Dimension_Categoria(Id);


--Tiempo

	alter table  UBUNTEAM_THE_SQL.Dimension_Tiempo 
	add 
		constraint PK_BI_Tiempo primary key (Id);


--Tipo Descuento

	alter table  UBUNTEAM_THE_SQL.Dimension_TipoDescuento  
	add 
		constraint PK_BI_Tipo_Descuento primary key (Id);


--Ventas

	alter table  UBUNTEAM_THE_SQL.Hechos_Ventas 
	add 
		constraint PK_BI_Venta primary key ( Id),
		constraint UC_BI_Venta_Codigo unique (venta_codigo),
		constraint FK_BI_Venta_Cliente foreign key ( Id_cliente) references UBUNTEAM_THE_SQL.Dimension_Cliente(Id),
		constraint FK_BI_Venta_Canal foreign key ( Id_canal) references UBUNTEAM_THE_SQL.Dimension_Canal(Id),
		constraint FK_BI_Venta_MedioDePago foreign key ( Id_medio_de_pago) references UBUNTEAM_THE_SQL.Dimension_MedioDePago(Id),
		constraint FK_BI_Venta_Medio_Envio_Por_Provincia foreign key ( Id_medio_envio_provincia) references UBUNTEAM_THE_SQL.Dimension_MedioEnvioPorProvincia(Id),
		constraint FK_BI_Tiempo_Venta foreign key ( id_tiempo) references UBUNTEAM_THE_SQL.Dimension_Tiempo(Id),
		constraint FK_BI_Producto_Venta foreign key ( id_producto) references UBUNTEAM_THE_SQL.Dimension_Producto(Id);


--Proveedor

	alter table  UBUNTEAM_THE_SQL.Dimension_Proveedor  
	add 
		constraint PK_BI_Proveedor primary key (Id),
		constraint UC_BI_proveedor_Cuit unique (proveedor_cuit),
		constraint FK_BI_Proveedor_Provincia foreign key (Id_provincia) references UBUNTEAM_THE_SQL.Dimension_Provincia(Id);


--Compras

	alter table  UBUNTEAM_THE_SQL.Hechos_Compras  
	add 
		constraint PK_BI_Compra primary key (Id),
		constraint UC_BI_Compra_Numero unique (compra_numero),
		constraint FK_BI_Proveedor foreign key ( Id_proveedor) references UBUNTEAM_THE_SQL.Dimension_Proveedor(id),
		constraint FK_BI_Producto_Compra foreign key ( id_producto) references UBUNTEAM_THE_SQL.Dimension_Producto(Id),
		constraint FK_BI_Tiempo_Compra foreign key ( id_tiempo) references UBUNTEAM_THE_SQL.Dimension_Tiempo(Id),
		constraint FK_BI_Compra_MedioDePago foreign key ( Id_medio_pago) references UBUNTEAM_THE_SQL.Dimension_MedioDePago(Id);

--Descuentos

	alter table  UBUNTEAM_THE_SQL.Hechos_Descuentos
	add 

		constraint FK_BI_Hechos_Ventas foreign key ( Id_venta) references UBUNTEAM_THE_SQL.Hechos_Ventas,
		constraint FK_BI_Tipo_Descuento foreign key ( Id_tipo_descuento) references UBUNTEAM_THE_SQL.Dimension_TipoDescuento;



print '**** CONSTRAINTs BI creadas correctamente ****';

go

/********* Creacion de Vistas *********/


-- Ganancias Mensuales


create view UBUNTEAM_THE_SQL.v_BI_Canal_Ventas_Ganancias_Mensuales
as
	
	select DC.canal_descripcion,
		   DT.mes,
			HV.venta_medio_de_pago_costo costo_transaccion_medio_de_pago,
			sum(HV.venta_total) - sum(HC.compra_total) - sum(HV.venta_medio_de_pago_costo) ganancias
			

	from UBUNTEAM_THE_SQL.Hechos_Ventas HV
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on HV.id_tiempo  = DT.Id
	join UBUNTEAM_THE_SQL.Dimension_Canal DC on DC.Id = HV.Id_canal 
	join UBUNTEAM_THE_SQL.Dimension_MedioDePago DM on DM.Id = HV.Id_medio_de_pago
	join UBUNTEAM_THE_SQL.Hechos_Compras HC on HC.Id_medio_pago =DM.Id

	group by canal_descripcion,HV.venta_medio_de_pago_costo,DT.mes


go

--Productos Con Mayor Rentabilidad

create view UBUNTEAM_THE_SQL.v_BI_Productos_Con_Mayor_Rentabilidad
as
	
	select top 5 DP.prod_codigo,
				 DP.prod_descripcion,
				 (str(DT1.anio) + str(DT1.mes)) periodo_venta ,
				 (str(DT2.anio) + str(DT2.mes)) periodo_compra,
				( 100 * (sum(HV.venta_producto_precio * HV.venta_producto_cantidad) - sum(HC.compra_producto_precio * HC.compra_producto_cantidad))
				/ (sum(HV.venta_producto_precio * HV.venta_producto_cantidad) + sum (HC.compra_producto_precio * HC.compra_producto_cantidad))) rentabilidad

	from UBUNTEAM_THE_SQL.Hechos_Ventas HV
	join UBUNTEAM_THE_SQL.Dimension_Producto DP on  HV.id_producto = DP.Id
	join UBUNTEAM_THE_SQL.Hechos_Compras HC on HC.id_producto = HV.id_producto
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT1 on DT1.Id = HV.id_tiempo 
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT2 on DT2.Id = HC.id_tiempo

	group by  DP.prod_codigo,DP.prod_descripcion, DT1.anio,DT1.mes,DT2.anio,DT2.mes
	order by rentabilidad desc
go

--Categorias mas vendidas

create view UBUNTEAM_THE_SQL.v_BI_Categorias_Mas_Vendidas
as
	
	select top 5 DC.categoria_descripcion,
				case when DCL.clie_edad < 25 then 'Menor a 25'
				  when DCL.clie_edad between 25 and 35 then 'Entre 25 y 35' 
				  when DCL.clie_edad between 35 and 55 then 'Entre 35 y 55'
				  when DCL.clie_edad > 55 then 'Mayor a 55' end rango_etario,
				 DT.mes	,
				 sum(HV.venta_producto_cantidad) cant_total_vendida	

	from UBUNTEAM_THE_SQL.Hechos_Ventas HV

	join UBUNTEAM_THE_SQL.Dimension_Cliente DCL on DCL.Id = HV.Id_cliente
	join UBUNTEAM_THE_SQL.Dimension_Producto DP on  HV.id_producto = DP.Id
	join UBUNTEAM_THE_SQL.Dimension_Categoria DC on DC.Id = DP.Id_categoria
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on DT.Id = HV.id_tiempo


	group by  DC.categoria_descripcion,DCL.clie_edad,DT.mes
	order by cant_total_vendida desc

go

--Ingresos por Medio de Pago

create view UBUNTEAM_THE_SQL.v_BI_Ingresos_Por_Medio_De_Pago
as
	select DM.medio_pago_descripcion,
				 DT.mes,
				 sum(HV.venta_total) -  sum(HV.venta_medio_de_pago_costo) -
				(case when DTS.concepto_descripcion = 'Medio de pago' then  sum(HD.desc_importe)
				else 0 end) ingreso_total
		
			

	from UBUNTEAM_THE_SQL.Hechos_Ventas HV
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on DT.Id = HV.id_tiempo
	join UBUNTEAM_THE_SQL.Dimension_MedioDePago DM on DM.Id = HV.Id_medio_de_pago
	join UBUNTEAM_THE_SQL.Hechos_Descuentos HD on HD.Id_venta = HV.Id
	join UBUNTEAM_THE_SQL.Dimension_TipoDescuento DTS on DTS.Id = HD.Id_tipo_descuento

	group by  DM.medio_pago_descripcion,DT.mes,DTS.concepto_descripcion
	
go



-- Importe Total Descuentos

create view UBUNTEAM_THE_SQL.v_BI_Importe_Total_Descuentos
as
	select HV.Id_canal canal,DT.mes mes,
	(select sum(HD2.desc_importe) from UBUNTEAM_THE_SQL.Hechos_Descuentos HD2
							join UBUNTEAM_THE_SQL.Dimension_TipoDescuento TD2 on TD2.Id =HD2.Id_tipo_descuento
							join UBUNTEAM_THE_SQL.Hechos_Ventas HV2 on (HD2.Id_venta = HV2.Id)
							join UBUNTEAM_THE_SQL.Dimension_Tiempo DT2 on DT2.Id=HV2.id_tiempo
	where TD2.concepto_descripcion = 'Medio de pago'AND HV2.Id_canal = HV.Id_canal and DT2.mes = DT.mes
	group by HV2.Id_canal,DT2.mes) 'Descuento por Medio de Pago' 
	
	,
	(select sum(HD3.desc_importe) from UBUNTEAM_THE_SQL.Hechos_Descuentos HD3
							join UBUNTEAM_THE_SQL.Dimension_TipoDescuento TD3 on TD3.Id =HD3.Id_tipo_descuento
							join UBUNTEAM_THE_SQL.Hechos_Ventas HV3 on (HD3.Id_venta = HV3.Id)
							join UBUNTEAM_THE_SQL.Dimension_Tiempo DT3 on DT3.Id=HV3.id_tiempo
	where TD3.concepto_descripcion = 'Cupon'AND HV3.Id_canal = HV.Id_canal and DT3.mes = DT.mes
	group by HV3.Id_canal,DT3.mes) 'Descuento por Cupon' ,
		

	(select sum(HD4.desc_importe) from UBUNTEAM_THE_SQL.Hechos_Descuentos HD4
							join UBUNTEAM_THE_SQL.Dimension_TipoDescuento TD4 on TD4.Id =HD4.Id_tipo_descuento
							join UBUNTEAM_THE_SQL.Hechos_Ventas HV4 on (HD4.Id_venta = HV4.Id)
							join UBUNTEAM_THE_SQL.Dimension_Tiempo DT4 on DT4.Id=HV4.id_tiempo
	where TD4.concepto_descripcion = 'Otros'AND HV4.Id_canal = HV.Id_canal and DT4.mes = DT.mes
	group by HV4.Id_canal,DT4.mes) 'Descuento Otros'


	from UBUNTEAM_THE_SQL.Hechos_Descuentos HD
	join UBUNTEAM_THE_SQL.Dimension_TipoDescuento TD on TD.Id =HD.Id_tipo_descuento
	join UBUNTEAM_THE_SQL.Hechos_Ventas HV on (HD.Id_venta = HV.Id)
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on DT.Id=HV.id_tiempo
	group by DT.mes,HV.Id_canal


go

-- Porcentaje de envios a cada prov por mes

create view UBUNTEAM_THE_SQL.v_BI_Porcentaje_Envios_Por_Provincia
as
	select distinct month(HV.venta_fecha) as mes, 
					P.prov_descripcion as provincia,
					format(round(cast(count(HV.Id_medio_envio_provincia) as decimal(7,2)) * 100 / 
					(select count(HV2.Id_medio_envio_provincia) 
					 from UBUNTEAM_THE_SQL.Hechos_Ventas HV2
					 where month(HV2.venta_fecha) = month(HV.venta_fecha)
					 group by month(HV2.venta_fecha)), 2), 'N2') as porcentaje_envios_del_mes
	from UBUNTEAM_THE_SQL.Hechos_Ventas HV
	join UBUNTEAM_THE_SQL.Dimension_MedioEnvioPorProvincia MEP on MEP.Id = HV.Id_medio_envio_provincia
	join UBUNTEAM_THE_SQL.Dimension_Provincia P on MEP.Id_provincia = P.Id
	group by month(HV.venta_fecha), P.prov_descripcion
go

-- Valor Promedio Envio por Provincia


create view UBUNTEAM_THE_SQL.v_BI_Valor_Promedio_Envio_Por_Provincia
as
	
	select DMP.Id_medio_envio medio_envio,
				DT.anio,
				DMP.Id_provincia,
				avg(DMP.medio_envio_precio) as promedio_envio_provincia		

	from UBUNTEAM_THE_SQL.Hechos_Ventas HV
	join UBUNTEAM_THE_SQL.Dimension_MedioEnvioPorProvincia DMP on HV.Id_medio_envio_provincia = DMP.id
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on DT.Id = HV.id_tiempo 

	group by  DMP.Id_medio_envio,DMP.Id_provincia, DT.anio

go


--Aumento promedio de Precios

create view UBUNTEAM_THE_SQL.v_BI_Aumento_Promedio_De_Precios
as
	
	select PV.Id proveedor,
				DT.anio,
				((max(HC.compra_producto_precio)-min(HC.compra_producto_precio))
				/min(HC.compra_producto_precio)) * 100 aumento_promedio

	from UBUNTEAM_THE_SQL.Hechos_Compras HC
	join UBUNTEAM_THE_SQL.Dimension_Proveedor PV on HC.Id_proveedor = PV.Id
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on DT.Id = HC.id_tiempo 

	group by  PV.Id, DT.anio

go


--Productos con Mayor Reposicion

create view UBUNTEAM_THE_SQL.v_BI_Productos_Con_Mayor_Reposicion
as
	
	select top 3 P.Id,
				 HC.compra_producto_cantidad,
				 DT.mes

	from UBUNTEAM_THE_SQL.Hechos_Compras HC
	join UBUNTEAM_THE_SQL.Dimension_Producto P on HC.id_producto = P.Id
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on DT.Id = HC.id_tiempo 

	group by  P.Id,HC.compra_producto_cantidad,DT.mes
	order by sum(HC.compra_producto_cantidad) desc

go


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
	select medio_descripcion
	from UBUNTEAM_THE_SQL.MedioEnvio
end
go



-- Canal

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Canales
as
begin 
	insert into UBUNTEAM_THE_SQL.Dimension_Canal(canal_descripcion,canal_costo)
	select canal_descripcion,canal_costo
	from UBUNTEAM_THE_SQL.Canal
end
go



-- MedioDePago

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_MediosDePago
as
begin 
	insert into UBUNTEAM_THE_SQL.Dimension_MedioDePago(medio_pago_descripcion,medio_costo_transaccion)
	select medio_pago_descripcion,medio_costo_transaccion
	from UBUNTEAM_THE_SQL.MedioDePago
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


create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Clientes
as
begin 

	insert into UBUNTEAM_THE_SQL.Dimension_Cliente(clie_nombre,clie_dni,Id_provincia,clie_telefono,clie_apellido,clie_fecha_nac,clie_direccion,clie_mail,clie_edad)

	select C.clie_nombre,C.clie_dni,(select P.Id from UBUNTEAM_THE_SQL.Localidad L
									join UBUNTEAM_THE_SQL.Provincia P on P.Id = L.Id_provincia
								    where C.Id_localidad= L.Id	),


			C.clie_telefono,C.clie_apellido,C.clie_fecha_nac,C.clie_direccion,C.clie_mail,(datediff(year,c.clie_fecha_nac,convert(date,getdate())))

	from UBUNTEAM_THE_SQL.Cliente C
end
go



--MedioEnvioPorProvincia



create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_MediosEnvioPorProvincia
as
begin 

	insert into UBUNTEAM_THE_SQL.Dimension_MedioEnvioPorProvincia(Id_medio_envio,Id_provincia,medio_envio_precio)
		select MEL.Id_medio_envio,
		(select L.Id_provincia
		from UBUNTEAM_THE_SQL.Localidad L															
		where MEL.Id_localidad = L.Id),
		MEL.medio_envio_precio

	from UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad MEL

end
go


--Ventas


create procedure UBUNTEAM_THE_SQL.Migrar_Hechos_Ventas
as
begin 

	insert into UBUNTEAM_THE_SQL.Hechos_Ventas(Id_cliente,Id_canal,Id_medio_de_pago,Id_medio_envio_provincia,
	id_tiempo,id_producto,venta_codigo,venta_fecha,venta_total,venta_envio_precio, venta_canal_costo,venta_medio_de_pago_costo,venta_producto_precio,
	venta_producto_cantidad)

	select (select C.Id from UBUNTEAM_THE_SQL.Dimension_Cliente C
										 where V.Id_cliente = C.Id),
										 
		(select Id from UBUNTEAM_THE_SQL.Dimension_Canal CA
		 where CA.Id = V.Id_canal),
		 (select Id from UBUNTEAM_THE_SQL.Dimension_MedioDePago MP
		 where MP.Id = V.Id_medio_de_pago ),
		 
		(select top 1 MEP.Id from UBUNTEAM_THE_SQL.Dimension_MedioEnvioPorProvincia MEP

		 where MEP.Id_medio_envio = (select MEL.Id_medio_envio from UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad MEL where MEL.Id = V.Id_medio_envio_por_localidad)

				and MEP.Id_provincia = (select Loc.Id_provincia from UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad MEL2
											join UBUNTEAM_THE_SQL.Localidad Loc on Loc.Id = MEL2.Id_localidad
										where MEL2.Id = V.Id_medio_envio_por_localidad)			
		),

		(select DT.Id from UBUNTEAM_THE_SQL.Dimension_Tiempo DT
			where DT.anio = year(V.venta_fecha) and DT.mes = month(V.venta_fecha)),
		

		(select top 1 P.Id from UBUNTEAM_THE_SQL.Dimension_Producto P
						join UBUNTEAM_THE_SQL.ProductoPorVariante PPV on PPV.producto_codigo = P.prod_codigo
						join UBUNTEAM_THE_SQL.ProductoPorVariantePorVenta PV on PV.Id_prod_var=PPV.Id
				where V.Id = PV.Id_venta),
	
		V.venta_codigo,V.venta_fecha,V.venta_total,

		V.venta_envio_precio,V.venta_canal_costo,V.venta_medio_de_pago_costo,
		
		(select top 1 PV2.precio_venta from UBUNTEAM_THE_SQL.ProductoPorVariantePorVenta PV2
																			  where PV2.Id_venta = V.Id),

		(select top 1 PV.prod_var_cantidad_venta from UBUNTEAM_THE_SQL.ProductoPorVariantePorVenta PV
																			  where PV.Id_venta = V.Id)
		
	from UBUNTEAM_THE_SQL.Venta V
end
go

--select * from UBUNTEAM_THE_SQL.Venta

create procedure UBUNTEAM_THE_SQL.Migrar_Hechos_Descuentos
as
begin 

	insert into UBUNTEAM_THE_SQL.Hechos_Descuentos(Id_venta,Id_tipo_descuento,desc_importe)
	select (select HV.Id  from UBUNTEAM_THE_SQL.Hechos_Ventas HV
			where HV.Id = V.Id),
		   (case when TD.concepto_descripcion = 'Efectivo' or TD.concepto_descripcion = 'Transeferencia'
			then (select DTP.Id from UBUNTEAM_THE_SQL.Dimension_TipoDescuento dtp
				  where DTP.concepto_descripcion ='Medio de Pago')
			else (select DTP.Id from UBUNTEAM_THE_SQL.Dimension_TipoDescuento dtp
				  where DTP.concepto_descripcion ='Otros') end),
		   DPV.desc_venta_importe
		
	from UBUNTEAM_THE_SQL.Venta V
	join  UBUNTEAM_THE_SQL.DescuentoPorVenta DPV on DPV.Id_venta =V.Id
	join  UBUNTEAM_THE_SQL.TipoDescuento TD on TD.Id = DPV.Id_tipo_descuento


	union

	select (select HV.Id  from UBUNTEAM_THE_SQL.Hechos_Ventas HV
			where HV.Id = V.Id),
		   (select DTP.Id from UBUNTEAM_THE_SQL.Dimension_TipoDescuento dtp
				  where DTP.concepto_descripcion ='Cupon'),
			VPC.venta_cupon_importe
		
	from UBUNTEAM_THE_SQL.Venta V
	join UBUNTEAM_THE_SQL.VentaPorCupon VPC on VPC.Id_venta = V.Id
	join UBUNTEAM_THE_SQL.Cupon C on C.Id =VPC.Id_cupon


end
go




--Producto

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Productos
as
begin
	insert into UBUNTEAM_THE_SQL.Dimension_Producto(prod_codigo,prod_descripcion,Id_categoria,prod_marca,prod_material,prod_nombre)
	
	select prod_codigo,prod_descripcion,(select CA.Id from UBUNTEAM_THE_SQL.Dimension_Categoria CA
										 where P.Id_categoria = CA.Id    ),prod_marca,prod_material,prod_nombre

	from UBUNTEAM_THE_SQL.Producto P
end
go




--Proveedor


create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Proveedores
as
begin
	insert into UBUNTEAM_THE_SQL.Dimension_Proveedor(proveedor_cuit, proveedor_razon_social, proveedor_domicilio,id_provincia, proveedor_mail)
	select PV.proveedor_cuit,PV.proveedor_razon_social,PV.proveedor_domicilio,
	(select P.Id from UBUNTEAM_THE_SQL.Localidad L
	join UBUNTEAM_THE_SQL.Provincia P on P.Id = L.Id_provincia
	where PV.id_localidad= L.Id	),
	PV.proveedor_mail


	from UBUNTEAM_THE_SQL.Proveedor PV
		
end
go


--Tiempo

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Tiempo
as
begin
	insert into UBUNTEAM_THE_SQL.Dimension_Tiempo(anio,mes)
	select year(venta_fecha), month(venta_fecha)
	

	from UBUNTEAM_THE_SQL.Venta

	union

	select year(compra_fecha), month(compra_fecha)
	

	from UBUNTEAM_THE_SQL.Compra

		
end
go


--Compras


create procedure UBUNTEAM_THE_SQL.Migrar_Hechos_Compras 
 as
 begin 	insert into UBUNTEAM_THE_SQL.Hechos_Compras( Id_proveedor,id_producto ,id_tiempo,Id_medio_pago,
 compra_numero, compra_fecha, compra_total ,compra_producto_precio,compra_producto_cantidad ,desc_compra_valor)

 select (select PV.Id from UBUNTEAM_THE_SQL.Dimension_Proveedor PV
		 where C.Id_proveedor = PV.Id),
		
		(select top 1 P.Id from UBUNTEAM_THE_SQL.Dimension_Producto P
						join UBUNTEAM_THE_SQL.ProductoPorVariante PPV on PPV.producto_codigo = P.prod_codigo
						join UBUNTEAM_THE_SQL.ProductoPorVariantePorCompra PVC on PVC.Id_prod_var = PPV.Id
		 where C.Id = PVC.Id_compra
		),
		
	
 		(select Id from UBUNTEAM_THE_SQL.Dimension_Tiempo DT
		 where DT.anio = year(C.compra_fecha) and DT.mes = month(C.compra_fecha)),
		 
		(select Id from UBUNTEAM_THE_SQL.Dimension_MedioDePago MP
		 where MP.Id = C.Id_medio_pago), 
	

 C.compra_numero,C.compra_fecha,C.compra_total,
 
(select top 1 PC.precio_compra from UBUNTEAM_THE_SQL.ProductoPorVariantePorCompra PC where PC.Id_compra = C.Id),
 
(select top 1 PC2.prod_var_cantidad_compra from UBUNTEAM_THE_SQL.ProductoPorVariantePorCompra PC2 where PC2.Id_compra = C.Id),

(select DC.desc_compra_valor from UBUNTEAM_THE_SQL.DescuentoPorCompra DC
		where DC.Id_compra = C.Id)
	
 from UBUNTEAM_THE_SQL.Compra C
		
end
go 

--TipoDescuento

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_TiposDeDescuento
 as
 begin 	insert into UBUNTEAM_THE_SQL.Dimension_TipoDescuento(concepto_descripcion)
		
		select distinct (case when TipoDescuento.concepto_descripcion = 'Efectivo' or TipoDescuento.concepto_descripcion = 'Transferencia'
				then 'Medio de pago' else 'Otros' end)

		from UBUNTEAM_THE_SQL.TipoDescuento


		union

		select top 1 'Cupon'

		from UBUNTEAM_THE_SQL.TipoDescuento


end
go 



print '**** SPs BI creados correctamente ****';

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
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_Tiempo;
	print '**** Migracion de Dimension_Tipos de Descuento Exitosa****';

	--Tablas con FKs a tablas que tienen FKs (tener cuidado porque aca s  importa el orden de EXEC de los SPs)

	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_Productos ;
	print '**** Migracion de Dimension_Productos Exitosa****';
	
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_MediosEnvioPorProvincia;
	print '**** Migracion de Dimension_Medios de Envio por Provincia Exitosa****';
	
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_Proveedores ;
	print '**** Migracion de Dimension_Proveedores Exitosa****';
	
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_Clientes;
	print '**** Migracion de Dimension_Clientes Exitosa****';
	
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Hechos_Compras;
	print '**** Migracion de Hechos_Compras Exitosa****';
	
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Hechos_Ventas;
	print '**** Migracion de Hechos_Ventas Exitosa****';

	EXECUTE UBUNTEAM_THE_SQL.Migrar_Hechos_Descuentos;
	print '**** Migracion de Hechos_Descuentos Exitosa****';

	--Tablas con FKs a tablas que no tienen FKs (van ahora porque ya se migraron las tablas sin FKs, que son de las que dependen estas tablas)




IF (
	EXISTS (SELECT  * FROM UBUNTEAM_THE_SQL.Dimension_Canal)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Categoria)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Cliente)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Proveedor)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Producto)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_MedioEnvio)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_MedioDePago)
	and EXISTS (SELECT  * FROM UBUNTEAM_THE_SQL.Dimension_MedioEnvioPorProvincia)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_TipoDescuento)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Provincia)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Hechos_Compras)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Hechos_Ventas)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Hechos_Descuentos)
	
)


	PRINT 'Tablas BI migradas correctamente.';