

----------------------------------------------------
--create schema keepcoding authorization ubthnqou;--
----------------------------------------------------


--CREACION TABLAS--

--Tabla vehiculo
create table keepcoding.vehiculo(
	vehiculo_id	varchar(50)not null,		--PK
	modelo_coche_id varchar(50)not null,	--FK
	comentario text null default('')
);
--PK vehiculo
alter table keepcoding.vehiculo
	add constraint vehiculo_PK 
		primary key(vehiculo_id);

		
--Tabla matricula coche	
create table keepcoding.matricula_coche(
	matricula_coche_id	varchar(50) not null,	--PK
	vehiculo_id	varchar(50) not null,			--FK
	numero varchar(50) not null,
	pais varchar(50)not null,	
	comentario text null default('')
);
--PK matricula_coche
alter table keepcoding.matricula_coche
	add constraint matricula_coche_PK 
		primary key(matricula_coche_id);
	
		
--Tabla revision coche
create table keepcoding.revision_coche(
	revision_coche_id varchar(50) not null,	--PK	
	vehiculo_id varchar(50)not null,		--FK
	moneda_id varchar(50)not null,			--FK
	fecha date not null,
	costo integer not null,	
	comentario text null default('')
);
--PK revision coche
alter table keepcoding.revision_coche
	add constraint revision_coche_PK  
		primary key(revision_coche_id);

	
--Tabla medidor km	
create table keepcoding.medidor_km(
	km_id varchar(50) not null, 		-- PK
	vehiculo_id varchar(50)not null,	--FK
	km integer not null,
	fecha date not null,
	motivo text not null,
	comentario text null default('')
);	
--PK medidor km
alter table keepcoding.medidor_km
	add constraint medidor_km_PK 
		primary key(km_id);

	
--Tabla color coche
create table keepcoding.color_coche(
color_coche_id varchar(50)not null, --PK
nombre varchar(50)not null,
comentario text null default('')
);
--PK color coche
alter table keepcoding.color_coche
	add constraint color_coche_PK 
		primary key(color_coche_id);
			

--Tabla moneda
create table keepcoding.moneda(
moneda_id varchar(50)not null,	--PK
nombre_moneda varchar(50) not null, 
pais varchar(50) not null,
comenatario text null default('')
);
--PK moneda
alter table keepcoding.moneda
	add constraint moneda_PK 
		primary key(moneda_id);


--Tabla compra coche	
create table keepcoding.compra_coche(
	compra_id varchar(50)not null, 			--PK
	vendedor_coche_id varchar(50)not null,	--FK
	vehiculo_id varchar(50) not null,		--FK
	km_id varchar(50)not null,				--FK
	moneda_id varchar(50)not null,			--FK
	precio integer not null,
	fecha date not null,
	comentario text null default('')
);	
--PK compra coche
alter table keepcoding.compra_coche
	add constraint compra_coches_PK 
		primary key(compra_id);


--Tabla vendedor coche
create table keepcoding.vendedor_coche(
	vendedor_coche_id varchar(50) not null, --PK
	nombre varchar(50) not null,
	empresa varchar(50) not null,
	contacto varchar(50)null default(''),
	direccion varchar(50)null default(''),
	comentario text null default('')
);	
--PK vendedor coche
alter table keepcoding.vendedor_coche
	add constraint vendedor_coche_PK 
		primary key(vendedor_coche_id);


--Tabla modelo coche
create table keepcoding.modelo_coche(
	modelo_coche_id varchar(50) not null,	--PK
	marca_coche_id varchar(50)not null,		--FK
	color_coche_id varchar(50)not null, 	--FK
	nombre_modelo varchar(50)not null,
	comentario text null default('')
);	
--PK modelo coche
alter table keepcoding.modelo_coche
	add constraint modelo_coche_PK 
		primary key(modelo_coche_id);
	
		
--Tabla marca coche
create table keepcoding.marca_coche(
	marca_coche_id varchar(50)not null,			--PK
	grupo_empresarial_id varchar(50)not null,	--FK
	nombre varchar(50)not null, 
	comentario text null default('')
);	
--PK marca coche
alter table keepcoding.marca_coche
	add constraint marca_coche_PK
		primary key(marca_coche_id);

	
