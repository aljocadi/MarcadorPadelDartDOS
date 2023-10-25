import 'dart:io';


void printMarcador(Map<String,dynamic> marcador, int numeroSets)
{
  //Recogemos los nombres de los jugadores
  String lineaLocal=marcador["Jugador Local"];
  String lineaVisitante=marcador["Jugador Visitante"];
  //Calculamos las longitudes de los nombres de los jugadores para tabular las columnas
  int longitudLocal=lineaLocal.length;
  int longitudVisitante=lineaVisitante.length;
  int longitud=0;
  String lineaGuiones="";
  //Buscamos El nombre de jugador más largo
  if (longitudLocal>=longitudVisitante)
  {
    longitud=lineaLocal.length+5;
  }
  else
  {
    longitud=lineaVisitante.length+5;
  }
  //Creamos la primera columna con la longitud más larga y 5 caracteres mas
  lineaVisitante=lineaVisitante.padRight(longitud);
  lineaLocal=lineaLocal.padRight(longitud);
  //comenzamos a construir la cabecera, con una longitud 2 caracteres inferior, para que el valor del set
  //quede centrado con respecto al numero del set
  lineaGuiones=lineaGuiones.padRight(longitud-2);
  for(int i=0;i<numeroSets;i++)
  {
    //construccion de la cabecera con los diferentes sets que tengamos
    lineaGuiones=lineaGuiones+"Set "+(i+1).toString();
    lineaGuiones=lineaGuiones.padRight(lineaGuiones.length+2);
    //vamos creando las lineas local y visitantes con sus juegos
    lineaLocal=lineaLocal+marcador["Set"][i]["Juegos Locales"];
    lineaLocal=lineaLocal.padRight(lineaLocal.length+6);
    lineaVisitante=lineaVisitante+marcador["Set"][i]["Juegos Visitantes"];
    lineaVisitante=lineaVisitante.padRight(lineaVisitante.length+6);
  }
  //finalizamos la cabecera con los puntos
  lineaGuiones=lineaGuiones.padRight(lineaGuiones.length+1);
  lineaGuiones=lineaGuiones+"Ptos";
  //Vamos añadiendo los puntos 
  lineaLocal=lineaLocal+marcador["Puntos Locales"];
  lineaVisitante=lineaVisitante+marcador["Puntos Visitantes"];  
  
  //calculamos la longitud de la cabecera, con ella sabremos el numero de caracteres
  //de los guiones de separacion
  longitud=lineaGuiones.length;
  
  //imprimimos la cabecera
  print(lineaGuiones);
  //reiniciamos la linea para los guiones y pintamos la linea de separacion
  lineaGuiones=""; 
  print(lineaGuiones.padRight(longitud,"-"));
  //pintamos los datos de la linea local
  print("$lineaLocal");
  //otra linea de guiones
  print(lineaGuiones.padRight(longitud,"-"));
  //pintamos los datos de la linea visitante
  print("$lineaVisitante");
  //otra linea de guiones
  print(lineaGuiones.padRight(longitud,"-"));
  
  

}


void limpiaPantalla()
{
  //limpia la pantalla
  //print("\x1B[2J\x1B[0;0H");
}

///Muestra el menu principal
///devuelve un entero 
///    1 - menu configuracion
///    2 - Iniciar partido
///    3 - Salir            
int menuPrincipal()
{
  String? opcion="";
  int salida=3;

  print ("Bienvenido al marcador de padel");
  print("1 Configurar la aplicación");
  print("2 Iniciar partido");
  print("3 Salir");
  opcion=stdin.readLineSync();
  limpiaPantalla();
  if(opcion!=null)
  {
    switch (opcion)
    {
      case "1": salida=1;
      break;
      case "2": salida=2;
      break;
      case "3": salida=3;
      break;
    }
  }
  return salida;
}

///Muestra el menu de configuración
///Devuelve un Map con los siguientes campos
///     <String>"Jugador 1"
///     <String>"Jugador 2"
///     <int>"Sets"
Map<String,Object> menuConfiguracion(Map<String,Object> configuracion)
{
  
  String? opcion, opcion2;
  
  do {
    limpiaPantalla();
    print ("Bienvenido al marcador de padel");
    print ("Configuración");
    print("1 Nombre Jugador 1");
    print("2 Nombre Jugador 2");
    print("3 Número de sets");
    print("4 Salir");
    opcion=stdin.readLineSync();
    limpiaPantalla();
    if(opcion!=null)
    {
      switch (opcion)
      {
        case "1": 
          print("Introduce el nombre del jugador 1");
          opcion2=stdin.readLineSync();
          configuracion["Jugador 1"]=opcion2??"Jugador 1";
        break;
        case "2": 
          print("Introduce el nombre del jugador 2");
          opcion2=stdin.readLineSync();
          configuracion["Jugador 2"]=opcion2??"Jugador 2";
        break;
        case "3": 
          print("Introduce el numero de sets (3/5)");
          opcion2=stdin.readLineSync();
          if(opcion2!=null)
          {
            int? sets=int.tryParse(opcion2);
            if(sets==3 || sets==5)
            {
                configuracion["Sets"]=sets!;
            }
            else
            {
              print("Valor incorrecto en los sets, se da el valor por defecto (3)");
              configuracion["Sets"]=3;
            }
          }
          
        break;
      }
    }
  }while (opcion!="4");
  return configuracion;
}

///Muestra el menu de juego
//////devuelve un entero 
///    1 - Punto local
///    2 - Punto visitante
///    3 - Salir  
int menuJuego(){
  String? opcion="", opcion2;
  int salida=3;
        print("1 Punto local");
        print("2 punto visitante");
        print("3 Salir");
        opcion=stdin.readLineSync();
        
        if(opcion!=null)
        {
          switch (opcion)
          {
            case "1": salida=1;
            break;
            case "2": salida=2;
            break;
            case "3": 
            print ("Está seguro de acabar el partido?(S/N)");
            opcion2=stdin.readLineSync();
            if((opcion2!=null)&&((opcion2=="S")||(opcion2=="s")))
              {salida=3;
              }
            else{
              salida=-1;
            }
            break;
            default:
              salida=-1;
              break;
          }
        }
        else
        {
          salida=-1;
        }
  
  return salida;
}