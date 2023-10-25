abstract class vehiculo
{
  String color;
  String numSerie;
  String _marca="";
  String _modelo="";

  vehiculo({
    required this.color,
    required this.numSerie,
    required String marca,
    required String modelo
  })
  {
    _marca=marca;
    _modelo=modelo;
  }

  void pinta(var color)
  {
    this.color=color;
  }

  @override 
  String toString()
  {
    return (_marca + " "+_modelo+":" + numSerie.toString());
  }
}

class coche extends vehiculo{
  final int cilindrada;
  coche({
    required String color,
    required String numBastidor,
    required String marca,
    required String modelo,
    required this.cilindrada
  }): super(color: color,marca: marca, modelo: modelo, numSerie: numBastidor);

  void conducir(){
    print("conduciendo");
  }
  @override
  String toString(){
    return("${super.toString()} ${cilindrada}");
  }
}

class barco extends vehiculo{
  final int numMotores;
  barco({
    required String color,
    required String numBastidor,
    required String marca,
    required String modelo,
    required this.numMotores
  }): super(color: color,marca: marca, modelo: modelo, numSerie: numBastidor);
  void navegar()
  {
    print("navegando");
  }
}