--Tabla grupo empresarial
create table keepcoding.grupo_empresarial(
	grupo_empresarial_id varchar(50)not null, --PK
	nombre varchar(50) not null,
	comentario text null default('')
);	
--PK grupo empresarial
alter table keepcoding.grupo_empresarial
	add constraint grupo_empresarial_PK
		primary key(grupo_empresarial_id);
		

--Tabla aseguradora
create table keepcoding.aseguradora(
	aseguradora_id varchar(50) not null, --PK
	nombre varchar(50)not null,
	telefono varchar(50)null default(''),
	email text null default('')
);
--PK aseguradora
alter table keepcoding.aseguradora
	add constraint aseguradora_PK
		primary key(aseguradora_id);
		

--Tabla poliza
create table keepcoding.poliza(
poliza_id varchar(50)not null, 		--PK
aseguradora_id varchar(50)not null, --FK
vehiculo_id varchar(50)not null, 	--
numero_poliza varchar(50)not null,
fecha_alta date not null,
fecha_vencimiento date not null
);	
--PK poliza
alter table keepcoding.poliza
	add constraint poliza_PK
		primary key(poliza_id);

--FIN CREACION TABLAS--

--CREACION DE FK'S

--FK vehiculo modelo coche
alter table keepcoding.vehiculo
	add constraint vehiculo_modelo_coche_FK 
		foreign key (modelo_coche_id) 
			references keepcoding.modelo_coche(modelo_coche_id);

--FK matricula_coche
alter table keepcoding.matricula_coche
	add constraint matricula_coche_vehiculo_FK
		foreign key(vehiculo_id) 
			references keepcoding.vehiculo(vehiculo_id);

--FK revision coche vehiculo
alter table keepcoding.revision_coche
	add constraint revision_coche_vehiculo_FK
		foreign key (vehiculo_id)
			references keepcoding.vehiculo(vehiculo_id);
		
--FK revision coche moneda
alter table keepcoding.revision_coche
	add constraint revision_coche_moneda_FK
		foreign key(moneda_id)
			references keepcoding.moneda(moneda_id);

--FK medidor km
alter table keepcoding.medidor_km
	add constraint medidor_km_vehiculo_FK
		foreign key(vehiculo_id)
			references keepcoding.vehiculo(vehiculo_id);
	
--FK compra coche vendedor coche
alter table keepcoding.compra_coche	
	add constraint compra_coche_vendedor_coche_FK 
			foreign key(vendedor_coche_id) 
				references keepcoding.vendedor_coche(vendedor_coche_id);
			
--FK compra coche vehiculo
alter table keepcoding.compra_coche
	add constraint compra_coche_vehiculo_FK 
			foreign key(vehiculo_id) 
				references keepcoding.vehiculo(vehiculo_id);
			
--FK compra coche medidor km
alter table keepcoding.compra_coche
	add constraint compra_coche_medidor_km_FK 
			foreign key(km_id)
				references keepcoding.medidor_km(km_id);
			
--FK moneda compra coche
alter table keepcoding.compra_coche
	add constraint compra_coche_moneda_FK 
		foreign key(moneda_id) 
			references keepcoding.moneda(moneda_id);

        --FK modelo coche marca coche
alter table keepcoding.modelo_coche
	add constraint modelo_coche_marca_coche_FK
    	foreign key(marca_coche_id)
        	references keepcoding.marca_coche(marca_coche_id);
        
--FK modelo coche color coche
alter table keepcoding.modelo_coche
	add constraint modelo_coche_color_coche_FK
    	foreign key(color_coche_id)
        	references keepcoding.color_coche(color_coche_id);

--FK marca coche grupo empresarial
alter table keepcoding.marca_coche
	add constraint marca_coche_grupo_empresarial_FK
		foreign key(grupo_empresarial_id)
			references keepcoding.grupo_empresarial(grupo_empresarial_id);
	
	--FK poliza aseguradora_id
alter table keepcoding.poliza
	add constraint poliza_aseguradora_FK
    	foreign key(aseguradora_id)
        	references keepcoding.aseguradora(aseguradora_id);
        
