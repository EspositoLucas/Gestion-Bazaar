
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

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Dimension_Provincia')
	DROP TABLE UBUNTEAM_THE_SQL.Dimension_Provincia;

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

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Dimension_Rango_Etario_Cliente')
	DROP TABLE UBUNTEAM_THE_SQL.Dimension_Rango_Etario_Cliente;

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

IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'Migrar_Dimension_Rango_Etario_Cliente')
	DROP PROCEDURE UBUNTEAM_THE_SQL.Migrar_Dimension_Rango_Etario_Cliente;
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


--Rango Etario

create table UBUNTEAM_THE_SQL.Dimension_Rango_Etario_Cliente(
	Id int identity,
	rango_etario nvarchar(50)

);

--Provincia

create table UBUNTEAM_THE_SQL.Dimension_Provincia(
	Id int identity,
	prov_descripcion nvarchar(255)

);


-- Ventas

create table UBUNTEAM_THE_SQL.Hechos_Ventas(
	Id int identity ,
	Id_rango_etario int NOT NULL,
	Id_canal int NOT NULL,
	Id_medio_de_pago int NOT NULL,
	Id_medio_envio int NOT NULL, 
	Id_provincia int NOT NULL,
	id_tiempo int NOT NULL,
	id_producto int NOT NULL,
	venta_total decimal(18,2) ,
	venta_total_envio_precio decimal(18,2),
	venta_total_canal_costo decimal(18,2) ,
	venta_total_medio_de_pago_costo decimal(18,2),
	venta_producto_precio decimal(18,2),
	venta_producto_cantidad decimal(12,2)

);


-- Canal

create table UBUNTEAM_THE_SQL.Dimension_Canal(
	Id int identity,
	canal_descripcion nvarchar(2255)

);

--Medio De Pago

create table UBUNTEAM_THE_SQL.Dimension_MedioDePago(
	Id int identity,
	medio_pago_descripcion nvarchar(255)

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
	compra_total decimal(18,2),
	compra_producto_precio decimal(18,2),
	compra_producto_cantidad decimal(18,2)

);


--Descuentos

create table UBUNTEAM_THE_SQL.Hechos_Descuentos(
	Id_tiempo int,
	Id_tipo_descuento int,
	Id_canal int,
	desc_importe decimal(18,2)

);

--Proveedor

