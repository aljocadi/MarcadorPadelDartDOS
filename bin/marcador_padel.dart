

import 'package:marcador_padel/modelo/partido.dart';
import 'package:marcador_padel/vista/vista_marcador.dart';

void main(List<String> arguments) {
  bool salir=false;
  bool partidoFinalizado=false;
  Map<String,Object> configuracion={
    "Jugador 1":"Jugador 1",
    "Jugador 2":"Jugador 2",
    "Sets":3
  };
  Partido enfrentamiento=Partido(numSets: int.parse(configuracion["Sets"].toString()) , jugadorLocal: configuracion["Jugador 1"].toString(), jugadorVisitante: configuracion["Jugador 2"].toString());
  // while para el primer menu  
  while (!salir&&!partidoFinalizado)
  {
      limpiaPantalla();
      int opcion=menuPrincipal();
      switch (opcion)
      {
        case 1:
            //menu de configuración y tratamiento
            limpiaPantalla();
            configuracion=menuConfiguracion(configuracion);
            enfrentamiento.setJugadorLocal(configuracion["Jugador 1"].toString());
            enfrentamiento.setJugadorVisitante(configuracion["Jugador 2"].toString());
            break;
        case 2:
            //opcion de juego y tratamiento
            int opcionJuego=menuJuego();
            while(opcionJuego!=3&&!partidoFinalizado)
            {
              switch (opcionJuego)
              {
                case 1: //punto local
                        partidoFinalizado=enfrentamiento.addLocalPoint();
                break;
                case 2: //punto visitante
                        partidoFinalizado=enfrentamiento.addLocalVisitante();
                break;
              }
              limpiaPantalla();
              print(partidoFinalizado);
              printMarcador(enfrentamiento.getPartido(),int.parse(configuracion["Sets"].toString()));
              opcionJuego=menuJuego();
            }
            break;
        case 3:
            salir=true;
      }
      
      
  }
  

}
