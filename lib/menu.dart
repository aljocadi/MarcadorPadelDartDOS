
//<O> lo utilizamos para marcar que va a tener datos genéricos. Se suele utilizar una letra mayúscula o 
//una palabra que no esté entre las reservadas por dart, poderimos utilizar <Opciones>
import 'dart:io';

class Menu<O>{

  final String etiqueta;
  //final List<O> opciones;
  final List<OpcionesMenu<O>> opciones;
  Menu({
    required this.etiqueta,
    required this.opciones,
  });

  O elijeOpcion(){
    print("$etiqueta");
    for(int i=0; i<opciones.length;i++ )
    {
      final opcion=opciones[i];
      print ("${i+1}: ${opcion.texto}");
    }
    final texto=stdin.readLineSync();
    final opcion=int.tryParse(texto??'');
    if(opcion!=null&&opcion>=1&&opcion<=opciones.length)
    {
      return(opciones[opcion-1].valor);
    }
    else
    {
      print("Opcion Incorrecta");
      //podríamos devolver un valor nulo, para lo que deberiamos marcar como tipo en la funcion O?
      //return null;
      //pero lo que haremos es utilizar recursividad y quedaremos atrapados en este menu
      //mientras no demos una respuesta correcta
      return (elijeOpcion());
    }
  }
}
class OpcionesMenu<O>{
  final O valor;
  final String texto;

  OpcionesMenu({required this.valor, required this.texto});
}

void main(List<String> arguments)
{
  final menu1=Menu<String>(etiqueta: "Eres un desarrollador? [Si/No]", opciones: [
    OpcionesMenu(valor: "Si", texto: "Si"),
    OpcionesMenu(valor: "No", texto: "No")] );
  final menu2=Menu<int>(etiqueta: "Cual es tu lenguaje favorito?", opciones: [
    OpcionesMenu(valor: 1, texto: "Dart"),
    OpcionesMenu(valor: 2, texto: "Java"),
    OpcionesMenu(valor: 3, texto: "Python"),
    OpcionesMenu(valor: 4, texto: "Otro")]);

    final opcionSeleccionada1=menu1.elijeOpcion();
    final opcionSeleccionada2=menu2.elijeOpcion();

    print("la opcion seleccionada en el primer menu es $opcionSeleccionada1");
    print("la opcion seleccionada en el segundo menu es $opcionSeleccionada2");
}