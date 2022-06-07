// ignore_for_file: file_names
import 'Cadena.dart';

class CifraPuroClave {
  String alfabeto = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
  String txtclaro;
  String txtcifrado;
  String clave;
  int b;

  CifraPuroClave()
      : txtclaro = "",
        txtcifrado = "",
        clave = "",
        b = 3;

  set textoClaro(String valor) => txtclaro = valor;
  set textoCifrado(String valor) => txtcifrado = valor;
  set desplazamiento(int valor) => b = valor;
  set textoClave(String valor) => clave = valor;

  String cifrar() {
    String aux = "";
    Cadena cadena = Cadena(clave + alfabeto);
    cadena.eliminarRepetidos();
    cadena.desplazar(b);
    String alfacifrado = cadena.text;

    for (int i = 0; i < txtclaro.length; i++) {
      String tM = txtclaro.substring(i, i + 1);

      int vM = alfabeto.indexOf(tM);
      if (vM >= 0) {
        num vC = vM; // (vC - b) % N;
        String tC = alfacifrado[vC.toInt()];
        aux += tC;
      }
    }
    return aux;
  }

  String decifrar() {
    //int N = alfabeto.length;
    Cadena cadena = Cadena(clave + alfabeto);
    cadena.eliminarRepetidos();
    cadena.desplazar(b);
    String alfacifrado = cadena.text;
    String aux = "";

    for (int i = 0; i < txtcifrado.length; i++) {
      String tC = txtcifrado.substring(i, i + 1);

      int vC = alfacifrado.indexOf(tC);
      if (vC >= 0) {
        num vM = vC; // (vC - b) % N;
        String tM = alfabeto[vM.toInt()];
        aux += tM;
      }
    }
    return aux;
  }

  String alfaCifrado() {
    String aux = "";

    return aux;
  }
}
