
///Clase que implementa un partido de tenis/padel
///Recibe en su constructor el nombre de los jugadores y el numero de sets.
class Partido{
    //variables temporales para controlar el partido
    late int _setActual;
    late int _numSets;
    late int _setsGanadosLocal;
    late int _setsGanadosVisitante;
    late bool _partidoFinalizado;
    //Map que controla todo el marcador de cara 
    final Map<String,dynamic> _marcador= {
      "Jugador Local":"",
      "Jugador Visitante":"",
      "Set":[
        {"Juegos Locales":"0", "Juegos Visitantes":"0"},
        {"Juegos Locales":"0", "Juegos Visitantes":"0"},
        {"Juegos Locales":"0", "Juegos Visitantes":"0"},
        {"Juegos Locales":"0", "Juegos Visitantes":"0"},
        {"Juegos Locales":"0", "Juegos Visitantes":"0"},
      ],
      "Puntos Locales":"00",
      "Puntos Visitantes":"00"
      };
    //GameSet, que se encarga de puntos y juegos del set activo, los pasados quedan almacenados en el Map
    late _GameSet _gameSetActual;

  Partido({
    required int numSets,
    required String jugadorLocal,
    required String jugadorVisitante})
  {
    _marcador["Jugador Local"]=jugadorLocal;
    _marcador["Jugador Visitante"]=jugadorVisitante;
      _numSets=numSets;
    _setActual=1;
    _partidoFinalizado=false;
    _setsGanadosLocal=0;
    _setsGanadosVisitante=0;
    _gameSetActual=_GameSet();
    
  }

  void setJugadorLocal(String jugador)
  {
      _marcador["Jugador Local"]=jugador;
  }

   void setJugadorVisitante(String jugador)
  {
      _marcador["Jugador Visitante"]=jugador;
  }

  ///Obtiene el valor del marcador del partido, devuelve un Map con los siguientes items
  ///"Jugador Local" devuelve us String con el nombre del jugador local
  ///"Jugador Visitante" devuelve us String con el nombre del jugador visitatne
  ///"Puntos Locales" devuelve un String con el valor de los puntos locales, a saber 00 15 30 40 AV si no estamos en tie break, si nos encontramos en situacion de tiebreak devolvera valores enteros correspondientes al tanteo del tiebreak
  ///"Puntos visitantes" devuelve un String con el valor de los puntos locales, a saber 00 15 30 40 AV si no estamos en tie break, si nos encontramos en situacion de tiebreak devolvera valores enteros correspondientes al tanteo del tiebreak
  ///"Set" devuelve una lista de Map, el primer índice es el set que comienza en 0
  ///y dentro de cada item hay un Map con los siquientes campos
  ///"Juegos Locales" devuelve un string con el valor de los juegos visitates del set
  ///"Juegos Visitantes" devuelve un string con el valor de los juegos visitates del set
  
  Map<String,dynamic> getPartido(){
    return _marcador;
  }
  /// Añade un punto local
  /// Devuelve un valor logico true si ha acabado el partido
  /// Devuelve un valor logico false si el juego si el partido sigue
  bool addLocalPoint()
  {
    if(_gameSetActual.addLocalPoint())
    {
      _setsGanadosLocal++;
      if(_setsGanadosLocal==((_numSets/2).floor()+1))
      {
        _partidoFinalizado=true;
      }
      //actualizamos los valores del map tras el punto
      _marcador["Set"][_setActual-1]["Juegos Locales"]=_gameSetActual.getSet()["Juegos Locales"];
      _marcador["Set"][_setActual-1]["Juegos Visitantes"]=_gameSetActual.getSet()["Juegos Visitantes"];
      _marcador["Puntos Locales"]=_gameSetActual.getSet()["Puntos Locales"];
      _marcador["Puntos Visitantes"]=_gameSetActual.getSet()["Puntos Visitantes"];
      _setActual++;
      //Si acabamos un set, reiniciamos sus valores
      _gameSetActual=_GameSet();
    }
    else{
      //actualizamos los valores del map tras el punto
      _marcador["Set"][_setActual-1]["Juegos Locales"]=_gameSetActual.getSet()["Juegos Locales"];
      _marcador["Set"][_setActual-1]["Juegos Visitantes"]=_gameSetActual.getSet()["Juegos Visitantes"];
      _marcador["Puntos Locales"]=_gameSetActual.getSet()["Puntos Locales"];
      _marcador["Puntos Visitantes"]=_gameSetActual.getSet()["Puntos Visitantes"];
    }
    return(_partidoFinalizado);
  }

