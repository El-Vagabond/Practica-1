/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package happines.co.ivan.jonas;

import eventos.Eventos;
import favoritos.Favoritos;
import galerias.Galerias;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;
import usuarios.Usuarios;

/**
 *
 * @author ALUMNOS_FP
 */
public class HappinesCOIvanJonas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Creamos el HashMap para usuarios
        final HashMap<String, Usuarios> cuentas = new HashMap<>();
        //Creamos el HashMap para eventos
        final HashMap<Integer, Eventos> eventos = new HashMap<>();
        //Creamos el HashMap para favoritos
        final HashMap<Integer, Favoritos> favoritos = new HashMap<>();

        //Inicializamos el escanner y  las opciones del menu
        Scanner scanner = new Scanner(System.in);
        int opcion;

        //Creamos el menu
        do {
            System.out.println("1. Añadir usuario");
            System.out.println("2. Eliminar usuario");
            System.out.println("3. Añadir evento");
            System.out.println("4. Eliminar evento");
            System.out.println("5. Añadir galería");
            System.out.println("6. Eliminar galería");
            System.out.println("7. Añadir favorito");
            System.out.println("8. Eliminar favorito");
            System.out.println("9. Salir");
            System.out.print("Seleccione una opción: ");
            opcion = scanner.nextInt();
            scanner.nextLine(); // Consumir el salto de línea

            switch (opcion) {
                case 1:
                    añadirUsuario(cuentas);
                    break;
                case 2:
                    eliminarUsuario(cuentas);
                    break;
                case 3:
                    añadirEvento(eventos);
                    break;
                case 4:
                    eliminarEvento(eventos);
                    break;
                case 5:
                    añadirGaleria(eventos);
                    break;
                case 6:
                    eliminarGaleria(eventos);
                    break;
                case 7:
                    añadirFavorito(eventos, cuentas, favoritos);
                    break;
                case 8:
                    eliminarFavorito(favoritos);
                    break;
                case 9:
                    System.out.println("Saliendo...");
                    break;
                default:
                    System.out.println("Introduce un numero Correcto.");
            }
        } while (opcion != 9);

    }

    //Metodos de Usuario
    private static void añadirUsuario(HashMap<String, Usuarios> mapa) {
        Scanner escaner = new Scanner(System.in);
        System.out.print("Indica tu Nombre: ");
        String nombre = escaner.nextLine();
        System.out.print("Indica tu Email: ");
        String correo = escaner.nextLine();
        System.out.print("Indica tu contraseña: ");
        String password = escaner.nextLine();

        if (mapa.containsKey(correo)) {
            System.out.println("El usuario ya existe.");
        } else {
            mapa.put(correo, new Usuarios(nombre, correo, password));
            System.out.println("Usuario creado correctamente.");
        }
    }

    private static void eliminarUsuario(HashMap<String, Usuarios> mapa) {

        Scanner escaner = new Scanner(System.in);
        System.out.print("Indica el correo del usuario a eliminar: ");
        String correo = escaner.nextLine();

        if (mapa.containsKey(correo)) {
            mapa.remove(correo);
            System.out.println("El usuario se ha eliminado correctamente");
        } else {
            System.out.println("El usuario no existe");
        }

    }

    // Metodos Eventos
    private static void añadirEvento(HashMap<Integer, Eventos> mapa) {

        //Creamos el contador de eventos
        int contadorEventos = 0;
        Scanner escaner = new Scanner(System.in);

        System.out.print("Indica la fecha del evento: ");
        String fecha = escaner.nextLine();
        System.out.print("Indica el titulo del Evento: ");
        String titulo = escaner.nextLine();
        System.out.print("Indica la ubicacion del evento: ");
        String ubicacion = escaner.nextLine();
        System.out.print("Escribe una breve descripcion del evento: ");
        String descripcion = escaner.nextLine();
        //Aumentamos el contador en cada creacion del evento
        int id = contadorEventos++;
        mapa.put(id, new Eventos(id, fecha, titulo, ubicacion, descripcion));
        System.out.println("Evento creado correctamente.");
    }

    private static void eliminarEvento(HashMap<Integer, Eventos> mapa) {
        //Inicializamos el escaner
        Scanner escaner = new Scanner(System.in);

        //Mostramos toda la lista de eventos con un bucle
        System.out.println("Listado de eventos:");
        for (Eventos evento : mapa.values()) {
            System.out.println(evento);
        }
        //Preguntamos el evento que quiere eleiminar
        System.out.print("Ponga el ID del evento a  eliminar: ");
        int id = escaner.nextInt();
        escaner.nextLine();

        if (mapa.remove(id) != null) {
            System.out.println("Evento eliminado correctamente.");
        } else {
            System.out.println("El evento no existe.");
        }

    }

    //Metodos Galeria
    private static void añadirGaleria(HashMap<Integer, Eventos> mapa) {
        //Inicializamos el escaner
        Scanner escaner = new Scanner(System.in);

        //Creamos el contador para galerias
        int contadorGalerias = 0;

        //Mostramos toda la lista de eventos con un bucle
        System.out.println("Listado de eventos:");
        for (Eventos evento : mapa.values()) {
            System.out.println(evento);

            //Pedimos el ID del evento que crearemos una galeria
            System.out.println("Introduce el ID del evento para crear una galeria:");
            int id = escaner.nextInt();
            escaner.nextLine();
            if (mapa.containsKey(id)) {

                System.out.println("Introduce el Titulo para la Galeria");
                String titulo = escaner.nextLine();
                mapa.get(id).getGalerias().put(contadorGalerias, new Galerias(contadorGalerias, titulo, id));
                System.out.println("La galeria se ha creado correctamente");
            } else {
                System.out.println("El evento no existe");
            }

        }

    }

    private static void eliminarGaleria(HashMap<Integer, Eventos> mapa) {
        //Inicializamos el escaner
        Scanner escaner = new Scanner(System.in);

        //Mostramos toda la lista de eventos con un bucle
        System.out.println("Listado de eventos:");
        for (Eventos evento : mapa.values()) {
            System.out.println(evento);

        }

        //Pedimos el ID del evento que queremos borrar las galerias
        System.out.println("Introduce el ID del evento para ver sus galerias:");
        int id = escaner.nextInt();

        //Hacemos un bucle para mostar las galerias que tiene dicho evento 
        if (mapa.get(id).getGalerias().isEmpty()) {
            System.out.println("El evento no tiene galerias creadas");

        } else {

            //Creamos un bucle para mostrar las galerias que tiene dicho evento
            System.out.println("El evento tiene estas galerias");
            for (Galerias galerias : mapa.get(id).getGalerias().values()) {
                System.out.println("El id de la galeria es: " + galerias.getId() + "El titulo de esta galeria es : " + galerias.getTitulo());
            }

            //Preguntamos que galeria quiere eliminar dentro de un Evento
            System.out.println("Ingrese el Id de la galeria a borrar");
            int idGaleria = escaner.nextInt();
            //Comprobamos que el evento tenga la galeria y si es asi la borramos
            if (mapa.get(id).getGalerias().containsKey(idGaleria)) {
                mapa.get(id).getGalerias().remove(idGaleria);
                System.out.println("Galeria eliminada correctamente");
            } else {
                System.out.println("No existe galeria para ser borrada");
            }

        }

    }

    //Metodos Favorito
    private static void añadirFavorito(HashMap<Integer, Eventos> mapa1, HashMap<String, Usuarios> mapa2, HashMap<Integer, Favoritos> mapa3) {
        //Inicializamos el escaner
        Scanner escaner = new Scanner(System.in);

        //Mostramos toda la lista de eventos con un bucle
        System.out.println("Listado de eventos:");
        for (Eventos evento : mapa1.values()) {
            System.out.println(evento);

        }
        //Mostramos todos los usuarios
        System.out.println("Los usuarios son: ");

        for (Usuarios usu : mapa2.values()) {
            System.out.println(usu);
        }

        //Pedimos al usuario  el id del evento y el correo del usuario
        System.out.println("De que Evento quieres crear el favorito?(id)");
        int id = escaner.nextInt();

        escaner.nextLine();
        System.out.println("De que usuario quieres crear el favorito?(Correo)");
        String usu = escaner.nextLine();

        if (!mapa1.containsKey(id) || !mapa2.containsKey(usu)) {
            System.out.println("No se ha introducido un evento o usuario correcto");
        } else {

            mapa3.put(id, new Favoritos(usu, id));

            System.out.println("El favortio se ha creado correctamente");

        }
    }

    private static void eliminarFavorito(HashMap<Integer, Favoritos> mapa) {
        //Inicializamos el escaner
        Scanner escaner = new Scanner(System.in);

        //Mostramos toda la lista de eventos con un bucle
        System.out.println("Listado de eventos:");
        for (Favoritos favo : mapa.values()) {
            System.out.println(favo);

            //Preguntamos al usuarios el id del evento y el usuario que hay que borrar de favortios
            System.out.println("Que id de eventos quieres borrar? ");
            int id = escaner.nextInt();
            System.out.println("Que correo de favortios quieres borrar? ");
            String usu = escaner.nextLine();

            if (!mapa.containsKey(id) || !mapa.containsValue(usu)) {
                System.out.println("El favorito no existe");
            } else {
                mapa.remove(id, usu);
                System.out.println("El favorito se ha eliminado correctamente");
            }
        }

    }

}