--FK poliza vehiculo
alter table keepcoding.poliza
	add constraint poliza_vehiculo_FK
   		foreign key(vehiculo_id)
        	references keepcoding.vehiculo(vehiculo_id);

	
--------------------	
-- INSERT DE DATOS--
--------------------

--INSERT GRUPO EMPRESARIAL
insert into keepcoding.grupo_empresarial(grupo_empresarial_id,nombre)
values('GREM0001','Hyundai Motor Company');

insert into keepcoding.grupo_empresarial(grupo_empresarial_id,nombre)
values('GREM0002','Grupo Volkswagen');

insert into keepcoding.grupo_empresarial(grupo_empresarial_id,nombre)
values('GREM0003','BMW Group');




--INSERT VENDEDOR COCHE
insert into keepcoding.vendedor_coche(vendedor_coche_id,nombre,empresa,contacto,direccion)
values('VEN0001','Juan Jesus Carranza','KIA RIA MOTORS','987654323','AV PONTEVEDRA 98');

insert into keepcoding.vendedor_coche(vendedor_coche_id,nombre,empresa,contacto,direccion)
values('VEN0002','Ruth Zafra','COMPOSTELA MOTOR SEAT','878654522','RUA DE MALTA 3');

insert into keepcoding.vendedor_coche(vendedor_coche_id,nombre,empresa,contacto,direccion,comentario)
values('VEN0003','Gemma Caballero','BMW AMIOCAR','847843455','CAMPOSANCOS 33','g.cab@bmwamiocar.com');




--INSERT COLOR COCHE
insert into keepcoding.color_coche(color_coche_id,nombre)
values('COLOR0001','BLANCO');

insert into keepcoding.color_coche(color_coche_id,nombre)
values('COLOR0002','NEGRO');

insert into keepcoding.color_coche(color_coche_id,nombre)
values('COLOR0003','GRIS');

insert into keepcoding.color_coche(color_coche_id,nombre)
values('COLOR0004','ROJO');





--INSERT MONEDA
insert into keepcoding.moneda(moneda_id,nombre_moneda,pais,comenatario)
values('TMON0001','EURO','ESPAÑA','UE');

insert into keepcoding.moneda(moneda_id,nombre_moneda,pais,comenatario)
values('TMON0002','DOLAR','EEUU','NA');




--INSERT ASEGURADORA
insert into keepcoding.aseguradora(aseguradora_id,nombre,telefono,email)
values('SEGUR0001',	'MAPFRE','877876755','yacod53583@mapfre.com');

insert into keepcoding.aseguradora(aseguradora_id,nombre,telefono,email)
values('SEGUR0002',	'MUTUA','677543444','yacod53523@mutua.com');

insert into keepcoding.aseguradora(aseguradora_id,nombre,telefono,email)
values('SEGUR0003',	'AXA','999874455','yac2333583@axa.com');




--INSERT MARCA COCHE
insert into keepcoding.marca_coche(marca_coche_id,grupo_empresarial_id,nombre)
values('MARCO0001','GREM0001','KIA');

insert into keepcoding.marca_coche(marca_coche_id,grupo_empresarial_id,nombre)
values('MARCO0002','GREM0002','SEAT');

insert into keepcoding.marca_coche(marca_coche_id,grupo_empresarial_id,nombre)
values('MARCO0003','GREM0003','BMW');




--INSERT MODELO COCHE
insert into keepcoding.modelo_coche(modelo_coche_id,marca_coche_id,color_coche_id,nombre_modelo)
values('MODCO0001','MARCO0001','COLOR0003','CEED');

insert into keepcoding.modelo_coche(modelo_coche_id,marca_coche_id,color_coche_id,nombre_modelo)
values('MODCO0002','MARCO0001','COLOR0003','XCEED');

insert into keepcoding.modelo_coche(modelo_coche_id,marca_coche_id,color_coche_id,nombre_modelo)
values('MODCO0003','MARCO0001','COLOR0003','SORENTO');

