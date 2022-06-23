// ignore_for_file: file_names
import 'Cadena.dart';

class CifraVigenere {
  String alfabeto = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
  String textoclaro;
  String textocifrado;
  String clave;

  CifraVigenere()
      : textoclaro = "",
        textocifrado = "",
        clave = "";

  set textoClaro(String valor) => textoclaro = valor;
  set textoCifrado(String valor) => textocifrado = valor;
  set textoClave(String valor) => clave = valor;

  String cifrar() {
    String tcifra = '';
    int N = alfabeto.length;

    for (int i = 0; i < textoclaro.length; i++) {
      int vm = alfabeto.indexOf(textoclaro[i]);
      int id = i % clave.length;
      int vk = alfabeto.indexOf(clave[id]);
      int nid = (vm + vk) % N;
      tcifra += alfabeto[nid];
    }
    return tcifra;
  }

  String descifrar() {
    String tclaro = '';
    int N = alfabeto.length;

    for (int j = 0; j < textocifrado.length; j++) {
      int vc = alfabeto.indexOf(textocifrado[j]);
      int id = j % clave.length;
      int vk = alfabeto.indexOf(clave[id]);
      int nid = (vc - vk) % N;
      tclaro += alfabeto[nid];
    }
    return tclaro;
  }

  String alfaCifrado() {
    String aux = "";

    return aux;
  }
}
