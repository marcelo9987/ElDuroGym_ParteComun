SELECT setval('actividad_id_actividad_seq', 1, false);
SELECT setval('aula_id_aula_seq', 1, false);
SELECT setval('contrato_id_contrato_seq', 1, false);
SELECT setval('equipamiento_id_equipamiento_seq', 1, false);
SELECT setval('factura_id_factura_seq', 1, false);
SELECT setval('gasto_id_gasto_seq', 1, false);
SELECT setval('grupo_id_grupo_seq', 1, false);
SELECT setval('salario_id_salario_seq', 1, false);
SELECT setval('sesion_id_reserva_seq', 1, false);
SELECT setval('tarifa_id_tarifa_seq', 1, false);



INSERT INTO Persona (id_usuario, nombre, dni, correo, domicilio, contraseña) VALUES ('david_bp', 'David Blanco Peña', '46289271T', 'david.blanco@usc.es', 'Lugar de Penelas, 65, Teo, 15883, A Coruña', 'USC.usc.1234');
INSERT INTO Persona (id_usuario, nombre, dni, correo, domicilio, contraseña) VALUES ('quique_ar', 'Quique Alvarez Ramirez', '49277908V', 'quique.alvarez@usc.es', 'Calle Angosto, 78, Jimena, 23530, Jaen ', 'USC.usc.1234');
INSERT INTO Persona (id_usuario, nombre, dni, correo, domicilio, contraseña) VALUES ('alejandro_gg', 'Alejandro Garcia Garcia', '54971489V', 'alejandro.garcia@usc.es', 'Antonio, Vazquez, 46, Arona, 38640, Tenerife', 'USC.usc.1234');
INSERT INTO Persona (id_usuario, nombre, dni, correo, domicilio, contraseña) VALUES ('marcelo_mf', 'Marcelo Muñoz Fort', '07790503N', 'marcelo.muñoz@usc.es', 'Plaza Colon, 8, Nieva de Cameros, 26124, La Rioja', 'USC.usc.1234');

INSERT INTO Persona (id_usuario, nombre, dni, correo, domicilio, contraseña) VALUES ('hamza_lm', 'Hamza Lozano Martinez', '63333716L', 'hamza.lozano@gmail.com', 'C. de la República de El Salvador, 13, Santiago de Compostela, 15701, A Coruña', 'xlBJy$!obNrBv');
INSERT INTO Persona (id_usuario, nombre, dni, correo, domicilio, contraseña) VALUES ('denis_rc', 'Denis Riera Camaño', '13348012P', 'denis.riera@gmail.com', 'C. Dos de Mayo, 15, Ponferrada, 24400, León', 'x&L#MNhCYGw+Y');
INSERT INTO Persona (id_usuario, nombre, dni, correo, domicilio, contraseña) VALUES ('alfredo_sg', 'Alfredo Seoane Gomez', '07996160A', 'alfredor.seoane@gmail.com', 'C. de Manuel Gómez Oria, 6, Alcobendas, 28100, Madrid', ',eJ@yhpV]%E}(');
INSERT INTO Persona (id_usuario, nombre, dni, correo, domicilio, contraseña) VALUES ('judith_mm', 'Judith Miguez Menendez', '83807237K', 'judith.miguez@gmail.com', 'C. de Gómez de Baquero, 18, Centro, 28004, Madrid', '+Q6Aph@on~Tw#');

INSERT INTO Persona (id_usuario, nombre, dni, correo, domicilio, contraseña) VALUES ('gemma_sn', 'Gemma Serrano Narvaez', '27467279N', 'gemma.serrano@gmail.com', 'C. de Girona, 83, L`Eixample, 08009, Barcelona', 'e((52u6x.fxw');
INSERT INTO Persona (id_usuario, nombre, dni, correo, domicilio, contraseña) VALUES ('gustavo_cg', 'Gustavo Cid Gutierrez', '73445223J', 'gustavo.cid@gmail.com', 'C. Juan XXIII, 12, L`Hospitalet de Llobregat, 08901, Barcelona', 'Q&d3gfldgzK8q');
INSERT INTO Persona (id_usuario, nombre, dni, correo, domicilio, contraseña) VALUES ('maria_gt', 'Maria Gloria Tejo', '01474923W', 'maria.gloria@gmail.com', 'C. de Millares, 8, Jesús, 46007, Valencia', ',csA,T.n^VapF');
INSERT INTO Persona (id_usuario, nombre, dni, correo, domicilio, contraseña) VALUES ('pablo_tl', 'Pablo Trillo Louzao', '17316116Z', 'pablo.trillo@gmail.com', 'C. Echegaray, 1, Nervión, 41005 Sevilla', 'vCBc5LEHOE;kD');
INSERT INTO Persona (id_usuario, nombre, dni, correo, domicilio, contraseña) VALUES ('edgar_mn', 'Edgar Moreno Navarro', '28812101R', 'edgar.moreno@gmail.com', 'C. Sta. Justa, 5, Centro, Gijón, 33208, Asturias', 'Ks!KL$kLBl}+c');

INSERT INTO Administrador (id_usuario) VALUES ('david_bp');
INSERT INTO Administrador (id_usuario) VALUES ('quique_ar');
INSERT INTO Administrador (id_usuario) VALUES ('alejandro_gg');
INSERT INTO Administrador (id_usuario) VALUES ('marcelo_mf');

INSERT INTO Profesor  (id_usuario, num_seguridad_social) VALUES ('hamza_lm', '447578338775');
INSERT INTO Profesor  (id_usuario, num_seguridad_social) VALUES ('denis_rc', '254742149930');
INSERT INTO Profesor  (id_usuario, num_seguridad_social) VALUES ('alfredo_sg', '387601821464');
INSERT INTO Profesor  (id_usuario, num_seguridad_social) VALUES ('judith_mm', '376586189953');

INSERT INTO Cliente (id_usuario) VALUES ('gemma_sn');
INSERT INTO Cliente (id_usuario) VALUES ('gustavo_cg');
INSERT INTO Cliente (id_usuario) VALUES ('maria_gt');
INSERT INTO Cliente (id_usuario) VALUES ('pablo_tl');
INSERT INTO Cliente (id_usuario) VALUES ('edgar_mn');

INSERT INTO Tarifa (tipo, descripcion, importe, duracion) VALUES ('Bronze', 'Tarifa que le permite al usuario acceder a las instalaciones de musculacion', 24.50, 30);
INSERT INTO Tarifa (tipo, descripcion, importe, duracion) VALUES ('Silver', 'Tarifa que le permite al usuario acceder a las instalaciones de musculacion y natacion', 32.60, 30);
INSERT INTO Tarifa (tipo, descripcion, importe, duracion) VALUES ('Gold', 'Tarifa que le permite al usuario acceder a las instalaciones de musculacion, natacion y disponibilidad de fisioterapeuta gratuito', 61.90, 30);
INSERT INTO Tarifa (tipo, descripcion, importe, duracion) VALUES ('Titanium', 'Tarifa que le permite al usuario acceder a las instalaciones de musculacion, natacion y disponibilidad de fisioterapeuta gratuito, además de poder disfrutar del restaurante de manera gratuita', 125.40, 30);




