// ignore_for_file: file_names

import 'dart:math';

class CifraSeries {
  String textoclaro;
  String textocifrado;
  var lista = [];
  int ancho;

  CifraSeries()
      : textoclaro = "",
        textocifrado = "",
        ancho = 0;

  set textoClaro(String valor) => textoclaro = valor;
  set textoCifrado(String valor) => textocifrado = valor;

  void fillLista() {
    int N = textoclaro.length;
    for (int i = 1; i <= N; i++) {
      if (lista.length == N) break;
      if (!lista.contains(i)) {
        lista.add(i);
      }
    }
  }

  void addPrimos() {
    int N = textoclaro.length;
    int i = 2;
    while (i <= N) {
      if (lista.length == N) break;
      if (esPrimo(i)) {
        if (!lista.contains(i)) {
          lista.add(i);
        }
      }
      i++;
    }
  }

  bool esPrimo(int num) {
    int cuenta = 0;
    int i = 2;
    int N = sqrt(num).toInt();
    while (i <= N) {
      if (num % i == 0) {
        cuenta++;
      }
      if (cuenta > 0) break;
      i++;
    }
    return cuenta == 0;
  }

  void addPares() {
    int N = textoclaro.length;
    int i = 2;
    while (i <= N) {
      if (lista.length == N) break;
      if (!lista.contains(i)) {
        lista.add(i);
      }
      i += 2;
    }
  }

  String cifrar() {
    String salida = "";
    int N = textoclaro.length;

    for (int i = 0; i < N; i++) {
      int indice = lista[i] - 1;
      salida += textoclaro[indice];
    }
    return salida;
  }
}
