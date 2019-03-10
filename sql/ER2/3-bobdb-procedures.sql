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

        insert into BOBT_TIPO_PRODUCTO(id,nombre,precio_por_defecto,descripcion,img)
            values(_new_id,_nombre,_precio_por_defecto,_descripcion,_img);

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

        insert into BOBT_COMEDOR(id,nombre,descripcion,img)
            values(_new_id,_nombre,_descripcion,_img);

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

        insert into BOBT_PRODUCTO(id,precio_real,id_tipo_producto,comentario)
            values(_new_id,_precio_real,_id_tipo_producto,_comentario);

    end;^

    drop procedure if exists BOBP_MESA_INSERT;^
    create procedure BOBP_MESA_INSERT(
        in _localizacion varchar(400),
        in _id_comedor integer,
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

        insert into BOBT_MESA(id,localizacion,activo,id_comedor,descripcion)
            values(_new_id,_localizacion,true,_id_comedor,_descripcion);

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

        insert into BOBT_CLIENTE(id,nombre,id_mesa,descripcion)
            values(_new_id,_nombre,_id_mesa,_descripcion);

    end;^

    drop procedure if exists BOBP_PRODUCTO_MESA_INSERT;^
    create procedure BOBP_PRODUCTO_MESA_INSERT(
        in _id_mesa integer,
        in _id_producto integer,
        in _fecha date,
        in _hora time,
        in _comentario varchar(400)
    ) begin

        insert into BOBT_PRODUCTO_MESA(
                id_mesa,id_producto,fecha,hora,comentario
            )
            values(_id_mesa,_id_producto,_fecha,_hora,_comentario);

    end;^

    drop procedure if exists BOBP_PAGO_INSERT;^
    create procedure BOBP_PAGO_INSERT(
        in _fecha date,
        in _hora time,
        in _id_mesa integer,
        in _id_cliente integer,
        in _id_camarero integer,
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

        insert into BOBT_PAGO(
                id,fecha,hora,pagado,id_mesa,id_cliente,id_camarero,
                cantidad_entregada,comentario
            )
            values(
                _new_id,_fecha,_hora,false,_id_mesa,_id_cliente,_id_camarero,
                null,_comentario
            );

    end;^

    drop procedure if exists BOBP_PRODUCTO_PAGO_INSERT;^
    create procedure BOBP_PRODUCTO_PAGO_INSERT(
        in _id_pago integer,
        in _id_producto integer
    ) begin

        insert into BOBT_PRODUCTO_PAGO(id_pago,id_producto)
            values(_id_pago,_id_producto);

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

        insert into BOBT_TIPO_PRODUCTO(id,nombre,precio_por_defecto)
            values(_new_id,_nombre,_precio_por_defecto);

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

        insert into BOBT_PRODUCTO(id,precio_real,id_tipo_producto)
            values(_new_id,_precio_real,_id_tipo_producto);

    end;^

    drop procedure if exists BOBP_MESA_SINSERT;^
    create procedure BOBP_MESA_SINSERT(
        in _localizacion varchar(400),
        in _id_comedor integer
    ) begin

        declare _last_id integer;
        declare _new_id integer;

        select max(id) into _last_id from BOBT_MESA;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;

        insert into BOBT_MESA(id,localizacion,activo,id_comedor)
            values(_new_id,_localizacion,true,_id_comedor);

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

        insert into BOBT_CLIENTE(id,nombre,id_mesa)
            values(_new_id,_nombre,_id_mesa);

    end;^

    drop procedure if exists BOBP_PRODUCTO_MESA_SINSERT;^
    create procedure BOBP_PRODUCTO_MESA_SINSERT(
        in _id_mesa integer,
        in _id_producto integer,
        in _fecha date,
        in _hora time
    ) begin

        insert into BOBT_PRODUCTO_MESA(id_mesa,id_producto,fecha,hora)
            values(_id_mesa,_id_producto,_fecha,_hora);

    end;^

    drop procedure if exists BOBP_PAGO_SINSERT;^
    create procedure BOBP_PAGO_SINSERT(
        in _fecha date,
        in _hora time,
        in _id_mesa integer,
        in _id_cliente integer,
        in _id_camarero integer
    ) begin

        declare _last_id integer;
        declare _new_id integer;

        select max(id) into _last_id from BOBT_PAGO;
        if _last_id is null then
            set _new_id=1;
        else
            set _new_id=_last_id+1;
        end if;

        insert into BOBT_PAGO(
                id,fecha,hora,pagado,id_mesa,id_cliente,id_camarero
            )
            values(
                _new_id,_fecha,_hora,false,_id_mesa,_id_cliente,_id_camarero
            );

    end;^

    -- GETTERS ------------------------------------------------------------------

    drop procedure if exists BOBP_GET_ID_PRODUCTO_FROM_MESA;^
    create procedure BOBP_GET_ID_PRODUCTO_FROM_MESA(
        in _id_mesa integer
    ) begin

        select BOBT_PRODUCTO_MESA.id_producto
        from BOBT_MESA
            join BOBT_PRODUCTO_MESA
                on BOBT_PRODUCTO_MESA.id_mesa = BOBT_MESA.id
        where BOBT_PRODUCTO_MESA.id_mesa = _id_mesa;

    end;^

    drop procedure if exists BOBP_GET_PRODUCTO_FROM_MESA;^
    create procedure BOBP_GET_PRODUCTO_FROM_MESA(
        in _id_mesa integer
    ) begin

        select
            BOBT_PRODUCTO.id as id_producto,
            BOBT_PRODUCTO.precio_real,
            BOBT_PRODUCTO.comentario as comentario1,
            BOBT_PRODUCTO_MESA.comentario as comentario2,
            BOBT_TIPO_PRODUCTO.nombre,
            BOBT_TIPO_PRODUCTO.descripcion,
            BOBT_TIPO_PRODUCTO.img
        from BOBT_MESA
            join BOBT_PRODUCTO_MESA
                on BOBT_PRODUCTO_MESA.id_mesa = BOBT_MESA.id
            join BOBT_PRODUCTO
                on BOBT_PRODUCTO.id = BOBT_PRODUCTO_MESA.id_producto
            join BOBT_TIPO_PRODUCTO
                on BOBT_TIPO_PRODUCTO.id = BOBT_PRODUCTO.id_tipo_producto
        where BOBT_PRODUCTO_MESA.id_mesa = _id_mesa;

    end;^

    drop procedure if exists BOBP_GET_PRODUCTO_FROM_PAGO;^
    create procedure BOBP_GET_PRODUCTO_FROM_PAGO(
        in _id_pago integer
    ) begin

        select
            BOBT_PRODUCTO.id as id_producto,
            BOBT_PRODUCTO.precio_real,
            BOBT_PRODUCTO.comentario,
            BOBT_TIPO_PRODUCTO.nombre,
            BOBT_TIPO_PRODUCTO.descripcion,
            BOBT_TIPO_PRODUCTO.img
        from BOBT_PAGO
            join BOBT_PRODUCTO_PAGO
                on BOBT_PRODUCTO_PAGO.id_pago = BOBT_PAGO.id
            join BOBT_PRODUCTO
                on BOBT_PRODUCTO.id = BOBT_PRODUCTO_PAGO.id_producto
            join BOBT_TIPO_PRODUCTO
                on BOBT_TIPO_PRODUCTO.id = BOBT_PRODUCTO.id_tipo_producto
        where BOBT_PRODUCTO_PAGO.id_pago = _id_pago;

    end;^

    drop procedure if exists BOBP_ADD_PRODUCTO_TO_PAGO;^
    create procedure BOBP_ADD_PRODUCTO_TO_PAGO(
        in _id_producto integer,
        in _id_mesa integer,
        in _id_pago integer
    ) begin

        call BOBP_PRODUCTO_PAGO_INSERT(_id_pago,_id_producto);
        delete from BOBT_PRODUCTO_MESA
            where BOBT_PRODUCTO_MESA.id_producto = _id_producto;

    end;^

    -- FALTAN -------------------------------------------------------------------
    -- BOBP_GET_ID_PRODUCTO_FROM_PAGO
    -- BOBP_FINALIZAR_PAGO(id_pago,cantidad_entregada)
    -- BOBP_FINALIZAR_MESA(id_mesa)

delimiter ;
