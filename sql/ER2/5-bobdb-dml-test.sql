/**
    <p>Ejecucion de comandos de prueba de la base de datos "BOBDB".</p>

    @author     Inoro
    @file       bobdb-dml-test.sql
    @since      20190307
    @version    public
*/

-- PREVIOS ---------------------------------------------------------------------
set NAMES utf8;
set character set utf8;

use BOBDB;

-- PRUEBAS Y TESTS -------------------------------------------------------------
call BOBP_CAMARERO_INSERT('Alfredo II','camarero-alfredo2.jpg');
call BOBP_CAMARERO_SINSERT('Teresa');
call BOBP_CAMARERO_INSERT('Alfredo III','camarero-alfredo2.jpg');

call BOBP_TIPO_PRODUCTO_INSERT('Coca Cola',1.70,'Refresco de Cola.','coca-cola.jpg');
call BOBP_TIPO_PRODUCTO_INSERT('Estrella Galicia Tercio',1.70,'Cerveza Gallega.','estrella-galicia.jpg');
call BOBP_TIPO_PRODUCTO_INSERT('Menú Sábado',25.00,'Menú estandar de los Sábados.','menu-sabado.jpg');
call BOBP_TIPO_PRODUCTO_SINSERT('Kas de Naranja',1.70);
call BOBP_TIPO_PRODUCTO_SINSERT('Caña Estrella Galicia',1.70);

call BOBP_COMEDOR_INSERT('Bar','El bar.','bar.jpg');
call BOBP_COMEDOR_INSERT('Comedor Grande','El comedor más grande.','comedor-grande.jpg');
call BOBP_COMEDOR_SINSERT('Comedor Pequeño');
call BOBP_COMEDOR_SINSERT('Terraza');

call BOBP_PRODUCTO_INSERT(1.70,1,'coca');
call BOBP_PRODUCTO_INSERT(1.70,2,'estrella1');
call BOBP_PRODUCTO_INSERT(25.00,3,'menú');
call BOBP_PRODUCTO_SINSERT(1.70,4); -- kas naranja
call BOBP_PRODUCTO_INSERT(1.70,2,'estrella2');
call BOBP_PRODUCTO_INSERT(1.70,2,'estrella3');

call BOBP_MESA_INSERT('0,0::1,0::0,1::1,1',1,'La barra del Bar.','barra.jpg');
call BOBP_MESA_INSERT('0,0::1,0::0,1::1,1',2,'Junto al Peteiro.','peteiro1.jpg');
call BOBP_MESA_SINSERT('0,0::1,0::0,1::1,1',3);
call BOBP_MESA_INSERT('0,0::1,0::0,1::1,1',4,'Mesa junto al bar.','terraza1.jpg');
call BOBP_MESA_INSERT('0,0::1,0::0,1::1,1',4,'Mesa junto al comedor.','terraza2.jpg');

call BOBP_CLIENTE_INSERT('Miguel Piñol',1,'Tipical client.');
call BOBP_CLIENTE_INSERT('Amadeo',2,'Tipical client.');
call BOBP_CLIENTE_SINSERT('Xavier Iglesias',3);

call BOBP_PRODUCTO_MESA_INSERT(1,2,'2019-01-01','15:30:00','cerveza miguel');
call BOBP_PRODUCTO_MESA_INSERT(2,3,'2019-01-01','15:40:00','menú amadeo');
call BOBP_PRODUCTO_MESA_SINSERT(3,4,'2019-01-02','14:30:00');
call BOBP_PRODUCTO_MESA_INSERT(1,5,'2019-01-01','15:30:00','otra cerveza miguel');
call BOBP_PRODUCTO_MESA_INSERT(1,6,'2019-01-01','15:30:00','otra otra cerveza miguel');

call BOBP_PAGO_INSERT('2019-01-01','15:31:00',1,1,1,'pago de miguel (2 cervezas)');
call BOBP_PAGO_INSERT('2019-01-01','16:30:00',1,2,2,'pago de amadeo');
call BOBP_PAGO_SINSERT('2019-01-02','16:00:00',1,3,2); -- pago xabier iglesias

/*call BOBP_PRODUCTO_PAGO_INSERT(1,2);
call BOBP_PRODUCTO_PAGO_INSERT(2,3);
call BOBP_PRODUCTO_PAGO_INSERT(3,4);*/
call BOBP_ADD_PRODUCTO_TO_PAGO(2,1,1);
call BOBP_ADD_PRODUCTO_TO_PAGO(6,1,1);
call BOBP_FINALIZAR_PAGO(1,5.00);
call BOBP_ADD_PRODUCTO_TO_PAGO(3,2,2);
call BOBP_FINALIZAR_PAGO(2,50.00);
call BOBP_FINALIZAR_MESA(2);
call BOBP_ADD_PRODUCTO_TO_PAGO(4,3,3);
call BOBP_FINALIZAR_PAGO(3,2.00);
call BOBP_FINALIZAR_MESA(3);

-- call BOBP_GET_ID_PRODUCTO_FROM_MESA(1);
-- call BOBP_GET_PRODUCTO_FROM_MESA(1);
call BOBP_GET_PRODUCTO_FROM_PAGO(1);
