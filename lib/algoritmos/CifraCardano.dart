// ignore_for_file: file_names

class CifraCardano {
  List<List<String>> gridState = [
    [
      '',
      '',
      '',
      '',
      '',
      '',
    ],
    [
      '',
      '',
      '',
      '',
      '',
      '',
    ],
    [
      '',
      '',
      '',
      '',
      '',
      '',
    ],
    [
      '',
      '',
      '',
      '',
      '',
      '',
    ],
    [
      '',
      '',
      '',
      '',
      '',
      '',
    ],
    [
      '',
      '',
      '',
      '',
      '',
      '',
    ],
  ];
  List<List<String>> matriz;

  CifraCardano() : matriz = [];

  void copiarValor(int x, int y) {
    String value = gridState[x][y];
    int N = gridState.length - 1;
    int x1 = y, y1 = N - x;
    gridState[x1][y1] = value.length == 0 ? '' : '2';
    x1 = N - x;
    y1 = N - y;
    gridState[x1][y1] = value.length == 0 ? '' : '3';
    x1 = N - y;
    y1 = x;
    gridState[x1][y1] = value.length == 0 ? '' : '4';
  }

  String cifrar(String textoClaro) {
    int N = gridState.length;
    int elementos = N * N;
    int espacios = (elementos / 4).truncate();

    textoClaro = textoClaro.toUpperCase();
    textoClaro = textoClaro.replaceAll(' ', '');

    int ancho = textoClaro.length;
    int relleno = elementos - ancho;
    for (int r = 0; r < relleno; r++) {
      textoClaro += 'X';
    }

    String salida = '';
    initMatriz();

    for (int i = 0; i < 4; i++) {
      String aux =
          textoClaro.substring(i * espacios, (i * espacios) + espacios);
      toMatriz(i + 1, aux);
    }

    for (int x = 0; x < N; x++) {
      for (int y = 0; y < N; y++) {
        salida += matriz[x][y];
      }
    }
    return salida;
  }

  void toMatriz(int i, String dato) {
    int id = 0;
    int N = gridState.length;
    for (int x = 0; x < N; x++) {
      for (int y = 0; y < N; y++) {
        if (gridState[x][y] == '$i') {
          matriz[x][y] = dato[id];
          id++;
        }
      }
    }
  }

  void addMatriz(String dato) {
    int id = 0;
    int N = gridState.length;
    for (int x = 0; x < N; x++) {
      for (int y = 0; y < N; y++) {
        matriz[x][y] = dato[id];
        id++;
      }
    }
  }

  void initMatriz() {
    int N = gridState.length;
    matriz =
        List.generate(N, (index) => List<String>.generate(N, (index) => ''));
  }

  String descifrar(String textoCifrado) {
    textoCifrado = textoCifrado.toUpperCase();
    int N = gridState.length;
    int elementos = N * N;
    if (textoCifrado.length > elementos) {
      return "El ancho es mayor al numero de elementos de la matriz";
    }
    initMatriz();
    addMatriz(textoCifrado);

    String salida = "";
    for (int i = 0; i < 4; i++) {
      salida += getMatriz(i + 1);
    }
    return salida;
  }

  String getMatriz(int i) {
    String salida = "";

    int N = gridState.length;
    for (int x = 0; x < N; x++) {
      for (int y = 0; y < N; y++) {
        if (gridState[x][y] == '$i') {
          salida += matriz[x][y];
        }
      }
    }

    return salida;
  }
}
