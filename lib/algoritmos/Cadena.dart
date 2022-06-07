// ignore_for_file: file_names
class Cadena {
  String cadena;
  Cadena(this.cadena);

  String get text {
    return cadena;
  }

  void eliminarRepetidos() {
    String salida = "";
    String aux;

    for (int i = 0; i < cadena.length; i++) {
      aux = cadena[i];
      if (!salida.contains(aux)) salida += aux;
    }
    cadena = salida;
  }

  void desplazar(int d) {
    String salida;
    int N = cadena.length;
    salida = cadena.substring(N - d, N) + cadena.substring(0, N - d);
    cadena = salida;
  }
}
