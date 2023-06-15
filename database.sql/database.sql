DROP DATABASE IF EXISTS vestidos;
CREATE DATABASE vestidos;
USE vestidos;

create table vestido(
    id smallint,
    nombre varchar(100),
    entrada int,
    salida int,
    saldoTotalMercaderia int,
    precio float,
    saldoTotal float,
    estado varchar(30),
    fechaPago date,
    primary key (nombre)
);

create table acciones(
    id smallint primary key auto_increment,
    nombre_vestido varchar(100),
    color_vestido varchar(40),
    talle_vestido varchar(10),
    cantidadS int,
    cantidadE int,
    FOREIGN KEY (nombre_vestido) references vestido(nombre)
);

create table fecha(
    id smallint primary key auto_increment,
    nombre_vestido varchar(100),
    color_vestido varchar(40),
    talle_vestido varchar(10),
    tipo varchar(20),
    cantidad int,
    fecha date
);

create table historialPagos(
    id smallint primary key auto_increment,
    cantidadSalidas int,
    saldoPagado float,
    fechaPagada date
);


INSERT INTO vestido(id,nombre,entrada, salida, saldoTotalMercaderia, precio, saldoTotal, estado, fechaPago) VALUES
                            (1,'Vestido corto Dhara',30,5,entrada-salida,2685.0,precio*salida,'No pagado','2023-06-10'),
                            (2,'Vestido Starples',48,13,entrada-salida,3250.0,precio*salida,'No pagado','2023-06-10'),
                            (3,'Vestido Remeron Fiorella',15,11,entrada-salida,3360.0,precio*salida,'No pagado','2023-06-10'),
                            (4,'Tapado Channel',12,10,entrada-salida,4180.0,precio*salida,'No pagado','2023-06-10'),
                            (5,'Vestido Gretta',30,4,entrada-salida,2790.0,precio*salida,'No pagado','2023-06-10'),
                            (6,'Poncho en Picos Yamilet',18,0,entrada-salida,3910.0,precio*salida,'No pagado','2023-06-10'),
                            (7,'Chaleco Ethna',27,14,entrada-salida,2640.0,precio*salida,'No pagado','2023-06-10'),
                            (8,'Sueter Lisboa',87,0,entrada-salida,3510.0,precio*salida,'No pagado','2023-06-10'),
                            (9,'Sueter Aitana',24,0,entrada-salida,2520.0,precio*salida,'No pagado','2023-06-10'),
                            (10,'Sueter Ibiza',20,4,entrada-salida,2930.0,precio*salida,'No pagado','2023-06-10'),
                            (11,'Tapado Anezka',36,7,entrada-salida,4080.0,precio*salida,'No pagado','2023-06-10'),
                            (12,'Sueter Amelia',45,1,entrada-salida,2300.0,precio*salida,'No pagado','2023-06-10'),
                            (13,'Buzo Manta Teddy',15,2,entrada-salida,4080.0,precio*salida,'No pagado','2023-06-10'),
                            (14,'Vestido Indira',24,0,entrada-salida,3240.0,precio*salida,'No pagado','2023-06-10'),
                            (15,'Sueter Ponchiito Nabi',10,0,entrada-salida,4230.0,precio*salida,'No pagado','2023-06-10'),
                            (16,'Vestido Bianka',45,5,entrada-salida,4460.0,precio*salida,'No pagado','2023-06-10'),
                            (17,'Tapado Julieth',15,0,entrada-salida,4030.0,precio*salida,'No pagado','2023-06-10'),
                            (18,'Tapado Roma',75,3,entrada-salida,3610.0,precio*salida,'No pagado','2023-06-10');

