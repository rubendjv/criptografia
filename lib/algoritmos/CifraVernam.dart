import 'dart:convert';

class CifraVernam {
  //alfabeto ingles
  //String _alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  CifraVernam();

  String getCifrado(String textoClaro, String clave) {
    if (textoClaro.length == clave.length) {
      textoClaro = textoClaro.toUpperCase();
      clave = clave.toLowerCase();
      List<int> cifra = [];
      AsciiDecoder ascii = AsciiDecoder();
      for (int i = 0; i < textoClaro.length; i++) {
        int A = textoClaro.codeUnitAt(i);
        int B = clave.codeUnitAt(i);
        int C = A ^ B;
        cifra.add(C);
      }
      return ascii.convert(cifra);
    }
    return "EL TEXTO CLARO Y LA CLAVE NO TIENEN LA MISMA LONGITUD";
  }

  String getDescifrado(String textoCifrado, String clave) {
    if (clave == "") {
      return "LA CLAVE ES NECESARIA PARA DESCIFRAR";
    }
    if (textoCifrado.length == clave.length) {
      return getCifrado(textoCifrado, clave);
    }
    return "EL TEXTO CIFRADO Y LA CLAVE NO TIENEN LA MISMA LONGITUD";
  }
}
