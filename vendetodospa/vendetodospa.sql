--1.Identificar cada una de las entidades relacionadas y en base a estas, crear el modelo entidad relación correspondiente con todo lo que ello conlleva: cardinalidades, tipos
--de datos de las variables, asignación de claves, entre otros.
--Respuesta en la fotografía integrada en el .zip


--2. Llevar el modelo anteriormente realizado a base de datos, crear las tablas y la estructura necesaria, la cual permitirá dar solución al problema planteado, debe crear
--un usuario propio para poder desarrollar los script así como también las secuencias que corresponda.
------------Respuesta .sql adjunto en el .zip
CREATE TABLE categoria
(
 categoria_id     int NOT NULL ,
 nombre_categoria varchar(30) NOT NULL ,
 CONSTRAINT PK_categoria_id PRIMARY KEY (categoria_id)
);
CREATE TABLE productos
(
 producto_id   int NOT NULL ,
 precio        numeric NOT NULL ,
 proveedor_id  int NOT NULL ,
 categoria_id  int NOT NULL ,
 stock         int NOT NULL ,
 descontinuado int NOT NULL ,
 CONSTRAINT PK_producto_id PRIMARY KEY (producto_id),
 CONSTRAINT FK_categoria_id FOREIGN KEY (categoria_id)  REFERENCES categoria(categoria_id),
 CONSTRAINT FK_proveedor_id FOREIGN KEY (proveedor_id)  REFERENCES proveedores(proveedor_id)
);
CREATE TABLE proveedores
(
 proveedor_id    int NOT NULL ,
 nombre_compania varchar(30) NOT NULL ,
 nombre_contacto varchar(30) NOT NULL ,
 direccion       varchar(100) NOT NULL ,
 region          varchar(20) NOT NULL ,
 ciudad          varchar(20) NOT NULL ,
 telefono        varchar(20) NOT NULL ,
 CONSTRAINT PK_proveedor_id PRIMARY KEY (proveedor_id)
);
CREATE TABLE empleados
(
 empleado_id      int NOT NULL ,
 nombre           varchar(30) NOT NULL ,
 apellido         varchar(30) NOT NULL ,
 fecha_nacimiento date NOT NULL ,
 direccion        varchar(100) NOT NULL ,
 region           varchar(20) NOT NULL ,
 ciudad           varchar(20) NOT NULL ,
 pais             varchar(20) NOT NULL ,
 telefono         varchar(20) NOT NULL ,
 cargo            varchar(30) NOT NULL ,
 CONSTRAINT PK_empleado_id PRIMARY KEY (empleado_id)
);
CREATE TABLE clientes
(
 cliente_id      int NOT NULL ,
 nombre_empresa  varchar(50) NOT NULL ,
 nombre_contacto varchar(30) NOT NULL ,
 email           varchar(50) NOT NULL ,
 direccion       varchar(100) NOT NULL ,
 region          varchar(20) NOT NULL ,
 ciudad          varchar(20) NOT NULL ,
 pais            varchar(20) NOT NULL ,
 codigo_postal   varchar(20) NOT NULL ,
 telefono        varchar(20) NOT NULL ,
 CONSTRAINT PK_cliente_id PRIMARY KEY (cliente_id)
);
CREATE TABLE despachadores
(
 despachador_id   int NOT NULL ,
 nombre           varchar(30) NOT NULL ,
 telefono_empresa varchar(20) NOT NULL ,
 CONSTRAINT PK_despachador_id PRIMARY KEY (despachador_id)
);
CREATE TABLE ordenes
(
 orden_id        int NOT NULL ,
 fecha           date NOT NULL ,
 despachador_id  int NOT NULL ,
 cliente_id      int NOT NULL ,
 empleado_id     int NOT NULL ,
 fecha_envio     date NOT NULL ,
 nombre_receptor varchar(30) NOT NULL ,
 direccion       varchar(100) NOT NULL ,
 codigo_postal   varchar(20) NOT NULL ,
 ciudad          varchar(20) NOT NULL ,
 region          varchar(20) NOT NULL ,
 pais            varchar(20) NOT NULL ,
 via_envio       varchar(20) NOT NULL ,
 CONSTRAINT PK_orden_id PRIMARY KEY (orden_id),
 CONSTRAINT FK_despachador_id FOREIGN KEY (despachador_id)  REFERENCES despachadores(despachador_id),
 CONSTRAINT FK_empleado_id FOREIGN KEY (empleado_id)  REFERENCES empleados(empleado_id),
 CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id)  REFERENCES clientes(cliente_id)
);
CREATE TABLE detalle_ordenes
(
 detalle_orden_id int NOT NULL ,
 valor            numeric NOT NULL ,
 orden_id         int NOT NULL ,
 producto_id      int NOT NULL ,
 cantidad         int NOT NULL ,
 descuento        numeric NOT NULL ,
 CONSTRAINT PK_detalle_orden_id PRIMARY KEY (detalle_orden_id),
 CONSTRAINT FK_producto_id FOREIGN KEY (producto_id)  REFERENCES productos(producto_id),
 CONSTRAINT FK_orden_id FOREIGN KEY (orden_id)  REFERENCES ordenes(orden_id)
);

