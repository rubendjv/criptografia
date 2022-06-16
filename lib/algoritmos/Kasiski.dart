// ignore_for_file: file_names

import 'klista.dart';

class Kasiski {
  String textoclaro;
  String textocifrado;
  int ancho;
  ListaRep repeticiones;
  List<String> subcrip;
  List<String> subrep;

  Kasiski()
      : textocifrado = "",
        textoclaro = "",
        ancho = 1,
        repeticiones = ListaRep(),
        subcrip = [],
        subrep = [];

  set textoCifrado(String valor) => textocifrado = valor;
  set textoClaro(String valor) => textoclaro = valor;
  set anchoCadena(int valor) => ancho = valor;

  void buscarRepetidos() {
    int N = textocifrado.length - ancho;
    int i = 0;
    repeticiones.lista = [];

    while (i < N) {
      String texto = textocifrado.substring(i, i + ancho);
      if (!repeticiones.existe(texto)) {
        TextoRep nuevo = TextoRep(texto, 1, i, 0);
        repeticiones.add(nuevo);
      } else {
        TextoRep? aux = repeticiones.obtener(texto);
        if (aux != null) {
          if (aux.distancia == 0) {
            aux.distancia = i - aux.posicion;
            aux.posicion = i;
            aux.incrementar();
          } else if (aux.distancia == i - aux.posicion) {
            aux.incrementar();
          } else {
            repeticiones.add(
                TextoRep(aux.texto, aux.cantidad + 1, i, i - aux.posicion));
          }
        }
        i += ancho;
        continue;
      }
      i++;
    }
    if (ancho > 1) {
      repeticiones.eliminarTemp();
    }
  }

  int valorMcd() {
    return repeticiones.calcularMcd();
  }

  void subCriptogramas(int cantidad) {
    subcrip = List<String>.generate(cantidad, (index) => '');

    for (int i = 0; i < textocifrado.length; i++) {
      int idsub = i % cantidad;
      subcrip[idsub] += textocifrado[i];
    }
  }

  void subRepeticiones(int cantidad) {
    subrep = List<String>.generate(cantidad, (index) => '');

    for (int i = 0; i < cantidad; i++) {
      String subanalisis = analizar(subcrip[i]);
      subrep[i] = subanalisis;
    }
  }

  String analizar(String subtexto) {
    int N = subtexto.length - 1;
    ListaRep repeticiones = ListaRep();

    int i = 0;
    while (i < N) {
      String texto = subtexto.substring(i, i + 1);
      if (!repeticiones.existe(texto)) {
        TextoRep nuevo = TextoRep(texto, 1, i, 0);
        repeticiones.add(nuevo);
      } else {
        TextoRep? aux = repeticiones.obtener(texto);
        if (aux != null) {
          if (aux.distancia == 0) {
            aux.distancia = i - aux.posicion;
            aux.posicion = i;
            aux.incrementar();
          } else if (aux.distancia == i - aux.posicion) {
            aux.incrementar();
          } else {
            repeticiones.add(
                TextoRep(aux.texto, aux.cantidad + 1, i, i - aux.posicion));
          }
        }
      }
      i++;
    }
    String salida = "";
    String alfabeto = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";

    for (int j = 0; j < alfabeto.length; j++) {
      String vC = alfabeto.substring(j, j + 1);
      TextoRep? caracter = repeticiones.obtener(vC);
      if (caracter != null) {
        salida += caracter.cantidad.toString() + ",";
      } else {
        salida += "0,";
      }
    }
    return salida;
  }
}
