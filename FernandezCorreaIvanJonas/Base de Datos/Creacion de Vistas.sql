USE HappinessCo;
GO
--Creacion de Vistas 

--Creacion  de vista que devuelva las galerias anteriorires  al 28-02-2025
CREATE VIEW GaleriasAnteriores AS
SELECT galerias.id, galerias.titulo
FROM Galerias 
JOIN Eventos  ON id_evento = Eventos.id
WHERE eventos.fecha < '2025-02-28';


--Creacion de vista que devuelva los eventos favoritos del usuarios 1

CREATE VIEW FavoritosUsu1 AS
SELECT  eventos.titulo
FROM Eventos 
JOIN Favoritos  ON eventos.id = Favoritos.id_evento
WHERE Favoritos.id_usuario = 1;

--Creacion de la vista que muestre las imagenes de la galeria  del evento del 12-01

CREATE VIEW Imagenes1201 AS
SELECT  Imagenes.imagen
FROM Imagenes 
JOIN Galerias  ON Imagenes.id_galeria = Galerias.id
WHERE Galerias.id_evento = 2;


--Creacion de la vista que Devuelvan los eventos favoritos del usuario 2 posteriores al 28-02

CREATE VIEW FavoritosUsu2 AS
SELECT Eventos.titulo
FROM Eventos
JOIN Favoritos ON eventos.id = Favoritos.id_evento
WHERE Favoritos.id_usuario=2 and Eventos.fecha >'28-02-2025';