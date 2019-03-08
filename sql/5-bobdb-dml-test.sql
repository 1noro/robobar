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

-- PRUEBAS Y TESTS -------------------------------------------------------------
call BOBP_CAMARERO_INSERT('Alfredo II','camarero-alfredo2.jpg');
call BOBP_CAMARERO_SINSERT('Teresa');

call BOBP_TIPO_PRODUCTO_INSERT('Coca Cola',1.70,'Refresco de Cola.','coca-cola.jpg');
call BOBP_TIPO_PRODUCTO_INSERT('Estrella Galicia',1.70,'Cerveza Gallega.','estrella-galicia.jpg');
call BOBP_TIPO_PRODUCTO_INSERT('Menú Sábado',25.00,'Menú estandar de los Sábados.','menu-sabado.jpg');
call BOBP_TIPO_PRODUCTO_SINSERT('Kas de Naranja',1.70);

call BOBP_COMEDOR_INSERT('Bar','El bar.','bar.jpg');
call BOBP_COMEDOR_INSERT('Comedor Grande','El comedor más grande.','comedor-grande.jpg');
call BOBP_COMEDOR_SINSERT('Comedor Pequeño');

call BOBP_LISTA_CONSUMICIONES_INSERT();
call BOBP_LISTA_CONSUMICIONES_INSERT();
call BOBP_LISTA_CONSUMICIONES_INSERT();

call BOBP_PRODUCTO_INSERT(1.70,1,'coca');
call BOBP_PRODUCTO_INSERT(1.70,2,'estrella');
call BOBP_PRODUCTO_INSERT(25.00,3,'menú');
call BOBP_PRODUCTO_SINSERT(1.70,4); -- kas naranja

call BOBP_MESA_INSERT('0,0::1,0::0,1::1,1',1,1,'La barra del Bar.');
call BOBP_MESA_INSERT('0,0::1,0::0,1::1,1',2,2,'Junto al Peteiro.');
call BOBP_MESA_SINSERT('0,0::1,0::0,1::1,1',3,3);

call BOBP_CLIENTE_INSERT('Miguel Piñol',1,'Tipical client.');
call BOBP_CLIENTE_INSERT('Amadeo',2,'Tipical client.');
call BOBP_CLIENTE_SINSERT('Xavier Iglesias',3);

call BOBP_PRODUCTO_LISTA_INSERT(1,2,'2019-01-01','15:30:00');
call BOBP_PRODUCTO_LISTA_INSERT(2,3,'2019-01-01','15:40:00');
call BOBP_PRODUCTO_LISTA_INSERT(3,4,'2019-01-02','14:30:00');

call BOBP_PAGO_INSERT('2019-01-01','15:31:00',1,1,1,'pago de miguel');
call BOBP_PAGO_INSERT('2019-01-01','16:30:00',1,2,2,'pago de amadeo');
call BOBP_PAGO_SINSERT('2019-01-02','16:00:00',1,3,3); -- pago xabier iglesias