INSERT INTO acciones(nombre_vestido, color_vestido, talle_vestido, cantidadS,cantidadE) VALUES
                             ('Vestido corto Dhara','Negro','M',0,0), ('Vestido corto Dhara','Negro','L',0,0),
                             ('Vestido corto Dhara','Negro','XL',0,0), ('Vestido corto Dhara','Negro','XXL',0,0),
                             ('Vestido corto Dhara','Gris oscuro','M',0,0), ('Vestido corto Dhara','Gris oscuro','L',0,0),
                             ('Vestido corto Dhara','Gris oscuro','XL',0,0), ('Vestido corto Dhara','Gris oscuro','XXL',0,0),
                             ('Vestido corto Dhara','Gris claro','M',0,0), ('Vestido corto Dhara','Gris claro','L',0,0),
                             ('Vestido corto Dhara','Gris claro','XL',0,0), ('Vestido corto Dhara','Gris claro','XXL',0,0),
                             ('Vestido Starples','Negro','M',0,0), ('Vestido Starples','Negro','L',0,0),
                             ('Vestido Starples','Negro','XL',0,0), ('Vestido Starples','Negro','XXL',0,0),
                             ('Vestido Starples','Marron','M',0,0), ('Vestido Starples','Marron','L',0,0),
                             ('Vestido Starples','Marron','XL',0,0), ('Vestido Starples','Marron','XXL',0,0),
                             ('Vestido Starples','Rojo','M',0,0), ('Vestido Starples','Rojo','L',0,0),
                             ('Vestido Starples','Rojo','XL',0,0), ('Vestido Starples','Rojo','XXL',0,0),
                             ('Vestido Starples','Verde claro','M',0,0), ('Vestido Starples','Verde claro','L',0,0),
                             ('Vestido Starples','Verde claro','XL',0,0), ('Vestido Starples','Verde claro','XXL',0,0),
                             ('Vestido Remeron Fiorella','Negro','S',0,0), ('Vestido Remeron Fiorella','Negro','M',0,0),('Vestido Remeron Fiorella','Negro','L',0,0),
                             ('Vestido Remeron Fiorella','Negro','XL',0,0), ('Vestido Remeron Fiorella','Negro','XXL',0,0),
                             ('Vestido Remeron Fiorella','Gris claro','S',0,0), ('Vestido Remeron Fiorella','Gris claro','M',0,0),('Vestido Remeron Fiorella','Gris claro','L',0,0),
                             ('Vestido Remeron Fiorella','Gris claro','XL',0,0), ('Vestido Remeron Fiorella','Gris claro','XXL',0,0),
                             ('Tapado Channel','Beige','S',0,0),('Tapado Channel','Beige','M',0,0), ('Tapado Channel','Beige','L',0,0),
                             ('Tapado Channel','Beige','XL',0,0), ('Tapado Channel','Beige','XXL',0,0),
                             ('Vestido Gretta','Negro','S',0,0), ('Vestido Gretta','Negro','M',0,0), ('Vestido Gretta','Negro','L',0,0),
                             ('Vestido Gretta','Negro','XL',0,0), ('Vestido Gretta','Negro','XXL',0,0),
                             ('Vestido Gretta','Gris claro','S',0,0), ('Vestido Gretta','Gris claro','M',0,0), ('Vestido Gretta','Gris claro','L',0,0),
                             ('Vestido Gretta','Gris claro','XL',0,0), ('Vestido Gretta','Gris claro','XXL',0,0),
                             ('Poncho en Picos Yamilet','Negro','M',0,0),
                             ('Poncho en Picos Yamilet','Negro','XL',0,0), ('Poncho en Picos Yamilet','Negro','XXL',0,0),
                             ('Poncho en Picos Yamilet','Gris claro','M',0,0),
                             ('Poncho en Picos Yamilet','Gris claro','XL',0,0), ('Poncho en Picos Yamilet','Gris claro','XXL',0,0),

                             ('Chaleco Ethna','Natural','M',0,0), ('Chaleco Ethna','Natural','M',0,0), ('Chaleco Ethna','Natural','L',0,0),
                             ('Chaleco Ethna','Natural','XL',0,0), ('Chaleco Ethna','Natural','XXL',0,0),
                             ('Chaleco Ethna','Negro','S',0,0), ('Chaleco Ethna','Negro','M',0,0),
                             ('Chaleco Ethna','Negro','L',0,0), ('Chaleco Ethna','Negro','XL',0,0),

                             ('Sueter Lisboa','Camel','M',0,0), ('Sueter Lisboa','Camel','M',0,0), ('Sueter Lisboa','Camel','L',0,0),
                             ('Sueter Lisboa','Camel','XL',0,0), ('Sueter Lisboa','Camel','XXL',0,0),
                             ('Sueter Lisboa','Marron','M',0,0), ('Sueter Lisboa','Marron','M',0,0), ('Sueter Lisboa','Marron','L',0,0),
                             ('Sueter Lisboa','Marron','XL',0,0), ('Sueter Lisboa','Marron','XXL',0,0),
                             ('Sueter Lisboa','Natural','M',0,0), ('Sueter Lisboa','Natural','M',0,0), ('Sueter Lisboa','Natural','L',0,0),
                             ('Sueter Lisboa','Natural','XL',0,0), ('Sueter Lisboa','Natural','XXL',0,0),
                             ('Sueter Lisboa','Negro','M',0,0), ('Sueter Lisboa','Negro','M',0,0), ('Sueter Lisboa','Negro','L',0,0),
                             ('Sueter Lisboa','Negro','XL',0,0), ('Sueter Lisboa','Negro','XXL',0,0),
                             ('Sueter Lisboa','Rojo','M',0,0), ('Sueter Lisboa','Rojo','M',0,0), ('Sueter Lisboa','Rojo','L',0,0),
                             ('Sueter Lisboa','Rojo','XL',0,0), ('Sueter Lisboa','Rojo','XXL',0,0),

                             ('Sueter Aitana','Negro','M',0,0), ('Sueter Aitana','Negro','L',0,0),
                             ('Sueter Aitana','Negro','XL',0,0), ('Sueter Aitana','Negro','XXL',0,0),
                             ('Sueter Aitana','Rosa','M',0,0), ('Sueter Aitana','Rosa','L',0,0),
                             ('Sueter Aitana','Rosa','XL',0,0), ('Sueter Aitana','Rosa','XXL',0,0),

                             ('Sueter Ibiza','Negro','S',0,0), ('Sueter Ibiza','Negro','M',0,0), ('Sueter Ibiza','Negro','L',0,0),
                             ('Sueter Ibiza','Negro','XL',0,0), ('Sueter Ibiza','Negro','XXL',0,0),
                             ('Sueter Ibiza','Gris claro','S',0,0), ('Sueter Ibiza','Gris claro','M',0,0), ('Sueter Ibiza','Gris claro','L',0,0),
                             ('Sueter Ibiza','Gris claro','XL',0,0), ('Sueter Ibiza','Gris claro','XXL',0,0),
                             ('Sueter Ibiza','Natural','S',0,0), ('Sueter Ibiza','Natural','M',0,0), ('Sueter Ibiza','Natural','L',0,0),
                             ('Sueter Ibiza','Natural','XL',0,0), ('Sueter Ibiza','Natural','XXL',0,0),
                             ('Sueter Ibiza','Rosa','S',0,0), ('Sueter Ibiza','Rosa','M',0,0), ('Sueter Ibiza','Rosa','L',0,0),
                             ('Sueter Ibiza','Rosa','XL',0,0), ('Sueter Ibiza','Rosa','XXL',0,0),

                             ('Tapado Anezka','Camel','M',0,0),
                             ('Tapado Anezka','Camel','XL',0,0), ('Tapado Anezka','Camel','XXL',0,0),
                             ('Tapado Anezka','Gris claro','M',0,0),
                             ('Tapado Anezka','Gris claro','XL',0,0), ('Tapado Anezka','Gris claro','XXL',0,0),
                             ('Tapado Anezka','Negro','M',0,0), ('Tapado Anezka','Negro','XL',0,0),

                             ('Sueter Amelia','Negro','M',0,0), ('Sueter Amelia','Negro','M',0,0), ('Sueter Amelia','Negro','L',0,0),
                             ('Sueter Amelia','Negro','XL',0,0), ('Sueter Amelia','Negro','XXL',0,0),
                             ('Sueter Amelia','Militar','M',0,0), ('Sueter Amelia','Militar','M',0,0), ('Sueter Amelia','Militar','L',0,0),
                             ('Sueter Amelia','Militar','XL',0,0), ('Sueter Amelia','Militar','XXL',0,0),
                             ('Sueter Amelia','Natural','M',0,0), ('Sueter Amelia','Natural','M',0,0), ('Sueter Amelia','Natural','L',0,0),
                             ('Sueter Amelia','Natural','XL',0,0), ('Sueter Amelia','Natural','XXL',0,0),

                             ('Buzo Manta Teddy','Beige','U',0,0), ('Buzo Manta Teddy','Gris oscuro','U',0,0),
                             ('Buzo Manta Teddy','Negro','U',0,0),

                             ('Vestido Indira','Negro','M',0,0), ('Vestido Indira','Negro','L',0,0),
                             ('Vestido Indira','Negro','XL',0,0), ('Vestido Indira','Negro','XXL',0,0),
                             ('Vestido Indira','Militar','M',0,0), ('Vestido Indira','Militar','L',0,0),
                             ('Vestido Indira','Militar','XL',0,0), ('Vestido Indira','Militar','XXL',0,0),

                             ('Sueter Ponchiito Nabi','Gris','U',0,0), ('Sueter Ponchiito Nabi','Marron','U',0,0),

                             ('Vestido Bianka','Negro','M',0,0), ('Vestido Bianka','Negro','L',0,0),
                             ('Vestido Bianka','Negro','XL',0,0), ('Vestido Bianka','Negro','XXL',0,0),
                             ('Vestido Bianka','Marron','M',0,0), ('Vestido Bianka','Marron','L',0,0),
                             ('Vestido Bianka','Marron','XL',0,0), ('Vestido Bianka','Marron','XXL',0,0),
                             ('Vestido Bianka','Militar','M',0,0), ('Vestido Bianka','Militar','L',0,0),
                             ('Vestido Bianka','Militar','XL',0,0), ('Vestido Bianka','Militar','XXL',0,0),
                             ('Vestido Bianka','Natural','L',0,0),
                             ('Vestido Bianka','Natural','XL',0,0), ('Vestido Bianka','Natural','XXL',0,0),

                             ('Tapado Julieth','Beige','U',0,0), ('Tapado Julieth','Gris claro','U',0,0),
                             ('Tapado Julieth','Negro','U',0,0),

                             ('Tapado Roma','Camel','U',0,0), ('Tapado Roma','Gris','U',0,0),
                             ('Tapado Roma','Habano','U',0,0), ('Tapado Roma','Natural','U',0,0), ('Tapado Roma','Negro','U',0,0);
