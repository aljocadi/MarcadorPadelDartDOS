

abstract class Animal {

}

abstract class Mamifero extends Animal{
  
}
abstract class Pajaro extends Animal{}
abstract class Pez extends Animal{}

//########################tercera solucion#################################
class Delfin extends Mamifero with NadarMixin{}

class Murcielago extends Mamifero with VolarMixin, CaminarMixin{}
class Gato extends Mamifero with CaminarMixin{}

class Tiburon extends Pez with NadarMixin{}
class PezVolador extends Pez with NadarMixin, VolarMixin{}

class Paloma extends Pajaro with VolarMixin, CaminarMixin{}

class Pato extends Pajaro with VolarMixin,CaminarMixin,NadarMixin{}


//#####################################tercera solucion##############################
mixin CaminarMixin on Animal{
  void caminar(){
    print("$runtimeType caminando");
  }
}
//#####################################tercera solucion##############################
mixin NadarMixin on Animal{
  void nadar(){
    print("Nadando");
  }
}
//#####################################tercera solucion##############################
mixin VolarMixin on Animal{
  void caminar(){
    print("Volando");
  }
}

void main(List<String> arguments){
  final Delfin delfin=Delfin();
  final Pato pato=Pato();

  pato.caminar();
  delfin.nadar();
  pato.nadar();
  


}