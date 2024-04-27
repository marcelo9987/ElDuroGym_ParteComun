SELECT setval ('persona_id_persona_seq', 1, false);
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



INSERT INTO Persona (nickname, nombre, dni, correo, domicilio, contrasenha) VALUES ('david_bp', 'David Blanco Peña', '46289271T', 'david.blanco@usc.es', 'Lugar de Penelas, 65, Teo, 15883, A Coruña', 'c0k68skay5yfsgTacWVt8Q==');                                             -- USC.usc.1234
INSERT INTO Persona (nickname, nombre, dni, correo, domicilio, contrasenha) VALUES ('quique_ar', 'Quique Alvarez Ramirez', '49277908V', 'quique.alvarez@usc.es', 'Calle Angosto, 78, Jimena, 23530, Jaen ', 'c0k68skay5yfsgTacWVt8Q==');                                        -- USC.usc.1234
INSERT INTO Persona (nickname, nombre, dni, correo, domicilio, contrasenha) VALUES ('alejandro_gg', 'Alejandro Garcia Garcia', '54971489V', 'alejandro.garcia@usc.es', 'Antonio, Vazquez, 46, Arona, 38640, Tenerife', 'c0k68skay5yfsgTacWVt8Q==');                             -- USC.usc.1234
INSERT INTO Persona (nickname, nombre, dni, correo, domicilio, contrasenha) VALUES ('marcelo_mf', 'Marcelo Muñoz Fort', '07790503N', 'marcelo.muñoz@usc.es', 'Plaza Colon, 8, Nieva de Cameros, 26124, La Rioja', 'c0k68skay5yfsgTacWVt8Q==');                                  -- USC.usc.1234