insert into keepcoding.modelo_coche(modelo_coche_id,marca_coche_id,color_coche_id,nombre_modelo)
values('MODCO0004','MARCO0002','COLOR0003','LEON');

insert into keepcoding.modelo_coche(modelo_coche_id,marca_coche_id,color_coche_id,nombre_modelo)
values('MODCO0005','MARCO0002','COLOR0003','IBIZA');

insert into keepcoding.modelo_coche(modelo_coche_id,marca_coche_id,color_coche_id,nombre_modelo)
values('MODCO0006','MARCO0003','COLOR0003','X5');




--INSERT VEHICULO
insert into keepcoding.vehiculo(vehiculo_id, modelo_coche_id)
values('V0001','MODCO0001');

insert into keepcoding.vehiculo(vehiculo_id, modelo_coche_id)
values('V0002','MODCO0002');

insert into keepcoding.vehiculo(vehiculo_id, modelo_coche_id)
values('V0003','MODCO0003');

insert into keepcoding.vehiculo(vehiculo_id, modelo_coche_id)
values('V0004','MODCO0004');

insert into keepcoding.vehiculo(vehiculo_id, modelo_coche_id)
values('V0005','MODCO0005');

insert into keepcoding.vehiculo(vehiculo_id, modelo_coche_id)
values('V0006','MODCO0006');

insert into keepcoding.vehiculo(vehiculo_id, modelo_coche_id)
values('V0007','MODCO0001');

insert into keepcoding.vehiculo(vehiculo_id, modelo_coche_id)
values('V0008','MODCO0002');

insert into keepcoding.vehiculo(vehiculo_id, modelo_coche_id)
values('V0009','MODCO0003');

insert into keepcoding.vehiculo(vehiculo_id, modelo_coche_id)
values('V0010','MODCO0004');




--INSERT POLIZA
insert into keepcoding.poliza(poliza_id,aseguradora_id,vehiculo_id,numero_poliza,fecha_alta,fecha_vencimiento)
values('POL0001','SEGUR0001','V0001','SDAN213881238','2011-06-08','2012-06-08');

insert into keepcoding.poliza(poliza_id,aseguradora_id,vehiculo_id,numero_poliza,fecha_alta,fecha_vencimiento)
values('POL0002','SEGUR0002','V0002','SDAN213881239','2012-01-03','2013-01-03');

insert into keepcoding.poliza(poliza_id,aseguradora_id,vehiculo_id,numero_poliza,fecha_alta,fecha_vencimiento)
values('POL0003','SEGUR0003','V0003','SDAN213881240','2012-12-12','2013-12-12');

insert into keepcoding.poliza(poliza_id,aseguradora_id,vehiculo_id,numero_poliza,fecha_alta,fecha_vencimiento)
values('POL0004','SEGUR0001','V0004','SDAN213881241','2013-05-08','2014-05-08');

insert into keepcoding.poliza(poliza_id,aseguradora_id,vehiculo_id,numero_poliza,fecha_alta,fecha_vencimiento)
values('POL0005','SEGUR0002','V0005','SDAN213881242','2014-01-09','2015-01-09');

insert into keepcoding.poliza(poliza_id,aseguradora_id,vehiculo_id,numero_poliza,fecha_alta,fecha_vencimiento)
values('POL0006','SEGUR0003','V0006','SDAN213881243','2014-12-06','2015-12-06');

insert into keepcoding.poliza(poliza_id,aseguradora_id,vehiculo_id,numero_poliza,fecha_alta,fecha_vencimiento)
values('POL0007','SEGUR0001','V0007','SDAN213881244','2016-01-22','2017-01-22');

insert into keepcoding.poliza(poliza_id,aseguradora_id,vehiculo_id,numero_poliza,fecha_alta,fecha_vencimiento)
values('POL0008','SEGUR0002','V0008','SDAN213881245','2016-02-02','2017-02-02');

insert into keepcoding.poliza(poliza_id,aseguradora_id,vehiculo_id,numero_poliza,fecha_alta,fecha_vencimiento)
values('POL0009','SEGUR0003','V0009','SDAN213881246','2019-05-31','2020-05-31');

