use AkirasBoutiques
go

select * from categoria
select * from cliente
select * from detalle
select * from factura
select * from producto

CREATE TABLE [dbo].[Sucursal](
    [id_sucursal] [int] NOT NULL,
    [nombre_sucursal] [varchar](255) NOT NULL,
    [nombre_encargado] [varchar](255) NOT NULL,
    [direccion] [varchar](255) NOT NULL,
    [telefono] [varchar](20) NOT NULL, 
    [ciudad] [varchar](100) NOT NULL,
    [estado] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
    [id_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

select * from Sucursal

INSERT INTO [dbo].[Sucursal] ([id_sucursal], [nombre_sucursal], [nombre_encargado], [direccion], [telefono], [ciudad], [estado]) VALUES 
(1, 'Akira''s Boutique: Las Mercedes', 'Sonia Alejandra Fernández Moreno', 'Calle Roble #507 Fracc. Las Mercedes', '444 783 1225', 'San Luis Potosí', 'San Luis Potosí'),
(2, 'Akira''s Boutique: Obraje', 'Fernando Jesús Díaz de León Ayala', 'Calle Dr. Calderón #438 col. Obraje', '449 378 0921', 'Aguascalientes', 'Aguascalientes'),
(3, 'Akira''s Boutique: Galerías Mazatlán', 'Daniela Fernanda Díaz Ordaz', 'Av. de la Marina #6204, Marina, local 35', '669 293 2059', 'Mazatlán', 'Sinaloa'),
(4, 'Akira''s Boutique: Zapopan', 'Mario Alberto Jiménez Salcido', 'Av. Manuel J. Clouthier 525 col. Benito Juárez', '333 784 1230', 'Zapopan', 'Jalisco'),
(5, 'Akira''s Boutique: Melchor Ocampo', 'Yesenia Guadalupe Campos Rojo', 'Av. Melchor Ocampo #2528 Zona Centro', '614 390 6721', 'Chihuahua', 'Chihuahua'),
(6, 'Akira''s Boutique: Constitución', 'Tamara Alejandra Bernal Ramos', 'Calle Constitución #106 Zona Centro', '618 196 2954', 'Durango', 'Durango'),
(7, 'Akira''s Boutique: Centro Zacatecas', 'Samuel Enrique Barrios Enciso', 'Av. Hidalgo #338 Centro', '492 930 1250', 'Zacatecas', 'Zacatecas');
GO

CREATE TABLE [dbo].[Empleado](
    [id_empleado] [int] NOT NULL,
    [nombre] [varchar](255) NOT NULL,
    [direccion] [varchar](255) NOT NULL,
    [telefono] [varchar](20) NOT NULL,
    [edad] [int] NOT NULL,
    [email] [varchar](100) NOT NULL, 
    [contrasena] [varchar](100) NOT NULL, 
    [id_sucursal] [int] NOT NULL, 
PRIMARY KEY CLUSTERED 
(
    [id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

select * from Empleado


INSERT INTO [dbo].[Empleado] ([id_empleado], [nombre], [direccion], [telefono], [edad], [email], [contrasena], [id_sucursal]) VALUES 
(1, 'Sonia Alejandra Fernández Moreno (Encargada)', 'Calle Roble #507 Fracc. Las Mercedes', '4447831225', 35, 'sonia.f@akiras.com', 'Paso123.', 1),
(2, 'Ricardo Pérez Gómez', 'Calle Principal #101 Col. Centro', '4441234567', 28, 'ricardo.p@akiras.com', 'RicPez.', 1),
(3, 'Laura Torres Soto', 'Av. Juárez #202 Fracc. Lomas', '4449876543', 24, 'laura.t@akiras.com', 'LaurrT.', 1),
(4, 'José Luis Hernández', 'Blvd. Río Santiago #303 Col. San Ángel', '4445551234', 31, 'jose.h@akiras.com', 'JosLuiz.', 1),
(5, 'Mónica Salazar Díaz', 'Calle 5 de Mayo #404 Centro', '4446789012', 29, 'monica.s@akiras.com', 'MoniSal.', 1),
(6, 'Javier Ruíz Castillo', 'Av. Carranza #505 Fracc. El Sol', '4443456789', 22, 'javier.r@akiras.com', 'JaviCas.', 1),
(7, 'Fernando Jesús Díaz de León Ayala (Encargado)', 'Calle Dr. Calderón #438 col. Obraje', '4493780921', 40, 'fernando.d@akiras.com', 'Paso123.', 2),
(8, 'Adriana López Vega', 'Calle Gral. Barragán #101 Zona Centro', '4491112233', 27, 'adriana.l@akiras.com', 'AdriLo.', 2),
(9, 'Carlos Mendoza Gil', 'Av. Universidad #202 Fracc. Del Parque', '4492223344', 33, 'carlos.m@akiras.com', 'CarlMen.', 2),
(10, 'Elena Flores Castro', 'Blvd. Adolfo Ruíz Cortines #303 Col. Fátima', '4493334455', 25, 'elena.f@akiras.com', 'EleeFlo.', 2),
(11, 'Guillermo Ortiz Nájera', 'Calle Independencia #404 Centro', '4494445566', 30, 'guillermo.o@akiras.com', 'GuilOrt.', 2),
(12, 'Silvia Ramos Ibarra', 'Av. De la Convención #505 Fracc. Jardines', '4495556677', 26, 'silvia.r@akiras.com', 'SilRam.', 2),
(13, 'Daniela Fernanda Díaz Ordaz (Encargada)', 'Av. de la Marina #6204, Marina, local 35', '6692932059', 32, 'daniela.d@akiras.com', 'Paso123.', 3),
(14, 'Héctor Sánchez Vargas', 'Av. Sábalo Cerritos #101 Fracc. Playa Sur', '6691231234', 38, 'hector.s@akiras.com', 'HecSan.', 3),
(15, 'Isabel Gutiérrez Luna', 'Calle Ángel Flores #202 Col. Centro', '6692342345', 23, 'isabel.g@akiras.com', 'IsaGut.', 3),
(16, 'Juan Manuel Ríos Torres', 'Paseo Claussen #303 Fracc. Lomas', '6693453456', 29, 'juan.r@akiras.com', 'JuanRio.', 3),
(17, 'Karla Núñez Soto', 'Av. Reforma #404 Col. Juárez', '6694564567', 26, 'karla.n@akiras.com', 'KarlaNu.', 3),
(18, 'Luis Alberto Vega Mora', 'Calle Aquiles Serdán #505 Centro', '6695675678', 31, 'luis.v@akiras.com', 'LuisVeg.', 3),
(19, 'Mario Alberto Jiménez Salcido (Encargado)', 'Av. Manuel J. Clouthier 525 col. Benito Juárez', '3337841230', 45, 'mario.j@akiras.com', 'Paso123.', 4),
(20, 'Nancy Palacios Ruiz', 'Av. Patria #101 Col. Providencia', '3331112233', 28, 'nancy.p@akiras.com', 'NanPal.', 4),
(21, 'Óscar Quiróz Marín', 'Calle 2 #202 Fracc. Jardines del Valle', '3332223344', 35, 'oscar.q@akiras.com', 'OscQui.', 4),
(22, 'Patricia Soto Herrera', 'Blvd. Puerta de Hierro #303 Col. Puerta de Hierro', '3333334455', 24, 'patricia.s@akiras.com', 'PatrSot.', 4),
(23, 'Raúl Tapia Valdés', 'Av. Américas #404 Col. Santa Rita', '3334445566', 30, 'raul.t@akiras.com', 'RaulTap.', 4),
(24, 'Sofía Urías Pérez', 'Calle Monte Casino #505 Col. Virreyes', '3335556677', 27, 'sofia.u@akiras.com', 'SofiUri.', 4),
(25, 'Yesenia Guadalupe Campos Rojo (Encargada)', 'Av. Melchor Ocampo #2528 Zona Centro', '6143906721', 37, 'yesenia.c@akiras.com', 'Paso123.', 5),
(26, 'Tomás Vázquez Salas', 'Av. Juárez #101 Col. Centro', '6141234567', 42, 'tomas.v@akiras.com', 'TomsVas.', 5),
(27, 'Úrsula Wong Zepeda', 'Calle Victoria #202 Fracc. Los Arcos', '6149876543', 26, 'ursula.w@akiras.com', 'UrsWon.', 5),
(28, 'Víctor Yáñez Bravo', 'Blvd. Ortiz Mena #303 Col. Campestre', '6145551234', 34, 'victor.y@akiras.com', 'VicYan.', 5),
(29, 'Wendy Zavala Cruz', 'Av. Teófilo Borunda #404 Col. San Felipe', '6146789012', 29, 'wendy.z@akiras.com', 'WenZav.', 5),
(30, 'Xavier Ávila Bernal', 'Calle Aldama #505 Centro', '6143456789', 31, 'xavier.a@akiras.com', 'XavAvi.', 5),
(31, 'Tamara Alejandra Bernal Ramos (Encargada)', 'Calle Constitución #106 Zona Centro', '6181962954', 30, 'tamara.b@akiras.com', 'Paso123.', 6),
(32, 'Yolanda Dávila Espinoza', 'Av. 20 de Noviembre #101 Centro', '6181112233', 25, 'yolanda.d@akiras.com', 'YolDav.', 6),
(33, 'Ángel Franco Gómez', 'Calle Negrete #202 Col. Guadalupe', '6182223344', 36, 'angel.f@akiras.com', 'AngFra.', 6),
(34, 'Brenda Ibarra Juárez', 'Blvd. Felipe Pescador #303 Fracc. Los Remedios', '6183334455', 22, 'brenda.i@akiras.com', 'BreIba.', 6),
(35, 'César Lara Montes', 'Av. La Salle #404 Col. Fátima', '6184445566', 33, 'cesar.l@akiras.com', 'CesLar.', 6),
(36, 'Diana Navarro Ochoa', 'Calle Volantín #505 Col. Jardines', '6185556677', 28, 'diana.n@akiras.com', 'DiaNav.', 6),
(37, 'Samuel Enrique Barrios Enciso (Encargado)', 'Av. Hidalgo #338 Centro', '4929301250', 40, 'samuel.b@akiras.com', 'Paso123.', 7),
(38, 'Erika Ponce Quintero', 'Av. Hidalgo #101 Centro', '4921234567', 29, 'erika.p@akiras.com', 'EriPon.', 7),
(39, 'Felipe Rivera Soto', 'Calle Tacuba #202 Col. Lomas de la Soledad', '4929876543', 37, 'felipe.r@akiras.com', 'FelRiv.', 7),
(40, 'Gloria Torres Vázquez', 'Blvd. Adolfo López Mateos #303 Col. Centro Histórico', '4925551234', 24, 'gloria.t@akiras.com', 'GloTor.', 7),
(41, 'Hugo Uribe Xamán', 'Av. Morelos #404 Col. Sierra de Álica', '4926789012', 32, 'hugo.u@akiras.com', 'HugUri.', 7),
(42, 'Irene Velasco Yáñez', 'Calle Alameda #505 Col. El Orito', '4923456789', 27, 'irene.v@akiras.com', 'IreVel.', 7);
GO

ALTER TABLE [dbo].[Empleado] WITH CHECK ADD CONSTRAINT [FK_Empleado_Sucursal] FOREIGN KEY([id_sucursal]) 
REFERENCES [dbo].[Sucursal] ([id_sucursal])
GO

ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Sucursal]
GO

SELECT
    id_sucursal AS ID,
    nombre_sucursal AS Sucursal,
    nombre_encargado AS Encargado,
    ciudad AS Ciudad
FROM
    Sucursal

SELECT
    E.nombre AS Nombre_Empleado,
    E.email AS Correo_Empleado,
    S.nombre_sucursal AS Pertenece_a_Sucursal
FROM
    Empleado E
INNER JOIN
    Sucursal S ON E.id_sucursal = S.id_sucursal
ORDER BY
    S.id_sucursal, E.nombre;


SELECT
    S.nombre_sucursal AS Sucursal,
    COUNT(E.id_empleado) AS Total_Empleados
FROM
    Sucursal S
INNER JOIN
    Empleado E ON S.id_sucursal = E.id_sucursal
GROUP BY
    S.nombre_sucursal
ORDER BY
    Total_Empleados DESC;


SELECT
    E.nombre AS Nombre_Encargado,
    E.telefono AS Telefono_Contacto,
    S.nombre_sucursal AS Sucursal_Asignada,
    S.direccion AS Direccion_Sucursal
FROM
    Empleado E
INNER JOIN
    Sucursal S ON E.id_sucursal = S.id_sucursal
WHERE
    E.nombre LIKE '%(Encargad%'