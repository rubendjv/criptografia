class CifraFilas {
  String textoclaro;
  String textocifrado;
  int nfilas;
  late List matriz;

  CifraFilas()
      : textoclaro = "",
        textocifrado = "",
        nfilas = 0;

  set textoClaro(String valor) => textoclaro = valor;
  set textoCifrado(String valor) => textocifrado = valor;
  set numeroFilas(int valor) => nfilas = valor;

  String cifrar() {
    String salida = "";
    int N = textoclaro.length;
    int ncols = (N / nfilas).ceil();

    matriz = List.generate(
        nfilas, (index) => List<String>.generate(ncols, (index) => 'X'));

    int indice = 0;
    for (int idc = 0; idc < ncols; idc++) {
      for (int idf = 0; idf < nfilas; idf++) {
        if (indice < N) {
          matriz[idf][idc] = textoclaro[indice];
        }
        indice++;
      }
    }

    for (int idf = 0; idf < nfilas; idf++) {
      for (int idc = 0; idc < ncols; idc++) {
        salida += matriz[idf][idc];
      }
    }

    return salida;
  }

  String descifrar() {
    String salida = "";
    int N = textocifrado.length;
    int ncols = (N / nfilas).ceil();

    matriz = List.generate(
        nfilas, (index) => List<String>.generate(ncols, (index) => 'X'));

    int indice = 0;
    for (int idf = 0; idf < nfilas; idf++) {
      for (int idc = 0; idc < ncols; idc++) {
        if (indice < N) {
          matriz[idf][idc] = textocifrado[indice];
        }
        indice++;
      }
    }

    for (int idc = 0; idc < ncols; idc++) {
      for (int idf = 0; idf < nfilas; idf++) {
        salida += matriz[idf][idc];
      }
    }

    return salida;
  }
}