insert into keepcoding.poliza(poliza_id,aseguradora_id,vehiculo_id,numero_poliza,fecha_alta,fecha_vencimiento)
values('POL0010','SEGUR0001','V0010','SDAN213881247','2022-05-24','2022-05-24');




--INSERT MATRICULA COCHE
insert into keepcoding.matricula_coche(matricula_coche_id,vehiculo_id,numero,pais)					
VALUES('MAT0001','V0001','4013ZNH','ESPANA');

insert into keepcoding.matricula_coche(matricula_coche_id,vehiculo_id,numero,pais)					
VALUES('MAT0002','V0002','2137ZAM','ESPANA');

insert into keepcoding.matricula_coche(matricula_coche_id,vehiculo_id,numero,pais)					
VALUES('MAT0003','V0003','6130VEQ','ESPANA');

insert into keepcoding.matricula_coche(matricula_coche_id,vehiculo_id,numero,pais)					
VALUES('MAT0004','V0004','7631HBN','ESPANA');

insert into keepcoding.matricula_coche(matricula_coche_id,vehiculo_id,numero,pais)					
VALUES('MAT0005','V0005','5310IYY','ESPANA');

insert into keepcoding.matricula_coche(matricula_coche_id,vehiculo_id,numero,pais)					
VALUES('MAT0006','V0006','5107FGV','ESPANA');

insert into keepcoding.matricula_coche(matricula_coche_id,vehiculo_id,numero,pais)					
VALUES('MAT0007','V0007','8291UVQ','ESPANA');

insert into keepcoding.matricula_coche(matricula_coche_id,vehiculo_id,numero,pais)					
VALUES('MAT0008','V0008','9176EUY','ESPANA');

insert into keepcoding.matricula_coche(matricula_coche_id,vehiculo_id,numero,pais)					
VALUES('MAT0009','V0009','1913SOM','ESPANA');

insert into keepcoding.matricula_coche(matricula_coche_id,vehiculo_id,numero,pais)					
VALUES('MAT0010','V0010','3790RHL','ESPANA');




--INSERT REVISION COCHE
insert into keepcoding.revision_coche(revision_coche_id,vehiculo_id,moneda_id,fecha,costo)
values('REV0001','V0001','TMON0001','2022-09-07',30	);

insert into keepcoding.revision_coche(revision_coche_id,vehiculo_id,moneda_id,fecha,costo)
values('REV0002','V0002','TMON0001','2021-10-28',33);

insert into keepcoding.revision_coche(revision_coche_id,vehiculo_id,moneda_id,fecha,costo)
values('REV0003','V0003','TMON0001','2022-01-05',28);

insert into keepcoding.revision_coche(revision_coche_id,vehiculo_id,moneda_id,fecha,costo)
values('REV0004','V0004','TMON0001','2022-09-20',55);

insert into keepcoding.revision_coche(revision_coche_id,vehiculo_id,moneda_id,fecha,costo)
values('REV0005','V0005','TMON0001','2022-08-19',31);

insert into keepcoding.revision_coche(revision_coche_id,vehiculo_id,moneda_id,fecha,costo)
values('REV0006','V0006','TMON0001','2022-09-02',27);

insert into keepcoding.revision_coche(revision_coche_id,vehiculo_id,moneda_id,fecha,costo)
values('REV0007','V0007','TMON0001','2022-10-15',61);

insert into keepcoding.revision_coche(revision_coche_id,vehiculo_id,moneda_id,fecha,costo)
values('REV0008','V0008','TMON0001','2021-09-30',55);

insert into keepcoding.revision_coche(revision_coche_id,vehiculo_id,moneda_id,fecha,costo)
values('REV0009','V0009','TMON0001','2022-06-25',44);




--INSERT MEDIDOR KM
insert into keepcoding.medidor_km(km_id,vehiculo_id,km,fecha,motivo)
VALUES('MEDKM0001','V0001','31323','2011-06-08','compra');

insert into keepcoding.medidor_km(km_id,vehiculo_id,km,fecha,motivo)
VALUES('MEDKM0002','V0002','31323','2012-01-03','compra');

insert into keepcoding.medidor_km(km_id,vehiculo_id,km,fecha,motivo)
VALUES('MEDKM0003','V0003','231323','2012-12-12','compra');

