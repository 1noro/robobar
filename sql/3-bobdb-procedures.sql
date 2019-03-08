/**
    <p>Procedimientos principales de la base de datos "BOBDB".</p>

    @author     Inoro
    @file       bobdb-procedures.sql
    @since      20190307
    @version    public
*/

-- PREVIOS ---------------------------------------------------------------------
set NAMES utf8;
set character set utf8;

use BOBDB;

-- CREAR PROCEDURES -------------------------------------------------------------

delimiter ;^

    -- INSERT -------------------------------------------------------------------

    drop procedure if exists BOBP_CAMARERO_INSERT;^
    create procedure BOBP_CAMARERO_INSERT(
        in _nombre varchar(50),
        in _img varchar(200)
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_CAMARERO;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_CAMARERO(id,nombre,img) values(_new_id,_nombre,_img);
        
    end;^
    
    drop procedure if exists BOBP_TIPO_PRODUCTO_INSERT;^
    create procedure BOBP_TIPO_PRODUCTO_INSERT(
        in _nombre varchar(50),
        in _precio_por_defecto float,
        in _descripcion varchar(400),
        in _img varchar(200)
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_TIPO_PRODUCTO;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_TIPO_PRODUCTO(id,nombre,precio_por_defecto,descripcion,img) values(_new_id,_nombre,_precio_por_defecto,_descripcion,_img);
        
    end;^
    
    drop procedure if exists BOBP_COMEDOR_INSERT;^
    create procedure BOBP_COMEDOR_INSERT(
        in _nombre varchar(50),
        in _descripcion varchar(400),
        in _img varchar(200)
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_COMEDOR;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_COMEDOR(id,nombre,descripcion,img) values(_new_id,_nombre,_descripcion,_img);
        
    end;^
    
    drop procedure if exists BOBP_LISTA_CONSUMICIONES_INSERT;^
    create procedure BOBP_LISTA_CONSUMICIONES_INSERT() begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_LISTA_CONSUMICIONES;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_LISTA_CONSUMICIONES(id) values(_new_id);
        
    end;^
    
    drop procedure if exists BOBP_PRODUCTO_INSERT;^
    create procedure BOBP_PRODUCTO_INSERT(
        in _precio_real float,
        in _id_tipo_producto integer,
        in _comentario varchar(400)
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_PRODUCTO;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_PRODUCTO(id,precio_real,id_tipo_producto,comentario) values(_new_id,_precio_real,_id_tipo_producto,_comentario);
        
    end;^
    
    drop procedure if exists BOBP_MESA_INSERT;^
    create procedure BOBP_MESA_INSERT(
        in _localizacion varchar(400),
        in _id_comedor integer,
        in _id_lista_consumiciones integer,
        in _descripcion varchar(400)
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_MESA;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_MESA(id,localizacion,activo,id_comedor,id_lista_consumiciones,descripcion) 
            values(_new_id,_localizacion,true,_id_comedor,_id_lista_consumiciones,_descripcion);
        
    end;^
    
    drop procedure if exists BOBP_CLIENTE_INSERT;^
    create procedure BOBP_CLIENTE_INSERT(
        in _nombre varchar(50),
        in _id_mesa integer,
        in _descripcion varchar(400)
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_CLIENTE;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_CLIENTE(id,nombre,id_mesa,descripcion) values(_new_id,_nombre,_id_mesa,_descripcion);
        
    end;^
    
    drop procedure if exists BOBP_PRODUCTO_LISTA_INSERT;^
    create procedure BOBP_PRODUCTO_LISTA_INSERT(
        in _id_lista_consumiciones varchar(50),
        in _id_producto integer,
        in _fecha date,
        in _hora time
    ) begin
        
        insert into BOBT_PRODUCTO_LISTA(id_lista_consumiciones,id_producto,fecha,hora) values(_id_lista_consumiciones,_id_producto,_fecha,_hora);
        
    end;^
    
    drop procedure if exists BOBP_PAGO_INSERT;^
    create procedure BOBP_PAGO_INSERT(
        in _fecha date,
        in _hora time,
        in _id_camarero integer,
        in _id_cliente integer,
        in _id_lista_consumiciones integer,
        in _comentario varchar(400)
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_PAGO;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_PAGO(id,fecha,hora,id_camarero,id_cliente,id_lista_consumiciones,comentario) 
            values(_new_id,_fecha,_hora,_id_camarero,_id_cliente,_id_lista_consumiciones,_comentario);
        
    end;^
    
    -- SHORT INSERT -------------------------------------------------------------
    
    drop procedure if exists BOBP_CAMARERO_SINSERT;^
    create procedure BOBP_CAMARERO_SINSERT(
        in _nombre varchar(50)
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_CAMARERO;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_CAMARERO(id,nombre) values(_new_id,_nombre);
        
    end;^
    
    drop procedure if exists BOBP_TIPO_PRODUCTO_SINSERT;^
    create procedure BOBP_TIPO_PRODUCTO_SINSERT(
        in _nombre varchar(50),
        in _precio_por_defecto float
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_TIPO_PRODUCTO;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_TIPO_PRODUCTO(id,nombre,precio_por_defecto) values(_new_id,_nombre,_precio_por_defecto);
        
    end;^
    
    drop procedure if exists BOBP_COMEDOR_SINSERT;^
    create procedure BOBP_COMEDOR_SINSERT(
        in _nombre varchar(50)
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_COMEDOR;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_COMEDOR(id,nombre) values(_new_id,_nombre);
        
    end;^
    
    drop procedure if exists BOBP_PRODUCTO_SINSERT;^
    create procedure BOBP_PRODUCTO_SINSERT(
        in _precio_real float,
        in _id_tipo_producto integer
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_PRODUCTO;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_PRODUCTO(id,precio_real,id_tipo_producto) values(_new_id,_precio_real,_id_tipo_producto);
        
    end;^
    
    drop procedure if exists BOBP_MESA_SINSERT;^
    create procedure BOBP_MESA_SINSERT(
        in _localizacion varchar(400),
        in _id_comedor integer,
        in _id_lista_consumiciones integer
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_MESA;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_MESA(id,localizacion,activo,id_comedor,id_lista_consumiciones) 
            values(_new_id,_localizacion,true,_id_comedor,_id_lista_consumiciones);
        
    end;^
    
    drop procedure if exists BOBP_CLIENTE_SINSERT;^
    create procedure BOBP_CLIENTE_SINSERT(
        in _nombre varchar(50),
        in _id_mesa integer
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_CLIENTE;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_CLIENTE(id,nombre,id_mesa) values(_new_id,_nombre,_id_mesa);
        
    end;^
    
    drop procedure if exists BOBP_PAGO_SINSERT;^
    create procedure BOBP_PAGO_SINSERT(
        in _fecha date,
        in _hora time,
        in _id_camarero integer,
        in _id_cliente integer,
        in _id_lista_consumiciones integer
    ) begin
    
        declare _last_id integer;
        declare _new_id integer;
        
        select max(id) into _last_id from BOBT_PAGO;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;
        
        insert into BOBT_PAGO(id,fecha,hora,id_camarero,id_cliente,id_lista_consumiciones) 
            values(_new_id,_fecha,_hora,_id_camarero,_id_cliente,_id_lista_consumiciones);
        
    end;^
    
    -- DELETE -------------------------------------------------------------------

delimiter ;
