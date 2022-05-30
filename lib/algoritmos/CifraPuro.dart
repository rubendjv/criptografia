// ignore_for_file: file_names

class CifraPuro{
  String alfabeto = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
  String txtclaro;
  String txtcifrado;
  num b;

  CifraPuro(): txtclaro = "", txtcifrado = "", b = 3;

  set textoClaro(String valor) => txtclaro = valor;
  set textoCifrado(String valor) => txtcifrado = valor;
  set desplazamiento(num valor) => b = valor;
  
  String cifrar(){
    String aux = "";
    
    for (int i = 0; i < txtclaro.length; i++) {
      String tM = txtclaro.substring(i,i+1);
      
      int vM = alfabeto.indexOf(tM);
      if(vM>=0){
        num vC = (vM + b) % 27 ;
        String tC = alfabeto[vC.toInt()];
        aux += tC;
      }
    }
    return aux;
  }
  
  String decifrar(){
    String aux = "";
    
    for (int i = 0; i < txtcifrado.length; i++) {
      String tM = txtcifrado.substring(i,i+1);
      
      int vM = alfabeto.indexOf(tM);
      if(vM>=0){
        num vC = (vM - b) % 27 ;
        String tC = alfabeto[vC.toInt()];
        aux += tC;
      }
    }
    return aux;
  }
}