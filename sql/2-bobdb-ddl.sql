/**
	<p>Estructura principal de la base de datos "BOBDB".</p>

	@author		Inoro
	@file		bobdb-ddl.sql
	@since		20190307
	@version	public
*/

-- PREVIOS ---------------------------------------------------------------------
set NAMES utf8;
set character set utf8;

use BOBDB;

-- CREAR TABLAS ----------------------------------------------------------------

delimiter ;^

	drop procedure if exists BOBP_CREATE_TABLES;^
	create procedure BOBP_CREATE_TABLES() begin
	
		drop table if exists BOBT_CAMARERO;
		drop table if exists BOBT_TIPO_PRODUCTO;
		drop table if exists BOBT_COMEDOR;
        drop table if exists BOBT_LISTA_CONSUMICIONES;
        
		drop table if exists BOBT_PRODUCTO;
		drop table if exists BOBT_MESA;
		drop table if exists BOBT_CLIENTE;
		drop table if exists BOBT_PAGO;
		
		drop table if exists BOBT_PRODUCTO_LISTA;
        
        -- ---------------------------------------------------------------------
        
        create table BOBT_CAMARERO (
			id integer not null,
			nombre varchar(50) not null,
			img varchar(200),
			primary key (id)
		);
        
        create table BOBT_TIPO_PRODUCTO (
			id integer not null,
			nombre varchar(100) not null,
            precio_por_defecto integer not null,
			descripcion varchar(400),
			img varchar(200),
			primary key (id)
		);
        
        create table BOBT_COMEDOR (
			id integer not null,
			nombre varchar(50) not null,
			descripcion varchar(400),
			primary key (id)
		);
        
        create table BOBT_LISTA_CONSUMICIONES (
			id integer not null,
			primary key (id)
		);
        
        create table BOBT_PRODUCTO (
			id integer not null,
			precio_real integer not null,
            id_tipo_producto integer not null,
			comentario varchar(400),
			primary key (id),
            foreign key (id_tipo_producto) references BOBT_TIPO_PRODUCTO(id)
		);

        create table BOBT_MESA (
			id integer not null,
            localizacion varchar(400) not null,
            id_comedor integer not null,
            id_lista_consumiciones integer not null,
			descripcion varchar(400),
			primary key (id),
            foreign key (id_comedor) references BOBT_COMEDOR(id),
            foreign key (id_lista_consumiciones) references BOBT_LISTA_CONSUMICIONES(id)
		);
        
        create table BOBT_CLIENTE (
			id integer not null,
            alias varchar(50) not null,
            id_mesa integer not null,
			descripcion varchar(400),
			primary key (id),
            foreign key (id_mesa) references BOBT_MESA(id)
		);
        
        create table BOBT_PAGO (
			id integer not null,
            fecha date not null,
            hora time not null,
            id_camarero integer not null,
            id_cliente integer not null,
            id_lista_consumiciones integer not null,
			comentario varchar(400),
			primary key (id),
            foreign key (id_camarero) references BOBT_CAMARERO(id),
            foreign key (id_cliente) references BOBT_CLIENTE(id),
            foreign key (id_lista_consumiciones) references BOBT_LISTA_CONSUMICIONES(id)
		);
        
        create table BOBT_PRODUCTO_LISTA (
			id_lista_consumiciones integer not null,
            id_producto integer not null,
            fecha date not null,
            hora time not null,
			primary key (id_lista_consumiciones, id_producto),
            foreign key (id_lista_consumiciones) references BOBT_LISTA_CONSUMICIONES(id),
            foreign key (id_producto) references BOBT_PRODUCTO(id)
		);
		
	end;^

delimiter ;