insert into keepcoding.medidor_km(km_id,vehiculo_id,km,fecha,motivo)
VALUES('MEDKM0004','V0004','231323','2013-05-08','compra');

insert into keepcoding.medidor_km(km_id,vehiculo_id,km,fecha,motivo)
VALUES('MEDKM0005','V0005','4231323','2014-01-09','compra');

insert into keepcoding.medidor_km(km_id,vehiculo_id,km,fecha,motivo)
VALUES('MEDKM0006','V0006','13231323','2014-12-06','compra');

insert into keepcoding.medidor_km(km_id,vehiculo_id,km,fecha,motivo)
VALUES('MEDKM0007','V0007','231323','2016-01-22','compra');

insert into keepcoding.medidor_km(km_id,vehiculo_id,km,fecha,motivo)
VALUES('MEDKM0008','V0008','4323','2016-02-02','compra');

insert into keepcoding.medidor_km(km_id,vehiculo_id,km,fecha,motivo)
VALUES('MEDKM0009','V0009','3231323','2019-05-31','compra');

insert into keepcoding.medidor_km(km_id,vehiculo_id,km,fecha,motivo)
VALUES('MEDKM0010','V0010','321323','2022-05-24','compra');




--INSERT COMPRA COCHE
insert into keepcoding.compra_coche(compra_id,vendedor_coche_id,vehiculo_id,km_id,moneda_id,precio,fecha,comentario)
VALUES('COM0001','VEN0001','V0001','MEDKM0001','TMON0001',69510,'2011-06-08','KIA');

insert into keepcoding.compra_coche(compra_id,vendedor_coche_id,vehiculo_id,km_id,moneda_id,precio,fecha,comentario)
VALUES('COM0002','VEN0002','V0002','MEDKM0002','TMON0001',33949,'2012-01-03','SEAT');

insert into keepcoding.compra_coche(compra_id,vendedor_coche_id,vehiculo_id,km_id,moneda_id,precio,fecha,comentario)
VALUES('COM0003','VEN0001','V0003','MEDKM0003','TMON0001',29584,'2012-12-12','KIA');

insert into keepcoding.compra_coche(compra_id,vendedor_coche_id,vehiculo_id,km_id,moneda_id,precio,fecha,comentario)
VALUES('COM0004','VEN0002','V0004','MEDKM0004','TMON0001',56453,'2013-05-08','SEAT');

insert into keepcoding.compra_coche(compra_id,vendedor_coche_id,vehiculo_id,km_id,moneda_id,precio,fecha,comentario)
VALUES('COM0005','VEN0003','V0005','MEDKM0005','TMON0001',23472,'2014-01-09','BMW');

insert into keepcoding.compra_coche(compra_id,vendedor_coche_id,vehiculo_id,km_id,moneda_id,precio,fecha,comentario)
VALUES('COM0006','VEN0001','V0006','MEDKM0006','TMON0001',23243,'2014-12-06','KIA');

insert into keepcoding.compra_coche(compra_id,vendedor_coche_id,vehiculo_id,km_id,moneda_id,precio,fecha,comentario)
VALUES('COM0007','VEN0001','V0007','MEDKM0007','TMON0001',56343,'2016-01-22','KIA');

insert into keepcoding.compra_coche(compra_id,vendedor_coche_id,vehiculo_id,km_id,moneda_id,precio,fecha,comentario)
VALUES('COM0008','VEN0003','V0008','MEDKM0008','TMON0001',23432,'2016-02-02','BMW');

insert into keepcoding.compra_coche(compra_id,vendedor_coche_id,vehiculo_id,km_id,moneda_id,precio,fecha,comentario)
VALUES('COM0009','VEN0001','V0009','MEDKM0009','TMON0001',73483,'2019-05-31','KIA');

insert into keepcoding.compra_coche(compra_id,vendedor_coche_id,vehiculo_id,km_id,moneda_id,precio,fecha,comentario)
VALUES('COM0010','VEN0003','V0010','MEDKM0010','TMON0001',64533,'2022-05-24','BMW'); 