class CifraColumnas {
  String textoclaro;
  String textocifrado;
  int ncolumnas;
  late List matriz;

  CifraColumnas()
      : textoclaro = "",
        textocifrado = "",
        ncolumnas = 0;

  set textoClaro(String valor) => textoclaro = valor;
  set textoCifrado(String valor) => textocifrado = valor;
  set numeroColumnas(int valor) => ncolumnas = valor;

  String cifrar() {
    String salida = "";
    int N = textoclaro.length;
    int nfilas = (N / ncolumnas).ceil();

    matriz = List.generate(
        ncolumnas, (index) => List<String>.generate(nfilas, (index) => 'X'));

    int indice = 0;
    for (int idf = 0; idf < ncolumnas; idf++) {
      for (int idc = 0; idc < nfilas; idc++) {
        if (indice < N) {
          matriz[idf][idc] = textoclaro[indice];
        }
        indice++;
      }
    }

    for (int idc = 0; idc < nfilas; idc++) {
      for (int idf = 0; idf < ncolumnas; idf++) {
        salida += matriz[idf][idc];
      }
    }

    return salida;
  }

  String descifrar() {
    String salida = "";
    int N = textocifrado.length;
    int nfilas = (N / ncolumnas).ceil();

    matriz = List.generate(
        ncolumnas, (index) => List<String>.generate(nfilas, (index) => 'X'));

    int indice = 0;
    for (int idc = 0; idc < nfilas; idc++) {
      for (int idf = 0; idf < ncolumnas; idf++) {
        if (indice < N) {
          matriz[idf][idc] = textocifrado[indice];
        }
        indice++;
      }
    }

    for (int idf = 0; idf < ncolumnas; idf++) {
      for (int idc = 0; idc < nfilas; idc++) {
        salida += matriz[idf][idc];
      }
    }

    return salida;
  }
}
