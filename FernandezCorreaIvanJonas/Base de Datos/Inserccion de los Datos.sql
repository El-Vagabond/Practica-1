--Insertamos los Usuarios
INSERT INTO Usuarios (nombre, email, password) VALUES
('Alma', 'almita@gmail.com', 'catartitos'),
('Ivan', 'ivancito@gmail.com', 'plunitos'),
('Vagabond', 'ronin@hotmail.com', 'lacaida123');


--Insertamos los Eventos
INSERT INTO Eventos (fecha, titulo, ubicacion, descripcion) VALUES
('2025-01-01', 'Concierto de A�o Nuevo', 'Teatro Principal', 'Un gran concierto para comenzar el a�o.'),
('2025-01-12', 'Exposici�n de Arte Moderno', 'Museo Central', 'Obras de artistas contempor�neos.'),
('2025-01-24', 'Noche de Teatro', 'Teatro Municipal', 'Representaci�n de una obra de os alumnos de programacion'),
('2025-03-05', 'Festival de Cine', 'Cineplex', 'Proyecciones de pel�culas independientes.'),
('2025-03-15', 'Conferencia Tecnol�gica', 'Centro de Convenciones', 'Avances en tecnolog�a digital.'),
('2025-03-25', 'Taller de Fotograf�a', 'Escuela de Artes', 'Aprende t�cnicas avanzadas de fotograf�a.');


--Insertamos las Galerias
INSERT INTO Galerias (titulo, id_evento) VALUES
('Galer�a Concierto', 1),
('Galer�a Exposici�n', 2),
('Galer�a Teatro', 3);


--Insertamos las Imagenes de las Galerias
-- Para la galer�a del Concierto del a�o nuevo
INSERT INTO Imagenes (titulo, imagen, id_galeria) VALUES
('Mano Corazon', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formaci�n\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\concierto1.jpg"', 1),
('Escenario', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formaci�n\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\concierto2.jpg"', 1),
('Melendi', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formaci�n\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\concierto3.jpg"', 1);

-- Para la galer�a del evento  Exposicion arte Moderno
INSERT INTO Imagenes (titulo, imagen, id_galeria) VALUES
('Esquina de fotos', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formaci�n\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\exposicion1.jpg"', 2),
('La pared', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formaci�n\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\exposicion2.jpg"', 2),
('El busto', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formaci�n\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\exposicion3.jpg"', 2);

-- Para la galer�a del evento Noche en el Teatro
INSERT INTO Imagenes (titulo, imagen, id_galeria) VALUES
('El teatro', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formaci�n\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\teatro1.jpg"', 3),
('Aladin', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formaci�n\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\teatro2.jpg"', 3),
('Teatro cerrado', '"C:\Users\ALUMNOS_FP\OneDrive - TuniverS Formaci�n\Practica 1\FernandezCorreaIvanJonas\Base de Datos\Imagenes\teatro3.jpg"', 3);



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