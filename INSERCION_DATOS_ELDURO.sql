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

INSERT INTO Factura (fecha_expedicion) VALUES ('12-03-2024');
INSERT INTO Gasto (id_cliente, id_tarifa, fecha, descuento, factura) VALUES ('gemma_sn', 2, '15-04-2024', 10, 1);
INSERT INTO Gasto (id_cliente, id_tarifa, descuento, factura) VALUES ('gemma_sn', 3, 10, 1);

INSERT INTO Factura (fecha_expedicion) VALUES ('15-03-2024');
INSERT INTO Gasto (id_cliente, id_tarifa, fecha, descuento, factura) VALUES ('maria_gt', 1, '15-03-2024', 25, 2);

INSERT INTO Factura DEFAULT VALUES;
INSERT INTO Gasto (id_cliente, id_tarifa, descuento, factura) VALUES ('pablo_tl', 1, 5, 3);

INSERT INTO Factura DEFAULT VALUES;
INSERT INTO Gasto (id_cliente, id_tarifa, descuento, factura) VALUES ('edgar_mn', 4, 45, 4);

INSERT INTO Contrato (tipo, id_profesor, fecha_firma, tipo_jornada, rango_horario) VALUES ('Fijo', 'hamza_lm', '30-12-2023', 'Completo', 'Mañana');
INSERT INTO Contrato (tipo, id_profesor, fecha_firma, tipo_jornada, rango_horario) VALUES ('Fijo', 'denis_rc', '12-01-2024', 'Completo', 'Tarde');
INSERT INTO Contrato (tipo, id_profesor, tipo_jornada, rango_horario) VALUES ('Formacion', 'alfredo_sg', 'Completo', 'Tarde');
INSERT INTO Contrato (tipo, id_profesor, tipo_jornada, rango_horario) VALUES ('Fijo Discontinuo', 'judith_mm', 'Parcial', 'Mañana');

INSERT INTO Salario (id_profesor, id_contrato, fecha_salario) VALUES ('hamza_lm', 1, '31-01-2024');
INSERT INTO Salario (id_profesor, id_contrato, fecha_salario) VALUES ('hamza_lm', 1, '29-02-2024');
INSERT INTO Salario (id_profesor, id_contrato, fecha_salario) VALUES ('hamza_lm', 1, '31-03-2024');
INSERT INTO Salario (id_profesor, id_contrato) VALUES ('hamza_lm', 1);

INSERT INTO Salario (id_profesor, id_contrato, fecha_salario) VALUES ('denis_rc', 2, '29-02-2024');
INSERT INTO Salario (id_profesor, id_contrato, fecha_salario) VALUES ('denis_rc', 2, '31-03-2024');
INSERT INTO Salario (id_profesor, id_contrato) VALUES ('denis_rc', 2);

INSERT INTO Actividad (nombre, descripcion, tipo) VALUES ('Body balance', 'Esta actividad fortalece los múculos y relaja el estrés de la vida diaria', 'Fisico-Mental');
INSERT INTO Actividad (nombre, descripcion, tipo) VALUES ('Zumba', 'Con esta actividad se realiza cardio usando el baile como principal herramienta', 'Fisica');
INSERT INTO Actividad (nombre, descripcion, tipo) VALUES ('Pilates', 'Esta actividad fortalece los múculos y relaja el estrés de la vida diaria', 'Fisico-Mental');
INSERT INTO Actividad (nombre, descripcion, tipo) VALUES ('Yoga', 'Esta actividad fortalece los múculos y relaja el estrés de la vida diaria', 'Fisico-Mental');
INSERT INTO Actividad (nombre, descripcion, tipo) VALUES ('Body Attack', 'Esta actividad se basa en trabajar movimientos de defensa personal', 'Fisica');

INSERT INTO Grupo (id_actividad) VALUES (2);
INSERT INTO Grupo (id_actividad) VALUES (3);
INSERT INTO Grupo (id_actividad) VALUES (1);
INSERT INTO Grupo (id_actividad) VALUES (4);
INSERT INTO Grupo (id_actividad) VALUES (4);
INSERT INTO Grupo (id_actividad) VALUES (5);

INSERT INTO Grupo_tiene_profesor (id_grupo, id_usuario) VALUES (1, 'judith_mm');
INSERT INTO Grupo_tiene_profesor (id_grupo, id_usuario) VALUES (2, 'denis_rc');
INSERT INTO Grupo_tiene_profesor (id_grupo, id_usuario) VALUES (3, 'hamza_lm');
INSERT INTO Grupo_tiene_profesor (id_grupo, id_usuario) VALUES (4, 'hamza_lm');
INSERT INTO Grupo_tiene_profesor (id_grupo, id_usuario) VALUES (5, 'denis_rc');
INSERT INTO Grupo_tiene_profesor (id_grupo, id_usuario) VALUES (6, 'alfredo_sg');

INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (1, 'edgar_mn');
INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (1, 'pablo_tl');
INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (1, 'maria_gt');
INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (1, 'gemma_sn');

INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (2, 'gemma_sn');
INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (2, 'pablo_tl');
INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (2, 'gustavo_cg');

INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (3, 'gustavo_cg');
INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (3, 'pablo_tl');
INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (3, 'edgar_mn');

INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (4, 'maria_gt');
INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (4, 'pablo_tl');
INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (4, 'edgar_mn');
INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (4, 'gemma_sn');

INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (5, 'pablo_tl');
INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (5, 'edgar_mn');
INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (5, 'maria_gt');

INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (6, 'gemma_sn');
INSERT INTO Grupo_tiene_cliente (id_grupo, id_usuario) VALUES (6, 'gustavo_cg');

INSERT INTO Aula DEFAULT VALUES;
INSERT INTO Aula DEFAULT VALUES;
INSERT INTO Aula DEFAULT VALUES;
INSERT INTO Aula DEFAULT VALUES;
INSERT INTO Aula DEFAULT VALUES;
INSERT INTO Aula DEFAULT VALUES;
INSERT INTO Aula DEFAULT VALUES;
INSERT INTO Aula DEFAULT VALUES;
INSERT INTO Aula DEFAULT VALUES;
INSERT INTO Aula DEFAULT VALUES;
INSERT INTO Aula DEFAULT VALUES;
INSERT INTO Aula DEFAULT VALUES;



INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (1, 'Step', '24-03-2024', 'Paso que sirve para hacer ejercicios simulando que subes un paso de escalera');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (1, 'Step', '24-03-2024', 'Paso que sirve para hacer ejercicios simulando que subes un paso de escalera');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (1, 'Step', '24-03-2024', 'Paso que sirve para hacer ejercicios simulando que subes un paso de escalera');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (1, 'Step', '24-03-2024', 'Paso que sirve para hacer ejercicios simulando que subes un paso de escalera');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (1, 'Step', '24-03-2024', 'Paso que sirve para hacer ejercicios simulando que subes un paso de escalera');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (1, 'Step', '24-03-2024', 'Paso que sirve para hacer ejercicios simulando que subes un paso de escalera');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (1, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (1, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (1, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (1, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (1, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (1, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');


INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (3, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (3, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (3, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (3, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (3, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (3, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (3, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (3, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (3, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (3, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (3, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (3, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');

INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (7, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (7, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (7, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (7, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (7, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (7, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (7, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (7, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (7, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (7, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (7, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (7, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');

INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (8, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (8, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (8, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (8, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (8, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (8, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (8, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (8, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (8, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (8, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (8, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (8, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');

INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (10, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (10, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (10, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (10, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (10, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (10, 'Pelota Pilates', '03-12-2023', 'Pelota que sirve para su utilizacion en Pilates, así como en otros deportes');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (10, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (10, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (10, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (10, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (10, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (10, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');

INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (12, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (12, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (12, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (12, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (12, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (12, 'Esterilla', '11-02-2024', 'Espuma que sirve para hacer ejercicios en el suelo');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (12, 'Saco de boxeo', '22-11-2023', 'Saco con arena para poder entrar boxeo u otras artes marciales');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (12, 'Saco de boxeo', '22-11-2023', 'Saco con arena para poder entrar boxeo u otras artes marciales');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (12, 'Saco de boxeo', '22-11-2023', 'Saco con arena para poder entrar boxeo u otras artes marciales');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (12, 'Saco de boxeo', '22-11-2023', 'Saco con arena para poder entrar boxeo u otras artes marciales');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (12, 'Saco de boxeo', '22-11-2023', 'Saco con arena para poder entrar boxeo u otras artes marciales');
INSERT INTO Equipamiento (id_aula, nombre, fecha_mantenimiento, descripcion) VALUES (12, 'Saco de boxeo', '22-11-2023', 'Saco con arena para poder entrar boxeo u otras artes marciales');

INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (1, 1, '2024-01-25 09:30:00', '2024-01-25 11:30:00', 'Clase de Zumba');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (3, 2, '2024-01-28 09:30:00', '2024-01-28 12:30:00', 'Clase de Pilates');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (2, 3, '2024-02-16 09:30:00', '2024-02-16 10:30:00', 'Clase de Body Balance');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (9, 4, '2024-03-22 10:30:00', '2024-03-22 12:30:00', 'Clase de Yoga');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (7, 5, '2024-03-23 16:30:00', '2024-03-23 18:30:00', 'Clase de Yoga');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (12, 6, '2024-03-23 17:00:00', '2024-03-23 18:30:00', 'Clase de Body Attack');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (10, 1, '2024-03-23 17:30:00', '2024-03-23 19:30:00', 'Clase de Zumba');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (8, 1, '2024-04-10 09:30:00', '2024-04-10 12:00:00', 'Clase de Zumba');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (1, 4, '2024-04-15 10:30:00', '2024-04-15 12:30:00', 'Clase de Yoga');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (4, 6, '2024-04-15 09:30:00', '2024-04-15 12:00:00', 'Clase de Body Attack');

INSERT INTO Especialidad (id_profesor, tipo) VALUES ('judith_mm', 'Cardio');
INSERT INTO Especialidad (id_profesor, tipo) VALUES ('judith_mm', 'Yoga');
INSERT INTO Especialidad (id_profesor, tipo) VALUES ('judith_mm', 'Pilates');
INSERT INTO Especialidad (id_profesor, tipo) VALUES ('denis_rc', 'Fuerza');
INSERT INTO Especialidad (id_profesor, tipo) VALUES ('denis_rc', 'Resistencia');
INSERT INTO Especialidad (id_profesor, tipo) VALUES ('alfredo_sg', 'Zumba');
INSERT INTO Especialidad (id_profesor, tipo) VALUES ('hamza_lm', 'Cardio');
INSERT INTO Especialidad (id_profesor, tipo) VALUES ('hamza_lm', 'Flexibilidad');
INSERT INTO Especialidad (id_profesor, tipo) VALUES ('alfredo_sg', 'Boxeo');
INSERT INTO Especialidad (id_profesor, tipo) VALUES ('denis_rc', 'Boxeo');

