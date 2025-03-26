
USE HappinessCo;
GO
--Insertamos los Usuarios
INSERT INTO Usuarios (nombre, email, password) VALUES
('Alma', 'almita@gmail.com', 'catartitos'),
('Ivan', 'ivancito@gmail.com', 'plunitos'),
('Vagabond', 'ronin@hotmail.com', 'lacaida123');


--Insertamos los Eventos
INSERT INTO Eventos (fecha, titulo, ubicacion, descripcion) VALUES
('2025-01-01', 'Feria de Muestras', 'Recinto ferial', 'Primera gran feria del año'),
('2025-01-12', 'Tsunami Xixon', 'Parking Feria de Muestras', 'LLegan grandes grupos de Gijon'),
('2025-01-24', 'Concierto de Rock en Vivo', 'Plaza ayuntamiento', 'Grupos local realizan concierto de rock'),
('2025-03-05', 'Fiesta de la Sidra', 'Playa de San Lorenzo', 'Intentar batir el record de escanciar sidra'),
('2025-03-15', 'Tarde en el Teatro', 'Teatro Jovellanos', 'Obras de grupos de teatro tanto local como nacional'),
('2025-03-25', 'Concierto NWNF', 'La laboral', 'Toca grupo NWNF en la laboral');


--Insertamos las Galerias
INSERT INTO Galerias (titulo, id_evento) VALUES
('Galería Feria', 1),
('Galería Tsunami', 2),
('Galería Concierto', 3);


--Insertamos las Imagenes de las Galerias
-- Para la galería de la Feria Muestras 
INSERT INTO Imagenes (titulo, imagen, id_galeria) VALUES
('Entrada', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formación\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\feria.jpg"', 1),
('Multitud gente', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formación\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\feria1.jpg"', 1),
('Salida', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formación\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\feria2.jpg"', 1);

-- Para la galería del evento  Tsunami en Gijon
INSERT INTO Imagenes (titulo, imagen, id_galeria) VALUES
('Plaza noche', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formación\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\tsu.jpg"', 2),
('Tsunami Mujer', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formación\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\tsu1.jpg"', 2),
('LLenazo', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formación\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\tsu2.jpg"', 2);

-- Para la galería del Concierto Melendi
INSERT INTO Imagenes (titulo, imagen, id_galeria) VALUES
('Melendi cerca', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formación\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\concierto1.jpg"', 3),
('Escenario', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formación\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\concierto2.jpg"', 3),
('Melendi', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formación\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\concierto3.jpg"', 3);



--Insertamos los Favortios (3 minimo en cada uno , 2 del historial)

--Favortios de Alma (Concierto , Exposicion y festival cine)
INSERT INTO Favoritos (id_usuario, id_evento) VALUES
(1, 1), 
(1, 2), 
(1, 4); 

--Favortios de Ivan (Exposicion ,Teatro y Festival de cine)
INSERT INTO Favoritos (id_usuario, id_evento) VALUES
(2, 2), 
(2, 3), 
(2, 4); 

--Favoritos Vagabond (Concierto,Teatro y Conferencia)
INSERT INTO Favoritos (id_usuario, id_evento) VALUES
(3, 1), 
(3, 3), 
(3, 5); 