+------------------+       +------------------+       +------------------+
|      Usuarios    |       |     Eventos      |       |    Favoritos     |
+------------------+       +------------------+       +------------------+
| id (PK)          |<-----| id (PK)          |----->>| id_usuario (FK)  |
| nombre           |       | fecha           |       | id_evento (FK)   |
| email (�nico)    |       | titulo          |       +------------------+
| password         |       | ubicacion       |
+------------------+       | descripcion     |
                          +------------------+

                          +------------------+
                          |     Galer�as     |
                          +------------------+
                          | id (PK)         |
                          | t�tulo          |<------+
                          | id_evento (FK)  |       |
                          +------------------+      |
													|
                          +------------------+      |
                          |     Im�genes     |      |
                          +------------------+      |
                          | id (PK)         |       |
                          | t�tulo          |       |
                          | imagen          |       |
                          | id_galeria (FK) |-------+
                          +------------------+