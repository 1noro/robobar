/**
	<p>Ejecucion de comandos de prueba de la base de datos "BOBDB".</p>

	@author		Inoro
	@file		bobdb-dml-test.sql
	@since		20190307
	@version	public
*/

-- PREVIOS ---------------------------------------------------------------------
set NAMES utf8;
set character set utf8;

use BOBDB;

-- CREAMOS LAS TABLAS ----------------------------------------------------------
call BOBP_CREATE_TABLES();

-- PRUEBAS ---------------------------------------------------------------------
call BOBP_CAMARERO_INSERT('Pepe','cara.jpg');