  /// Añade un punto visitante
  /// Devuelve un valor logico true si ha acabado el partido
  /// Devuelve un valor logico false si el juego si el partido sigue
  bool addLocalVisitante()
  {
    if(_gameSetActual.addVisitantePoint())
    {
      _setsGanadosVisitante++;
      if(_setsGanadosVisitante==((_numSets/2).floor()+1))
      {
        _partidoFinalizado=true;
      }
      //actualizamos los valores del map tras el punto
      _marcador["Set"][_setActual-1]["Juegos Locales"]=_gameSetActual.getSet()["Juegos Locales"];
      _marcador["Set"][_setActual-1]["Juegos Visitantes"]=_gameSetActual.getSet()["Juegos Visitantes"];
      _marcador["Puntos Locales"]=_gameSetActual.getSet()["Puntos Locales"];
      _marcador["Puntos Visitantes"]=_gameSetActual.getSet()["Puntos Visitantes"];
      _setActual++;
      //Si acabamos un set, reiniciamos sus valores
      _gameSetActual=_GameSet();
    }
    else{
      //actualizamos los valores del map tras el punto
      _marcador["Set"][_setActual-1]["Juegos Locales"]=_gameSetActual.getSet()["Juegos Locales"];
      _marcador["Set"][_setActual-1]["Juegos Visitantes"]=_gameSetActual.getSet()["Juegos Visitantes"];
      _marcador["Puntos Locales"]=_gameSetActual.getSet()["Puntos Locales"];
      _marcador["Puntos Visitantes"]=_gameSetActual.getSet()["Puntos Visitantes"];
    }
    return(_partidoFinalizado);
  }

}


class _GameSet{
  late int _local;
  late int _visitante;
  late bool tieBreak;
  late int _localTieBreak;
  late int _visitanteTieBreak;
  late _Juego _juego;
  late Map<String,String> _marcadorSet;
  

  _GameSet(){
    _local=0;
    _visitante=0;
    tieBreak=false;
    _localTieBreak=0;
    _visitanteTieBreak=0;
    _juego=_Juego();
    _marcadorSet={
      "Juegos Locales":"0",
      "Juegos Visitantes":"0",
      "Puntos Locales":"00",
      "Puntos Visitantes":"00"
    };
  }

  ///Obtiene el valor de los puntos del set, devuelve un Map con los siguientes items
  ///"Juegos Locales" devuelve un string con el valor de los juegos locales del set
  ///"Juegos Visitantes" devuelve un string con el valor de los juegos visitates del set
  ///"Puntos Locales" devuelve un String con el valor de los puntos locales, a saber 00 15 30 40 AV si no estamos en tie break, si nos encontramos en situacion de tiebreak devolvera valores enteros correspondientes al tanteo del tiebreak
  ///"Puntos visitantes" devuelve un String con el valor de los puntos locales, a saber 00 15 30 40 AV si no estamos en tie break, si nos encontramos en situacion de tiebreak devolvera valores enteros correspondientes al tanteo del tiebreak

  Map<String,String> getSet()
  {
    
  return (_marcadorSet);

  }

  /// Añade un punto local
  /// Devuelve un valor logico true si ha acabado el set
  /// Devuelve un valor logico false si el juego si el set sigue
  bool addLocalPoint()
  {
    
    if(!tieBreak)
    {
      if(_juego.addLocalPoint())
      {
          _local++;
          _marcadorSet["Juegos Locales"]=_local.toString();
          if(_local>=6 && (_local-_visitante)>=2)
          {
            //Finaliza un set, reiniciamos el juego y actualizamos marcadador de set
            _juego=_Juego();
            _marcadorSet["Puntos Locales"]=_juego.getPuntos()["Puntos Locales"];
            _marcadorSet["Puntos Visitantes"]=_juego.getPuntos()["Puntos Visitantes"];
            return true;
          }
          else if (_local==6 && _visitante==6)
            {
              //entramos en situacion de tiebreak
              _marcadorSet["Puntos Locales"]="0";
              _marcadorSet["Puntos Visitantes"]="0";  
              tieBreak=true;
            }
          else{
            //actualizamos el marcador si el set no ha acabado
            _marcadorSet["Puntos Locales"]=_juego.getPuntos()["Puntos Locales"];
            _marcadorSet["Puntos Visitantes"]=_juego.getPuntos()["Puntos Visitantes"];
          }
      }
      else
      {
        //si el juego no ha acabado recogemos los datos al map
        _marcadorSet["Puntos Locales"]=_juego.getPuntos()["Puntos Locales"];
        _marcadorSet["Puntos Visitantes"]=_juego.getPuntos()["Puntos Visitantes"];
      }
      
      }
    else{
      //situación de tiebreak, no se podría resolver con una clase que implementase las condiciones especiales????
      _localTieBreak++;
      if(_localTieBreak>=7 && (_localTieBreak-_visitanteTieBreak)>=2)
      {
        _local++;
        _marcadorSet["Juegos Locales"]=_local.toString();
        _marcadorSet["Puntos Locales"]="00";
        _marcadorSet["Puntos Visitantes"]="00";
        return true;
      }
      _marcadorSet["Puntos Locales"]=_localTieBreak.toString();
      _marcadorSet["Puntos Visitantes"]=_visitanteTieBreak.toString();
    }
    return false;
  }

