

import 'dart:io';

import 'package:marcador_padel/menu.dart';
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
      final menuPpal=Menu<int>(etiqueta: "Marcador de Tenis y padel", opciones: [
          OpcionesMenu(valor: 1, texto: "Configuración de la aplicación"),
          OpcionesMenu(valor: 2, texto: "Iniciar el partido"),
          OpcionesMenu(valor: 3, texto: "Salir")]);

      int opcion=menuPpal.elijeOpcion();
      switch (opcion)
      {
        case 1:
            //menu de configuración y tratamiento
            limpiaPantalla();
            final menuPpal=Menu<int>(etiqueta: "Configuración", opciones: [
                OpcionesMenu(valor: 1, texto: "Nombre Jugador 1"),
                OpcionesMenu(valor: 2, texto: "Nombre Jugador 2"),
                OpcionesMenu(valor: 3, texto: "Número de sets"),
                OpcionesMenu(valor: 4, texto: "Salir")]);
            int opcionConfiguracion;
            do{
              opcionConfiguracion=menuPpal.elijeOpcion();
              String? valor;
              switch (opcionConfiguracion)
                {
                  case 1: 
                    print("Introduce el nombre del jugador 1");
                    valor=stdin.readLineSync();
                    enfrentamiento.setJugadorLocal(valor??"Jugador 1");
                  break;
                  case 2: 
                    print("Introduce el nombre del jugador 2");
                    valor=stdin.readLineSync();
                    enfrentamiento.setJugadorVisitante(valor??"Jugador 2");
                  break;
                  case 3: 
                    print("Introduce el numero de sets (3/5)");
                    valor=stdin.readLineSync();
                    if(valor!=null)
                    {
                      int? sets=int.tryParse(valor);
                      if(sets==3 || sets==5)
                      {
                          enfrentamiento.setNumeroSets(sets!);
                      }
                      else
                      {
                        print("Valor incorrecto en los sets, se da el valor por defecto (3)");
                        enfrentamiento.setNumeroSets(3);
                      }
                    }
                    
                  break;
                }
            }while(opcionConfiguracion!=4);  
            break;
        case 2:
            //opcion de juego y tratamiento
            final menuJuego=Menu<int>(etiqueta: "Juego", opciones: [
                OpcionesMenu(valor: 1, texto: "Punto Local"),
                OpcionesMenu(valor: 2, texto: "Punto Visitante"),
                OpcionesMenu(valor: 3, texto: "Salir")]);
            int opcionJuego;
            bool salirJuego=false;
            while(!salirJuego&&!partidoFinalizado)
            { 
              limpiaPantalla();
              printMarcador(enfrentamiento.getPartido(),int.parse(configuracion["Sets"].toString()));
              opcionJuego=menuJuego.elijeOpcion();
              switch (opcionJuego)
              {
                case 1: //punto local
                        partidoFinalizado=enfrentamiento.addLocalPoint();
                break;
                case 2: //punto visitante
                        partidoFinalizado=enfrentamiento.addLocalVisitante();
                break;
                case 3:
                      final menuSalir=Menu<String>(etiqueta: "Está seguro de acabar el partido?", opciones: [
                      OpcionesMenu(valor: "S", texto: "Si"),
                      OpcionesMenu(valor: "N", texto: "No")]);
                      if(menuSalir.elijeOpcion()=="S")
                      {
                        salirJuego=true;
                      }
              }             
            }
            break;
        case 3:
            salir=true;
      }
      
      
  }
  

}
