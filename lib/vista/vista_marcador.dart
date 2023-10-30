
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
  print("\x1B[2J\x1B[0;0H");
}

