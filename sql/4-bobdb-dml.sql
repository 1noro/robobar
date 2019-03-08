/**
	<p>Insercion de datos iniciales de la base de datos "BOBDB".</p>

	@author		Inoro
	@file		bobdb-dml.sql
	@since		20190307
	@version	public
*/

-- PREVIOS ---------------------------------------------------------------------
set NAMES utf8;
set character set utf8;

use BOBDB;

-- CREAMOS LAS TABLAS ----------------------------------------------------------
call BOBP_CREATE_TABLES();