--3. Realizar 5 inserciones a cada tabla, esto con el fin de ejecutar consultas sobre el modelo.
-- iNSERT A TABLAS
INSERT INTO empleados values (1,'Pedro','Perez',to_date('1989-04-01','yyyy-mm-dd'),'Las acacias 2523','metropolitana','las_condes','chile','56924223356','vendedor');
INSERT INTO empleados values (2,'Juan','Villegas',to_date('1987-12-01','yyyy-mm-dd'),'Santa Isabel 414','metropolitana','providencia','chile','56933123345','vendedor');
INSERT INTO empleados values (3,'Ximena','Diaz',to_date('1980-02-01','yyyy-mm-dd'),'Federico Jimenez 2544','metropolitana','la_florida','chile','56911445566','gerencia');
INSERT INTO empleados values (4,'Camila','Albertina',to_date('1981-09-01','yyyy-mm-dd'),'Las acacias 2523','metropolitana','la_cisterna','chile','56924223356','marketing');
INSERT INTO empleados values (5,'Ignacia','Barros',to_date('2000-03-01','yyyy-mm-dd'),'Gertrudiz Echenique','metropolitana','estacion_central','chile','56955566772','marketing');

COMMIT;


INSERT INTO clientes VALUES(1,'Punto Latino SPA','Andres Fuentes','platinochile@gmail.com','Francisco Pizarro 2922','metropolitana','la_florida','chile','22-2520211',56988888888);
INSERT INTO clientes VALUES(6,'Larbos S.A.','walter Ortega','wortega@larbos.cl','Estado 26','metropolitana','la_florida','chile','22-6393434','56977777777');
INSERT INTO clientes VALUES(7,'Egidas Ltda.','Ange Lobos Romano','ventas@egidas.cl','Avenida del Mar 113','metropolitana','la_florida','chile','22-2522222',56966666666);
INSERT INTO clientes VALUES(8,'Regalos y Mas','Juan Diaz Villegas','regalosymaschile@gmail.com','Francisco Pizarro 2922','metropolitana','la_florida','chile','22-2520211',56966666666);
INSERT INTO clientes VALUES(9,'Punto Latino SPA','Jose Fuentes','platinochile@gmail.com','Francisco Pizarro 2922','metropolitana','la_florida','chile','22-2520211',56988888888);

INSERT INTO despachadores VALUES(1,'TRANSPORTE1','56999999999');
INSERT INTO despachadores VALUES(2,'TRANSPORTE2','56911111111');
INSERT INTO despachadores VALUES(3,'TRANSPORTE3','56922222222');
INSERT INTO despachadores VALUES(4,'TRANSPORTE4','56933333333');
INSERT INTO despachadores VALUES(5,'TRANSPORTE5','56944444444');

INSERT INTO ordenes VALUES(1,to_date('2022-03-01','yyyy-mm-dd'),'1','1','1',to_date('2022-03-21','yyyy-mm-dd'),'Jose','rosas 2202','1100000','iquique','tarapaca','chile','transdiaram_bus');
INSERT INTO ordenes VALUES(2,to_date('2022-03-2','yyyy-mm-dd'),'2','6','4',to_date('2022-03-21','yyyy-mm-dd'),'Jorge','roma 2201','1100000','iquique','tarapaca','chile','transdiaram_bus');
INSERT INTO ordenes VALUES(3,to_date('2022-03-13','yyyy-mm-dd'),'3','7','3',to_date('2022-03-23','yyyy-mm-dd'),'Juana','rollas 2203','1100000','iquique','tarapaca','chile','transdiaram_bus');
INSERT INTO ordenes VALUES(4,to_date('2022-03-14','yyyy-mm-dd'),'4','8','5',to_date('2022-03-24','yyyy-mm-dd'),'Jesus','rusa 2204','1100000','iquique','tarapaca','chile','transdiaram_bus');
INSERT INTO ordenes VALUES(5,to_date('2022-03-15','yyyy-mm-dd'),'5','9','4',to_date('2022-03-25','yyyy-mm-dd'),'Mario','ronda 2205','1100000','iquique','tarapaca','chile','transdiaram_bus');

