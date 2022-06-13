// ignore_for_file: file_names

class CifraGrupos {
  String textoclaro;
  String textocifrado;
  var lista = [];
  int ancho;

  CifraGrupos()
      : textocifrado = "",
        textoclaro = "",
        ancho = 0;

  set textoClaro(String valor) => textoclaro = valor;
  set textoCifrado(String valor) => textocifrado = valor;

  void toList(String valor) {
    if (valor.trim().isEmpty) return;

    List<String> datos = valor.split(",");
    for (int i = 0; i < datos.length; i++) {
      int valor = int.parse(datos[i]);
      lista.add(valor);
    }
  }

  String cifrar() {
    String salida = "";
    int N = textoclaro.length;

    int grupos = (N / ancho).ceil();
    for (int i = 0; i < grupos; i++) {
      for (int j = 0; j < ancho; j++) {
        int indice = (i * ancho + (lista[j] - 1)).toInt();
        String vC = indice < N ? textoclaro[indice] : 'X';
        salida += vC;
      }
    }
    return salida;
  }

  String descifrar() {
    textoclaro = textocifrado;
    int N = textocifrado.length;
    List<String> salida = List.generate(N, (index) => "");

    int grupos = (N / ancho).ceil();
    for (int i = 0; i < grupos; i++) {
      for (int j = 0; j < ancho; j++) {
        int indice = i * ancho + j;
        String vC = indice < N ? textocifrado[indice] : 'X';
        indice = (i * ancho + (lista[j] - 1)).toInt();
        salida[indice] = vC;
      }
    }
    textoclaro = salida.toString();
    return textoclaro;
  }
}