create table UBUNTEAM_THE_SQL.Dimension_Proveedor(
	Id int identity,
	proveedor_cuit nvarchar(50) NOT NULL,
	proveedor_razon_social nvarchar(50)

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


--Rango Etario Cliente

alter table  UBUNTEAM_THE_SQL.Dimension_Rango_Etario_Cliente  
	add 
		constraint PK_BI_Rango_Etario_Cliente primary key (Id);


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
		constraint FK_BI_Venta_Rango_Etario_Cliente foreign key ( Id_rango_etario) references UBUNTEAM_THE_SQL.Dimension_Rango_Etario_Cliente(Id),
		constraint FK_BI_Venta_Canal foreign key ( Id_canal) references UBUNTEAM_THE_SQL.Dimension_Canal(Id),
		constraint FK_BI_Venta_MedioDePago foreign key ( Id_medio_de_pago) references UBUNTEAM_THE_SQL.Dimension_MedioDePago(Id),
		constraint FK_BI_Tiempo_Venta foreign key ( id_tiempo) references UBUNTEAM_THE_SQL.Dimension_Tiempo(Id),
		constraint FK_BI_Producto_Venta foreign key ( id_producto) references UBUNTEAM_THE_SQL.Dimension_Producto(Id);


--Proveedor

	alter table  UBUNTEAM_THE_SQL.Dimension_Proveedor  
	add 
		constraint PK_BI_Proveedor primary key (Id),
		constraint UC_BI_proveedor_Cuit unique (proveedor_cuit);


--Compras

	alter table  UBUNTEAM_THE_SQL.Hechos_Compras  
	add 
		constraint PK_BI_Compra primary key (Id),
		constraint FK_BI_Proveedor foreign key ( Id_proveedor) references UBUNTEAM_THE_SQL.Dimension_Proveedor(id),
		constraint FK_BI_Producto_Compra foreign key ( id_producto) references UBUNTEAM_THE_SQL.Dimension_Producto(Id),
		constraint FK_BI_Tiempo_Compra foreign key ( id_tiempo) references UBUNTEAM_THE_SQL.Dimension_Tiempo(Id),
		constraint FK_BI_Compra_MedioDePago foreign key ( Id_medio_pago) references UBUNTEAM_THE_SQL.Dimension_MedioDePago(Id);

--Descuentos

	alter table  UBUNTEAM_THE_SQL.Hechos_Descuentos
	add 
		
		constraint FK_BI_Dimension_Tiempo foreign key ( Id_tiempo) references UBUNTEAM_THE_SQL.Dimension_Tiempo(Id),
		constraint FK_BI_Tipo_Descuento foreign key ( Id_tipo_descuento) references UBUNTEAM_THE_SQL.Dimension_TipoDescuento(Id),
		constraint FK_BI_Canal_Venta foreign key (Id_canal) references UBUNTEAM_THE_SQL.Dimension_Canal(Id);



print '**** CONSTRAINTs BI creadas correctamente ****';

go


/********* Creacion de Vistas *********/



-- Ganancias Mensuales


create view UBUNTEAM_THE_SQL.v_BI_Canal_Ventas_Ganancias_Mensuales
as
	select DC.canal_descripcion,
		   DT.mes,
		   sum(HV.venta_total) - sum(HV.venta_total_medio_de_pago_costo) - 
			(select sum(HC.compra_total) from UBUNTEAM_THE_SQL.Hechos_Compras HC where HC.id_tiempo = DT.Id) as ganancias
			

	from UBUNTEAM_THE_SQL.Hechos_Ventas HV
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on HV.id_tiempo  = DT.Id
	join UBUNTEAM_THE_SQL.Dimension_Canal DC on DC.Id = HV.Id_canal 
	join UBUNTEAM_THE_SQL.Dimension_MedioDePago DMP on DMP.Id = HV.Id_medio_de_pago

	group by DC.canal_descripcion, DT.Id, DT.mes

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
	join UBUNTEAM_THE_SQL.Hechos_Compras HC on HC.id_producto = DP.Id
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT1 on DT1.Id = HV.id_tiempo 
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT2 on DT2.Id = HC.id_tiempo

	group by  DP.prod_codigo,DP.prod_descripcion, DT1.anio,DT1.mes,DT2.anio,DT2.mes
	order by rentabilidad desc
go

--Categorias mas vendidas

create view UBUNTEAM_THE_SQL.v_BI_Categorias_Mas_Vendidas
as


with ordenamiento_rango_mes as (
	select ROW_NUMBER() over (partition by DT.mes,RC.Id

				 order by DT.mes,sum(HV.venta_producto_cantidad) desc) id_particion,

	DC.categoria_descripcion  nombre_categoria,
	RC.rango_etario rango_etario,
	DT.mes mes
		
	from UBUNTEAM_THE_SQL.Hechos_Ventas HV

	join UBUNTEAM_THE_SQL.Dimension_Rango_Etario_Cliente RC on HV.Id_rango_etario = RC.Id 
	join UBUNTEAM_THE_SQL.Dimension_Producto DP on  HV.id_producto = DP.Id
	join UBUNTEAM_THE_SQL.Dimension_Categoria DC on DC.Id = DP.Id_categoria
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on DT.Id = HV.id_tiempo

	group by  DC.categoria_descripcion,DT.mes,RC.rango_etario,RC.Id

) select mes,nombre_categoria,rango_etario from ordenamiento_rango_mes 
  where id_particion <=5

go


--Ingresos por Medio de Pago

create view UBUNTEAM_THE_SQL.v_BI_Ingresos_Por_Medio_De_Pago
as
	select DM.medio_pago_descripcion,
				 DT.mes,
				 sum(HV.venta_total) -  sum(HV.venta_total_medio_de_pago_costo) -
				isnull((select sum(HD.desc_importe) from UBUNTEAM_THE_SQL.Dimension_TipoDescuento DTS
						join UBUNTEAM_THE_SQL.Hechos_Descuentos HD on HD.Id_tipo_descuento = DTS.Id 
						where DTS.concepto_descripcion = 'Medio de pago' and DTS.Id = HD.Id_tipo_descuento),0) ingreso_total
		
	from UBUNTEAM_THE_SQL.Hechos_Ventas HV
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on DT.Id = HV.id_tiempo
	join UBUNTEAM_THE_SQL.Dimension_MedioDePago DM on DM.Id = HV.Id_medio_de_pago

	group by  DM.medio_pago_descripcion,DT.mes
	
go




-- Importe Total Descuentos

create view UBUNTEAM_THE_SQL.v_BI_Importe_Total_Descuentos
as
	select DC.Id canal,DT.mes mes,
	(select sum(HD2.desc_importe) from UBUNTEAM_THE_SQL.Hechos_Descuentos HD2
							join UBUNTEAM_THE_SQL.Dimension_TipoDescuento TD2 on TD2.Id =HD2.Id_tipo_descuento
	where TD2.concepto_descripcion = 'Medio de pago' AND HD2.Id_canal = DC.Id and HD2.Id_tiempo = DT.Id
	group by HD2.Id_canal) 'Descuento por Medio de Pago', 

	(select sum(HD3.desc_importe) from UBUNTEAM_THE_SQL.Hechos_Descuentos HD3
							join UBUNTEAM_THE_SQL.Dimension_TipoDescuento TD3 on TD3.Id =HD3.Id_tipo_descuento
	where TD3.concepto_descripcion = 'Cupon'AND HD3.Id_canal = DC.Id and HD3.Id_tiempo = DT.Id
	group by HD3.Id_canal) 'Descuento por Cupon',
		
	(select sum(HD4.desc_importe) from UBUNTEAM_THE_SQL.Hechos_Descuentos HD4
							join UBUNTEAM_THE_SQL.Dimension_TipoDescuento TD4 on TD4.Id =HD4.Id_tipo_descuento
	where TD4.concepto_descripcion = 'Otros'AND HD4.Id_canal = DC.Id and HD4.Id_tiempo = DT.Id
	group by HD4.Id_canal) 'Descuento Otros'

	from UBUNTEAM_THE_SQL.Hechos_Descuentos HD
	join UBUNTEAM_THE_SQL.Dimension_TipoDescuento TD on TD.Id =HD.Id_tipo_descuento
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on DT.Id = HD.id_tiempo
	join UBUNTEAM_THE_SQL.Dimension_Canal DC on DC.Id = HD.Id_canal
	join UBUNTEAM_THE_SQL.Hechos_Ventas HV on HV.id_tiempo = DT.Id
	group by DT.mes,DC.Id, DT.Id

go

-- Porcentaje de envios a cada prov por mes

create view UBUNTEAM_THE_SQL.v_BI_Porcentaje_Envios_Por_Provincia
as

	select DT.mes, DP.prov_descripcion, 
		format((cast(count(*) as decimal(7,2)) * 100 
		/ (select count(*) from UBUNTEAM_THE_SQL.Hechos_Ventas HV2 
		where HV2.Id_provincia in (select DP2.Id from UBUNTEAM_THE_SQL.Dimension_Provincia DP2) and HV2.id_tiempo = HV.id_tiempo group by HV2.id_tiempo)), 'N2') as procentaje
	from UBUNTEAM_THE_SQL.Hechos_Ventas HV
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on DT.Id = HV.id_tiempo
	join UBUNTEAM_THE_SQL.Dimension_Provincia DP on DP.Id = HV.Id_provincia

	group by DT.mes, HV.id_tiempo, DP.prov_descripcion

go

-- Valor Promedio Envio por Provincia

create view UBUNTEAM_THE_SQL.v_BI_Valor_Promedio_Envio_Por_Provincia
as
	
	select DME.medio_descripcion medio_envio,
				DT.anio,
				P.prov_descripcion,
				avg(HV.venta_total_envio_precio) as promedio_envio_provincia		

	from UBUNTEAM_THE_SQL.Hechos_Ventas HV
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on DT.Id = HV.id_tiempo 
	join UBUNTEAM_THE_SQL.Dimension_Provincia P on HV.Id_provincia = P.Id
	join UBUNTEAM_THE_SQL.Dimension_MedioEnvio DME on DME.Id =HV.Id_medio_envio

	group by  DME.medio_descripcion,P.prov_descripcion, DT.anio

go


--Aumento promedio de Precios

create view UBUNTEAM_THE_SQL.v_BI_Aumento_Promedio_De_Precios
as
	
	select PV.Id proveedor,
		   PV.proveedor_razon_social,
		   PV.proveedor_cuit,
				DT.anio,
				((max(HC.compra_producto_precio)-min(HC.compra_producto_precio))
				/min(HC.compra_producto_precio))  aumento_promedio

	from UBUNTEAM_THE_SQL.Hechos_Compras HC
	join UBUNTEAM_THE_SQL.Dimension_Proveedor PV on HC.Id_proveedor = PV.Id
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on DT.Id = HC.id_tiempo 

	group by  PV.Id, DT.anio,PV.proveedor_cuit,PV.proveedor_razon_social

go


--Productos con Mayor Reposicion

create view UBUNTEAM_THE_SQL.v_BI_Productos_Con_Mayor_Reposicion
as
with ordenamiento_reposicion as (
	select ROW_NUMBER() over (partition by DT.mes

				 order by DT.mes,sum(HC.compra_producto_cantidad) desc) Id_particion,
	P.prod_nombre nombre_prod,
	HC.compra_producto_cantidad,
	DT.mes mes
		
	from UBUNTEAM_THE_SQL.Hechos_Compras HC
	join UBUNTEAM_THE_SQL.Dimension_Producto P on HC.id_producto = P.Id
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on DT.Id = HC.id_tiempo 

	group by  P.Id,HC.compra_producto_cantidad,DT.mes,P.prod_nombre

) select mes,nombre_prod from ordenamiento_reposicion 
  where id_particion <=3

go


PRINT '**** Vistas BI creadas correctamente ****';

GO


--Consulta Views 

/*
	SELECT  * FROM UBUNTEAM_THE_SQL.v_BI_Canal_Ventas_Ganancias_Mensuales
	SELECT * FROM UBUNTEAM_THE_SQL.v_BI_Productos_Con_Mayor_Rentabilidad
	SELECT * FROM UBUNTEAM_THE_SQL.v_BI_Categorias_Mas_Vendidas
	SELECT * FROM UBUNTEAM_THE_SQL.v_BI_Ingresos_Por_Medio_De_Pago
	SELECT * FROM UBUNTEAM_THE_SQL.v_BI_Importe_Total_Descuentos
	SELECT * FROM UBUNTEAM_THE_SQL.v_BI_Porcentaje_Envios_Por_Provincia
	SELECT * FROM UBUNTEAM_THE_SQL.v_BI_Valor_Promedio_Envio_Por_Provincia
	SELECT * FROM UBUNTEAM_THE_SQL.v_BI_Aumento_Promedio_De_Precios
	SELECT * FROM UBUNTEAM_THE_SQL.v_BI_Productos_Con_Mayor_Reposicion

*/

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
	insert into UBUNTEAM_THE_SQL.Dimension_Canal(canal_descripcion)
	select canal_descripcion
	from UBUNTEAM_THE_SQL.Canal
end
go



-- MedioDePago

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_MediosDePago
as
begin 
	insert into UBUNTEAM_THE_SQL.Dimension_MedioDePago(medio_pago_descripcion)
	select medio_pago_descripcion
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


--Rango Etario

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Rango_Etario_Cliente
as
begin 
	insert into UBUNTEAM_THE_SQL.Dimension_Rango_Etario_Cliente(rango_etario)

	select distinct (case when (datediff(year,c.clie_fecha_nac,convert(date,getdate()))) < 25
			 then '<25' when (datediff(year,c.clie_fecha_nac,convert(date,getdate())))between 25 and 35 then '25-35'
			 when (datediff(year,c.clie_fecha_nac,convert(date,getdate()))) between 35 and 55 then '35-55'
			 when (datediff(year,c.clie_fecha_nac,convert(date,getdate()))) > 55 then '>55'end )
	from UBUNTEAM_THE_SQL.Cliente c

end
go

--Ventas


create procedure UBUNTEAM_THE_SQL.Migrar_Hechos_Ventas
as
begin 

	insert into UBUNTEAM_THE_SQL.Hechos_Ventas(Id_rango_etario,Id_canal,Id_medio_de_pago,Id_medio_envio,Id_provincia,
	id_tiempo,id_producto,venta_total,venta_total_envio_precio, venta_total_canal_costo,venta_total_medio_de_pago_costo,venta_producto_precio,
	venta_producto_cantidad)

	select

		DREC.Id,DC.Id,	DMP.Id,	DT.Id,	DME.Id,	DP.Id,	DPD.Id,sum(V.venta_total),sum(V.venta_envio_precio),
		
		sum(V.venta_canal_costo),
		
		sum(V.venta_medio_de_pago_costo),

		sum(PPVV.prod_var_cantidad_venta),

		sum(PPVV.prod_var_cantidad_venta * PPVV.precio_venta)/sum(PPVV.prod_var_cantidad_venta)
		
		
	from UBUNTEAM_THE_SQL.Venta V
	join UBUNTEAM_THE_SQL.Dimension_Canal DC on DC.Id = V.Id_canal
	join UBUNTEAM_THE_SQL.Dimension_MedioDePago DMP on DMP.Id = V.Id_medio_de_pago
	join UBUNTEAM_THE_SQL.MedioEnvioPorLocalidad MEP on MEP.Id = V.Id_medio_envio_por_localidad
	join UBUNTEAM_THE_SQL.Localidad L on L.Id = MEP.Id_localidad
	join UBUNTEAM_THE_SQL.Dimension_MedioEnvio DME on DME.Id = MEP.Id_medio_envio
	join UBUNTEAM_THE_SQL.Dimension_Provincia DP on DP.Id = L.Id_provincia
	join UBUNTEAM_THE_SQL.Cliente C on C.Id = V.Id_cliente
	join UBUNTEAM_THE_SQL.Dimension_Rango_Etario_Cliente DREC on (DREC.rango_etario = (case when (datediff(year,C.clie_fecha_nac,convert(date,getdate()))) < 25
			 then '<25' when (datediff(year,c.clie_fecha_nac,convert(date,getdate())))between 25 and 35 then '25-35'
			 when (datediff(year,C.clie_fecha_nac,convert(date,getdate()))) between 35 and 55 then '35-55'
			 when (datediff(year,C.clie_fecha_nac,convert(date,getdate()))) > 55 then '>55'end ))
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on (DT.anio = year(V.venta_fecha) and DT.mes = month(V.venta_fecha))
	join UBUNTEAM_THE_SQL.ProductoPorVariantePorVenta PPVV on PPVV.Id_venta = V.Id
	join UBUNTEAM_THE_SQL.ProductoPorVariante PPV on PPV.Id = PPVV.Id_prod_var
	join UBUNTEAM_THE_SQL.Dimension_Producto DPD on DPD.prod_codigo = PPV.producto_codigo
	
	group by DC.Id, DMP.Id, DME.Id, DT.Id, DREC.Id,DP.Id,DPD.Id
end
go

create procedure UBUNTEAM_THE_SQL.Migrar_Hechos_Descuentos
as
begin 

	insert into UBUNTEAM_THE_SQL.Hechos_Descuentos(Id_tiempo,Id_tipo_descuento,Id_canal,desc_importe)
	select DT.Id,
		   (select DTP.Id from UBUNTEAM_THE_SQL.Dimension_TipoDescuento DTP
				  where DTP.concepto_descripcion ='Medio de Pago'),
			DC.Id,
		   sum(DPV.desc_venta_importe)
			
	from UBUNTEAM_THE_SQL.Venta V
	join UBUNTEAM_THE_SQL.Dimension_Canal DC on DC.Id = V.Id_canal
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on (DT.anio = year(V.venta_fecha) and DT.mes = month(V.venta_fecha))
	join UBUNTEAM_THE_SQL.DescuentoPorVenta DPV on DPV.Id_venta =V.Id

	group by DT.Id, DC.Id

	union 

		select DT.Id,
			(select DTP.Id from UBUNTEAM_THE_SQL.Dimension_TipoDescuento DTP
				  where DTP.concepto_descripcion ='Otros'),
			DC.Id,
		   sum(DPV.desc_venta_importe)
			
	from UBUNTEAM_THE_SQL.Venta V
	join UBUNTEAM_THE_SQL.Dimension_Canal DC on DC.Id = V.Id_canal
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on (DT.anio = year(V.venta_fecha) and DT.mes = month(V.venta_fecha))
	join UBUNTEAM_THE_SQL.DescuentoPorVenta DPV on DPV.Id_venta =V.Id

	group by DT.Id, DC.Id

	union

	select DT.Id,
		   (select DTP.Id from UBUNTEAM_THE_SQL.Dimension_TipoDescuento DTP
				  where DTP.concepto_descripcion ='Cupon'),
			DC.Id,
			sum(VPC.venta_cupon_importe)
		
	from UBUNTEAM_THE_SQL.Venta V
	join UBUNTEAM_THE_SQL.Dimension_Canal DC on DC.Id = V.Id_canal
	join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on (DT.anio = year(V.venta_fecha) and DT.mes = month(V.venta_fecha))
	join UBUNTEAM_THE_SQL.VentaPorCupon VPC on VPC.Id_venta = V.Id
	join UBUNTEAM_THE_SQL.Cupon C on C.Id =VPC.Id_cupon

	group by DT.Id, DC.Id

end
go



--Producto

create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Productos
as
begin
	insert into UBUNTEAM_THE_SQL.Dimension_Producto(prod_codigo,prod_descripcion,Id_categoria,prod_nombre)
	
	select prod_codigo,prod_descripcion,(select CA.Id from UBUNTEAM_THE_SQL.Dimension_Categoria CA
										 where P.Id_categoria = CA.Id    ),prod_nombre

	from UBUNTEAM_THE_SQL.Producto P
end
go




--Proveedor


create procedure UBUNTEAM_THE_SQL.Migrar_Dimension_Proveedores
as
begin
	insert into UBUNTEAM_THE_SQL.Dimension_Proveedor(proveedor_cuit, proveedor_razon_social)
	select PV.proveedor_cuit,PV.proveedor_razon_social


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
	compra_total ,compra_producto_precio,compra_producto_cantidad)

 select DP.Id,
		
		DPD.Id,
		
		DT.Id,
		 
		DMP.Id, 
	

	  sum(C.compra_total),

	  sum(PPVC.prod_var_cantidad_compra),

	  sum(PPVC.precio_compra * PPVC.prod_var_cantidad_compra) / sum(PPVC.prod_var_cantidad_compra)
	
 from UBUNTEAM_THE_SQL.Compra C
 join UBUNTEAM_THE_SQL.Dimension_Proveedor DP on C.id_proveedor = DP.Id
 join UBUNTEAM_THE_SQL.Dimension_Tiempo DT on (DT.anio = year(C.compra_fecha) and DT.mes = month(C.compra_fecha))
 join UBUNTEAM_THE_SQL.ProductoPorVariantePorCompra PPVC on PPVC.Id_compra = C.Id
 join UBUNTEAM_THE_SQL.ProductoPorVariante PPV on PPV.Id = PPVC.Id_prod_var
 join UBUNTEAM_THE_SQL.Dimension_Producto DPD on DPD.prod_codigo = PPV.producto_codigo
 join UBUNTEAM_THE_SQL.Dimension_MedioDePago DMP on DMP.Id = C.Id_medio_pago

 group by DP.Id,DPD.Id,DMP.Id,DT.Id
		
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
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_Rango_Etario_Cliente;
	print '**** Migracion de Dimension_Rango_Etario_Cliente****';


	--Tablas con FKs a tablas que tienen FKs (tener cuidado porque aca s  importa el orden de EXEC de los SPs)

	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_Productos ;
	print '**** Migracion de Dimension_Productos Exitosa****';
	
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Dimension_Proveedores ;
	print '**** Migracion de Dimension_Proveedores Exitosa****';
	
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Hechos_Compras;
	print '**** Migracion de Hechos_Compras Exitosa****';
	
	EXECUTE UBUNTEAM_THE_SQL.Migrar_Hechos_Ventas;
	print '**** Migracion de Hechos_Ventas Exitosa****';

	EXECUTE UBUNTEAM_THE_SQL.Migrar_Hechos_Descuentos;
	print '**** Migracion de Hechos_Descuentos Exitosa****';

	--Tablas con FKs a tablas que no tienen FKs (van ahora porque ya se migraron las tablas sin FKs, que son de las que dependen estas tablas)


--Consulta Procedures 


/*
IF (
	EXISTS (SELECT  * FROM UBUNTEAM_THE_SQL.Dimension_Canal)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Categoria)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Proveedor)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Producto)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_MedioEnvio)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_MedioDePago)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Rango_Etario_Cliente)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_TipoDescuento)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Dimension_Provincia)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Hechos_Compras)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Hechos_Ventas)
	and EXISTS (SELECT * FROM UBUNTEAM_THE_SQL.Hechos_Descuentos)
	
)

*/


	PRINT 'Tablas BI migradas correctamente.';



