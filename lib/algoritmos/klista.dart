import 'dart:math';

class TextoRep {
  String texto;
  int cantidad;
  int distancia;
  int posicion;

  TextoRep(this.texto, this.cantidad, this.posicion, this.distancia);

  void incrementar() {
    cantidad++;
  }
}

class ListaRep {
  List<TextoRep> lista;

  ListaRep() : lista = [];

  void add(TextoRep texto) {
    lista.add(texto);
  }

  TextoRep? obtener(String texto) {
    int i = lista.length - 1;
    while (i >= 0) {
      TextoRep item = lista[i];
      if (texto == item.texto) {
        return item;
      }
      i--;
    }
    return null;
  }

  bool existe(String texto) {
    return obtener(texto) != null;
  }

  void eliminarTemp() {
    int i = lista.length - 1;
    while (i >= 0) {
      TextoRep item = lista[i];
      if (item.cantidad < 2) {
        lista.removeAt(i);
      }
      i--;
    }
  }

  int calcularMcd() {
    int i = 1;
    int N = lista.length;
    int vmcd = 0;

    int num1 = 0;
    int num2 = 0;
    while (i < N) {
      if (i == 1) num1 = lista[i - 1].distancia;
      num2 = lista[i].distancia;
      vmcd = mcd(num1, num2);
      num1 = vmcd;
      i++;
    }
    return vmcd;
  }

  int mcd(int num1, int num2) {
    int a = max(num1, num2);
    int b = min(num1, num2);
    int resultado = 0;

    do {
      resultado = b;
      b = a % b;
      a = resultado;
    } while (b != 0);

    return resultado;
  }
}