INSERT INTO Persona (nickname, nombre, dni, correo, domicilio, contrasenha) VALUES ('hamza_lm', 'Hamza Lozano Martinez', '63333716L', 'hamza.lozano@gmail.com', 'C. de la República de El Salvador, 13, Santiago de Compostela, 15701, A Coruña', '1beTkg054Y4DpGFuVygiwg=='); -- xlBJy$!obNrBv
INSERT INTO Persona (nickname, nombre, dni, correo, domicilio, contrasenha) VALUES ('denis_rc', 'Denis Riera Camaño', '13348012P', 'denis.riera@gmail.com', 'C. Dos de Mayo, 15, Ponferrada, 24400, León', 'EYLNLX67K8g/0ggYh6/LqQ==');                                        -- x&L#MNhCYGw+Y
INSERT INTO Persona (nickname, nombre, dni, correo, domicilio, contrasenha) VALUES ('alfredo_sg', 'Alfredo Seoane Gomez', '07996160A', 'alfredor.seoane@gmail.com', 'C. de Manuel Gómez Oria, 6, Alcobendas, 28100, Madrid', 'TrvIhuuTYdMCP399QGunzQ==');                      -- ,eJ@yhpV]%E}(
INSERT INTO Persona (nickname, nombre, dni, correo, domicilio, contrasenha) VALUES ('judith_mm', 'Judith Miguez Menendez', '83807237K', 'judith.miguez@gmail.com', 'C. de Gómez de Baquero, 18, Centro, 28004, Madrid', 'Tkt2zZizl5S841IIDmJ0Jw==');                           -- +Q6Aph@on~Tw#

INSERT INTO Persona (nickname, nombre, dni, correo, domicilio, contrasenha) VALUES ('gemma_sn', 'Gemma Serrano Narvaez', '27467279N', 'gemma.serrano@gmail.com', 'C. de Girona, 83, L`Eixample, 08009, Barcelona', 'daSjkNu3VQoc/2Ks3TFIxQ==');                                -- e((52u6x.fxw
INSERT INTO Persona (nickname, nombre, dni, correo, domicilio, contrasenha) VALUES ('gustavo_cg', 'Gustavo Cid Gutierrez', '73445223J', 'gustavo.cid@gmail.com', 'C. Juan XXIII, 12, L`Hospitalet de Llobregat, 08901, Barcelona', 'CzMRWECZNMrDqn1GURilyA==');                -- Q&d3gfldgzK8q
INSERT INTO Persona (nickname, nombre, dni, correo, domicilio, contrasenha) VALUES ('maria_gt', 'Maria Gloria Tejo', '01474923W', 'maria.gloria@gmail.com', 'C. de Millares, 8, Jesús, 46007, Valencia', '2a92rXX3r6Il2nNoEgTKOQ==');                                          -- ,csA,T.n^VapF
INSERT INTO Persona (nickname, nombre, dni, correo, domicilio, contrasenha) VALUES ('pablo_tl', 'Pablo Trillo Louzao', '17316116Z', 'pablo.trillo@gmail.com', 'C. Echegaray, 1, Nervión, 41005 Sevilla', 'G3J1vhuZZEatbF9kAdj+hQ==');                                          -- vCBc5LEHOE;kD
INSERT INTO Persona (nickname, nombre, dni, correo, domicilio, contrasenha) VALUES ('edgar_mn', 'Edgar Moreno Navarro', '28812101R', 'edgar.moreno@gmail.com', 'C. Sta. Justa, 5, Centro, Gijón, 33208, Asturias', 'MkVK2XAaAFUfdlk/r0BLfw==');                                           -- Ks!KL$kLBl}+c

INSERT INTO Administrador (id_administrador) VALUES (1);
INSERT INTO Administrador (id_administrador) VALUES (2);
INSERT INTO Administrador (id_administrador) VALUES (3);
INSERT INTO Administrador (id_administrador) VALUES (4);

INSERT INTO Profesor  (id_profesor, num_seguridad_social) VALUES (5, '447578338775');
INSERT INTO Profesor  (id_profesor, num_seguridad_social) VALUES (6, '254742149930');
INSERT INTO Profesor  (id_profesor, num_seguridad_social) VALUES (7, '387601821464');
INSERT INTO Profesor  (id_profesor, num_seguridad_social) VALUES (8, '376586189953');

INSERT INTO Cliente (id_cliente) VALUES (9);
INSERT INTO Cliente (id_cliente) VALUES (10);
INSERT INTO Cliente (id_cliente) VALUES (11);
INSERT INTO Cliente (id_cliente) VALUES (12);
INSERT INTO Cliente (id_cliente) VALUES (13);

INSERT INTO Tarifa (tipo, descripcion, importe, duracion) VALUES ('Bronze', 'Tarifa que le permite al usuario acceder a las instalaciones de musculacion', 24.50, 30);
INSERT INTO Tarifa (tipo, descripcion, importe, duracion) VALUES ('Silver', 'Tarifa que le permite al usuario acceder a las instalaciones de musculacion y natacion', 32.60, 30);
INSERT INTO Tarifa (tipo, descripcion, importe, duracion) VALUES ('Gold', 'Tarifa que le permite al usuario acceder a las instalaciones de musculacion, natacion y disponibilidad de fisioterapeuta gratuito', 61.90, 30);
INSERT INTO Tarifa (tipo, descripcion, importe, duracion) VALUES ('Titanium', 'Tarifa que le permite al usuario acceder a las instalaciones de musculacion, natacion y disponibilidad de fisioterapeuta gratuito, además de poder disfrutar del restaurante de manera gratuita', 125.40, 30);

INSERT INTO Factura (fecha_expedicion) VALUES ('12-03-2024');
INSERT INTO Gasto (id_cliente, id_tarifa, fecha, descuento, id_factura) VALUES (9, 2, '15-04-2024', 10, 1);
INSERT INTO Gasto (id_cliente, id_tarifa, descuento, id_factura) VALUES (9, 3, 10, 1);

INSERT INTO Factura (fecha_expedicion) VALUES ('15-03-2024');
INSERT INTO Gasto (id_cliente, id_tarifa, fecha, descuento, id_factura) VALUES (11, 1, '15-03-2024', 25, 2);

INSERT INTO Factura DEFAULT VALUES;
INSERT INTO Gasto (id_cliente, id_tarifa, descuento, id_factura) VALUES (12, 1, 5, 3);

INSERT INTO Factura DEFAULT VALUES;
INSERT INTO Gasto (id_cliente, id_tarifa, descuento, id_factura) VALUES (13, 4, 45, 4);

INSERT INTO Contrato (tipo, id_profesor, fecha_firma, tipo_jornada, rango_horario) VALUES ('Fijo', 5, '30-12-2023', 'Completo', 'Mañana');
INSERT INTO Contrato (tipo, id_profesor, fecha_firma, tipo_jornada, rango_horario) VALUES ('Fijo', 6, '12-01-2024', 'Completo', 'Tarde');
INSERT INTO Contrato (tipo, id_profesor, tipo_jornada, rango_horario) VALUES ('Formacion', 7, 'Completo', 'Tarde');
INSERT INTO Contrato (tipo, id_profesor, tipo_jornada, rango_horario) VALUES ('Fijo Discontinuo', 8, 'Parcial', 'Mañana');

INSERT INTO Salario (id_contrato, fecha_salario) VALUES (1, '31-01-2024');
INSERT INTO Salario (id_contrato, fecha_salario) VALUES (1, '29-02-2024');
INSERT INTO Salario (id_contrato, fecha_salario) VALUES (1, '31-03-2024');
INSERT INTO Salario (id_contrato) VALUES (1);

INSERT INTO Salario (id_contrato, fecha_salario) VALUES (2, '29-02-2024');
INSERT INTO Salario (id_contrato, fecha_salario) VALUES (2, '31-03-2024');
INSERT INTO Salario (id_contrato) VALUES (2);

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

INSERT INTO Grupo_tiene_profesor (id_grupo, id_profesor) VALUES (1, 8);
INSERT INTO Grupo_tiene_profesor (id_grupo, id_profesor) VALUES (2, 6);
INSERT INTO Grupo_tiene_profesor (id_grupo, id_profesor) VALUES (3, 5);
INSERT INTO Grupo_tiene_profesor (id_grupo, id_profesor) VALUES (4, 5);
INSERT INTO Grupo_tiene_profesor (id_grupo, id_profesor) VALUES (5, 6);
INSERT INTO Grupo_tiene_profesor (id_grupo, id_profesor) VALUES (6, 7);

INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (1, 13);
INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (1, 12);
INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (1, 11);
INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (1, 9);

INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (2, 9);
INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (2, 12);
INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (2, 10);

INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (3, 10);
INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (3, 12);
INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (3, 13);

INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (4, 11);
INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (4, 12);
INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (4, 13);
INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (4, 9);

INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (5, 12);
INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (5, 13);
INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (5, 11);

INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (6, 9);
INSERT INTO Grupo_tiene_cliente (id_grupo, id_cliente) VALUES (6, 10);

INSERT INTO Aula (nombre, aforo) VALUES ('Aula_Madrid', 20);
INSERT INTO Aula (nombre, aforo) VALUES ('Aula_Tokio', 15);
INSERT INTO Aula (nombre, aforo) VALUES ('Aula_Berlin', 20);
INSERT INTO Aula (nombre, aforo) VALUES ('Aula_Roma', 10);
INSERT INTO Aula (nombre, aforo) VALUES ('Aula_Paris', 25);
INSERT INTO Aula (nombre, aforo) VALUES ('Aula_Oslo', 20);
INSERT INTO Aula (nombre, aforo) VALUES ('Aula_Atenas', 30);
INSERT INTO Aula (nombre, aforo) VALUES ('Aula_Lisboa', 22);
INSERT INTO Aula (nombre, aforo) VALUES ('Aula_Viena', 10);
INSERT INTO Aula (nombre, aforo) VALUES ('Aula_Londres', 15);
INSERT INTO Aula (nombre, aforo) VALUES ('Aula_Estocolmo', 15);
INSERT INTO Aula (nombre, aforo) VALUES ('Aula_Dublin', 18);
INSERT INTO Aula (nombre, aforo) VALUES ('Aula_Praga', 20);



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

INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio , fecha_hora_fin, descripcion) VALUES (1, 1, '2024-01-25 09:30:00', '2024-01-25 11:30:00', 'Clase de Zumba');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (3, 2, '2024-01-28 09:30:00', '2024-01-28 12:30:00', 'Clase de Pilates');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (2, 3, '2024-02-16 09:30:00', '2024-02-16 10:30:00', 'Clase de Body Balance');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (9, 4, '2024-03-22 10:30:00', '2024-03-22 12:30:00', 'Clase de Yoga');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (7, 5, '2024-03-23 16:30:00', '2024-03-23 18:30:00', 'Clase de Yoga');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (12, 6, '2024-03-23 17:00:00', '2024-03-23 18:30:00', 'Clase de Body Attack');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (10, 1, '2024-03-23 17:30:00', '2024-03-23 19:30:00', 'Clase de Zumba');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (8, 1, '2024-04-10 09:30:00', '2024-04-10 12:00:00', 'Clase de Zumba');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (1, 4, '2024-04-15 10:30:00', '2024-04-15 12:30:00', 'Clase de Yoga');
INSERT INTO Sesion (id_aula, id_grupo, fecha_hora_inicio, fecha_hora_fin, descripcion) VALUES (4, 6, '2024-04-15 09:30:00', '2024-04-15 12:00:00', 'Clase de Body Attack');

INSERT INTO Especialidad (id_profesor, nombre_especialidad) VALUES (8, 'Cardio');
INSERT INTO Especialidad (id_profesor, nombre_especialidad) VALUES (8, 'Yoga');
INSERT INTO Especialidad (id_profesor, nombre_especialidad) VALUES (8, 'Pilates');
INSERT INTO Especialidad (id_profesor, nombre_especialidad) VALUES (6, 'Fuerza');
INSERT INTO Especialidad (id_profesor, nombre_especialidad) VALUES (6, 'Resistencia');
INSERT INTO Especialidad (id_profesor, nombre_especialidad) VALUES (7, 'Zumba');
INSERT INTO Especialidad (id_profesor, nombre_especialidad) VALUES (5, 'Cardio');
INSERT INTO Especialidad (id_profesor, nombre_especialidad) VALUES (5, 'Flexibilidad');
INSERT INTO Especialidad (id_profesor, nombre_especialidad) VALUES (7, 'Boxeo');
INSERT INTO Especialidad (id_profesor, nombre_especialidad) VALUES (6, 'Boxeo');

