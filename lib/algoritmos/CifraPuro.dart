// ignore_for_file: file_names
class CifraPuro {
  String alfabeto = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
  String txtclaro;
  String txtcifrado;
  num b;

  CifraPuro()
      : txtclaro = "",
        txtcifrado = "",
        b = 3;

  set textoClaro(String valor) => txtclaro = valor;
  set textoCifrado(String valor) => txtcifrado = valor;
  set desplazamiento(num valor) => b = valor;

  String cifrar() {
    String aux = "";
    int N = alfabeto.length;

    for (int i = 0; i < txtclaro.length; i++) {
      String tM = txtclaro.substring(i, i + 1);

      int vM = alfabeto.indexOf(tM);
      if (vM >= 0) {
        num vC = (vM + b) % N;
        String tC = alfabeto[vC.toInt()];
        aux += tC;
      }
    }
    return aux;
  }

  String descifrar() {
    String aux = "";
    int N = alfabeto.length;

    for (int i = 0; i < txtcifrado.length; i++) {
      String tC = txtcifrado.substring(i, i + 1);

      int vC = alfabeto.indexOf(tC);
      if (vC >= 0) {
        num vM = (vC - b) % N;
        String tM = alfabeto[vM.toInt()];
        aux += tM;
      }
    }
    return aux;
  }
}