  /// Añade un punto visitante
  /// Devuelve un valor logico true si ha acabado el set
  /// Devuelve un valor logico false si el juego si el set sigue
  
  bool addVisitantePoint()
  {
    if(!tieBreak)
    {
      if(_juego.addVisitantePoint())
      {
          _visitante++;
          _marcadorSet["Juegos Visitantes"]=_visitante.toString();
          if(_visitante>=6 && (_visitante-_local)>=2)
          {
            //Finaliza un set, reiniciamos el juego y actualizamos marcadador de set
            _juego=_Juego();
            _marcadorSet["Puntos Locales"]=_juego.getPuntos()["Puntos Locales"];
            _marcadorSet["Puntos Visitantes"]=_juego.getPuntos()["Puntos Visitantes"];
            return true;
          }
          else if (_local==6 && _visitante==6)
            {
              //entramos en situacion de tiebreak
              _marcadorSet["Puntos Locales"]="0";
              _marcadorSet["Puntos Visitantes"]="0";
              tieBreak=true;
            }
          else{
            //actualizamos el marcador si el set no ha acabado
           _marcadorSet["Puntos Locales"]=_juego.getPuntos()["Puntos Locales"];
            _marcadorSet["Puntos Visitantes"]=_juego.getPuntos()["Puntos Visitantes"];
          }
      }
      else
      {
        //si el juego no ha acabado recogemos los datos al map
        _marcadorSet["Puntos Locales"]=_juego.getPuntos()["Puntos Locales"];
        _marcadorSet["Puntos Visitantes"]=_juego.getPuntos()["Puntos Visitantes"];
      }
    }
    else{
      //situación de tiebreak, no se podría resolver con una clase que implementase las condiciones especiales????
      _visitanteTieBreak++;
      if(_visitanteTieBreak>=7 && (_visitanteTieBreak-_localTieBreak)>=2)
      {
        _visitante++;
        _marcadorSet["Juegos Visitantes"]=_visitante.toString();
        _marcadorSet["Puntos Locales"]="00";
        _marcadorSet["Puntos Visitantes"]="00";
        return true;
      }
      _marcadorSet["Puntos Locales"]=_localTieBreak.toString();
      _marcadorSet["Puntos Visitantes"]=_visitanteTieBreak.toString();
    }
    return false;
  }
}

class _Juego{

  final List<String> _puntos=['00','15','30','40','AV'];
  late int _local;
  late int _visitante;

  _Juego()
  {
    _local=0;
    _visitante=0;
  }

  void _reset()
  {
    _local=0;
    _visitante=0;
  }
  ///Obtiene el valor de los puntos del juego, devuelve un Map con los siguientes items
  ///"Puntos Locales" devuelve un String con el valor de los puntos locales, a saber 00 15 30 40 AV
  ///"Puntos visitantes" devuelve un String con el valor de los puntos locales, a saber 00 15 30 40 AV
  Map getPuntos()
  {
    final puntos=<String,String>{"Puntos Locales":_puntos[_local],"Puntos Visitantes":_puntos[_visitante]};
    return puntos;
  }
  ///Añade un punto al juego local, devuelve true si el juego ha acabado a favor del jugador local y false si continua
  ///Solo puede acabar si han superado los 40 y llevan dos puntos de ventaja
  bool addLocalPoint()
  {
    _local++;
    if(_local>=4 && (_local-_visitante)>=2)
    {
      //juego acabado, reiniciamos los indices antes de seguir
      _reset();
      return(true);
    }
    else if(_local==4 && _visitante==4)
    {
      //situacion tras ventaja que vuelven a igualar, es necesario recolocar los indices
      _local--;
      _visitante--;
    }
    return false;
  }
  ///Añade un punto al juego visitante, devuelve true si el juego ha acabado a favor de jugador visitante y false si continua
  ///Solo puede acabar si han superado los 40 y llevan dos puntos de ventaja
  bool addVisitantePoint()
  {
    _visitante++;
    if(_visitante>=4 && (_visitante-_local)>=2)
    {
      //juego acabado, reiniciamos los indices antes de seguir
      _reset();
      return(true);
    }
    else if(_visitante==4 && _local==4)
    {
      //situacion tras ventaja que vuelven a igualar, es necesario recolocar los indices
      _local--;
      _visitante--;
    }
    return false;
  }
  

}