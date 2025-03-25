CREATE DATABASE HappinessCo;
GO

USE HappinessCo;
GO

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);



GO

-- Tabla de Eventos
CREATE TABLE Eventos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    ubicacion VARCHAR(200) NOT NULL,
    descripcion TEXT
);
GO

-- Tabla de Galerías
CREATE TABLE Galerias (
    id INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    id_evento INT NOT NULL,
    FOREIGN KEY (id_evento) REFERENCES Eventos(id)
);
GO

-- Tabla de Imágenes de las galerías
CREATE TABLE Imagenes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    imagen VARCHAR(255) NOT NULL,
    id_galeria INT NOT NULL,
    FOREIGN KEY (id_galeria) REFERENCES Galerias(id)
);
GO

-- Tabla de Favoritos (relación muchos a muchos entre usuarios y eventos)
CREATE TABLE Favoritos (
    id_usuario INT NOT NULL,
    id_evento INT NOT NULL,
    PRIMARY KEY (id_usuario),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id),
    FOREIGN KEY (id_evento) REFERENCES Eventos(id)
);
GO
