/**
	<p>Procedimientos principales de la base de datos "BOBDB".</p>

	@author		Inoro
	@file		bobdb-procedures.sql
	@since		20190307
	@version	public
*/

-- PREVIOS ---------------------------------------------------------------------
set NAMES utf8;
set character set utf8;

use BOBDB;

-- CREAR PROCEDURES -------------------------------------------------------------

delimiter ;^

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

delimiter ;