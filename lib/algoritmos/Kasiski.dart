// ignore_for_file: file_names

import 'klista.dart';

class Kasiski {
  String textoclaro;
  String textocifrado;
  int ancho;
  ListaRep repeticiones;
  List<String> subcrip;
  List<String> subrep;
  String clave;
  String alfabeto = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";

  Kasiski()
      : textocifrado = "",
        textoclaro = "",
        clave = "",
        ancho = 1,
        repeticiones = ListaRep(),
        subcrip = [],
        subrep = [];

  set textoCifrado(String valor) =>
      textocifrado = valor.replaceAll(' ', '').replaceAll('\n', '');
  set textoClaro(String valor) => textoclaro = valor;
  set anchoCadena(int valor) => ancho = valor;

  void buscarRepetidos() {
    int N = textocifrado.length - ancho;
    int i = 0;
    repeticiones.lista = [];
    subcrip = [];
    subrep = [];
    clave = "";

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
        i += ancho - 1;
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
    clave = "";

    for (int i = 0; i < cantidad; i++) {
      String subanalisis = conteo(subcrip[i]);
      subanalisis = analisis(subanalisis);
      subrep[i] = subanalisis;
    }
  }

  String conteo(String subtexto) {
    int N = subtexto.length;
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

  String analisis(String texto) {
    List<String> lista = texto.split(',');
    lista.removeLast();
    int suma = 0, max = 0;
    for (int i = 0; i < lista.length; i++) {
      suma += int.parse(lista[i]);
      if (int.parse(lista[i]) > max) max = int.parse(lista[i]);
    }
    int promed = (suma / lista.length).ceil();

    int j;
    int pa = 0;
    int pe = 0;
    int po = 0;
    int ps = 0;

    for (int k = 0; k < 2; k++) {
      for (j = 0; j < lista.length; j++) {
        pa = j;
        pe = (pa + 4) % 27;
        po = (pe + 11) % 27;
        ps = (po + 4) % 27;

        bool sa = int.parse(lista[pa]) >= promed && int.parse(lista[pa]) <= max;
        bool se = int.parse(lista[pe]) >= promed && int.parse(lista[pe]) <= max;
        bool so = int.parse(lista[po]) >= promed && int.parse(lista[po]) <= max;
        bool ss = int.parse(lista[ps]) >= promed && int.parse(lista[ps]) <= max;

        if ((sa && se && so && ss && k == 0) || (sa && se && so && k == 1)) {
          break;
        }
      }
      if (j < lista.length) break;
    }

    String salida = "";
    for (int k = 0; k < lista.length; k++) {
      if (k == pa) {
        salida += lista[k] + '.1,';
        clave += alfabeto[pa];
      } else if (k == pe) {
        salida += lista[k] + '.2,';
      } else if (k == po) {
        salida += lista[k] + '.3,';
      } else if (k == ps) {
        salida += lista[k] + '.4,';
      } else {
        salida += lista[k] + '.0,';
      }
    }
    return salida;
  }
}