INSERT INTO proveedores VALUES(01,'minerals spa','Adrian','flores 38','metropolitana','la_florida','56988888881');
INSERT INTO proveedores VALUES(02,'minerals spa','Miguel','flores 28','metropolitana','la_florida','56988888882');
INSERT INTO proveedores VALUES(03,'minerals spa','Hades','flores 35','metropolitana','la_florida','56988888883');
INSERT INTO proveedores VALUES(04,'minerals spa','Debora','flores 25','metropolitana','la_florida','56988888884');
INSERT INTO proveedores VALUES(05,'minerals spa','Nancy','flores 15','metropolitana','la_florida','56988888885');

INSERT INTO categoria VALUES('1','red');
INSERT INTO categoria VALUES('2','blue');
INSERT INTO categoria VALUES('3','yellow');
INSERT INTO categoria VALUES('4','green');
INSERT INTO categoria VALUES('5','orange');


INSERT INTO productos VALUES('1','3000','01','3','300','0');
INSERT INTO productos VALUES('2','4000','02','1','400','0');
INSERT INTO productos VALUES('3','15000','03','2','300','0');
INSERT INTO productos VALUES('4','30000','04','2','4500','0');
INSERT INTO productos VALUES('5','37000','05','5','3600','0');

INSERT INTO detalle_ordenes VALUES('1','3000000','1','4','300','0');
INSERT INTO detalle_ordenes VALUES(2,'4000000','2','4','300','60');
INSERT INTO detalle_ordenes VALUES(3,'5000000','3','5','300','20');
INSERT INTO detalle_ordenes VALUES(4,'5600000','5','5','300','0');
INSERT INTO detalle_ordenes VALUES(5,'5800000','3','5','300','0');


--4.a. Consultar cuál o cuáles son los clientes con las compras más altas y a qué ciudad corresponden los mismos. 
--Esto permitirá en un futuro que VendeTodoSPA pueda buscar convenios con algunas empresas despachadoras.

SELECT c.nombre_empresa AS CLIENTE, SUM(do.valor) AS TOTAL_COMPRAS, c.ciudad AS CIUDAD
FROM clientes c 
JOIN ordenes o 
ON c.cliente_id = o.cliente_id 
JOIN detalle_ordenes do 
ON o.orden_id = do.orden_id
GROUP BY c.nombre_empresa, do.valor, c.ciudad
ORDER BY TOTAL_COMPRAS DESC;

--4.b. Consulta: Se necesita saber los nombres de los distribuidores de los productos más vendidos, esto permitirá evaluar comprar por volumen. 

--Solo es necesario que se listen los nombres de todos los registros que cumplan con la solicitud.

SELECT pr.nombre_compania AS PROVEEDOR, pr.nombre_contacto AS NOMBRE_CONTACTO, do.producto_id AS ID_PRODUCTO, (do.valor * do.cantidad) AS VENTAS 
FROM productos p 
JOIN proveedores pr ON pr.proveedor_id = p.proveedor_id
JOIN detalle_ordenes do ON p.producto_id = do.producto_id
WHERE do.cantidad > 0
ORDER BY VENTAS DESC;

----------------------otra opción------------------------------
SELECT nombre_contacto, ciudad 
FROM CLIENTES 
WHERE (cliente_id) IN 
    (SELECT cliente_id 
    FROM ORDENES 
        WHERE(orden_id) IN 
        ( SELECT DISTINCT orden_id 
            FROM DETALLE_ORDENES
                WHERE(valor) IN
                    ( SELECT MAX(valor) as total FROM DETALLE_ORDENES)));
SELECT nombre_compania
FROM PROVEEDORES
WHERE(proveedor_id) IN 
    (SELECT proveedor_id
        FROM PRODUCTOS
            WHERE(producto_id) IN
            (SELECT (producto_id) from DETALLE_ORDENES));






