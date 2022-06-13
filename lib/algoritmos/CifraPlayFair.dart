// ignore_for_file: file_names

class CifraPlayFair {
  String _alfabeto = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
  List<List<String>> _tabla = [];

  CifraPlayFair();
//--------------------------------------------------------------------------------
  String getCifrado(String textoClaro, [String clave = ""]) {
    textoClaro = textoClaro.toUpperCase();
    _tablaAlfabeto(clave);

    if (textoClaro.length % 2 != 0) {
      textoClaro += "X";
    }
    String cifrado = "";
    int i = 0;
    while (i < textoClaro.length) {
      String dosLetras = textoClaro.substring(i, i + 2);
      //print(dosLetras);
      int fila1 = 0, fila2 = 0, col1 = 0, col2 = 0;
      if (dosLetras[0] == "I" || dosLetras[0] == "J") {
        fila1 = getFila("IJ");
        col1 = _tabla[fila1].indexOf("IJ");
        fila2 = getFila(dosLetras[1]);
        col2 = _tabla[fila2].indexOf(dosLetras[1]);
      } else {
        if (dosLetras[1] == "I" || dosLetras[1] == "J") {
          fila1 = getFila(dosLetras[0]);
          col1 = _tabla[fila1].indexOf(dosLetras[0]);
          fila2 = getFila("IJ");
          col2 = _tabla[fila2].indexOf("IJ");
        } else {
          if (dosLetras[0] == "N" || dosLetras[0] == "Ñ") {
            fila1 = getFila("NÑ");
            col1 = _tabla[fila1].indexOf("NÑ");
            fila2 = getFila(dosLetras[1]);
            col2 = _tabla[fila2].indexOf(dosLetras[1]);
          } else {
            if (dosLetras[1] == "N" || dosLetras[1] == "Ñ") {
              fila1 = getFila(dosLetras[0]);
              col1 = _tabla[fila1].indexOf(dosLetras[0]);
              fila2 = getFila("NÑ");
              col2 = _tabla[fila2].indexOf("NÑ");
            } else {
              fila1 = getFila(dosLetras[0]);
              col1 = _tabla[fila1].indexOf(dosLetras[0]);
              fila2 = getFila(dosLetras[1]);
              col2 = _tabla[fila2].indexOf(dosLetras[1]);
            }
          }
        }
      }
      //print("$fila1 $col1 , $fila2 $col2");
      int nroRegla = getNroRegla(fila1, col1, fila2, col2);
      if (nroRegla == 1) {
        cifrado +=
            _tabla[fila1][(col1 + 1) % 5] + _tabla[fila2][(col2 + 1) % 5];
      } else if (nroRegla == 2) {
        cifrado +=
            _tabla[(fila1 + 1) % 5][col1] + _tabla[(fila2 + 1) % 5][col2];
      } else {
        cifrado += _tabla[fila1][col2] + _tabla[fila2][col1]; //nroRegla == 3
      }
      i += 2;
    }
    return cifrado;
  }

  int getFila(String letra) {
    for (int i = 0; i < _tabla.length; i++) {
      if (_tabla[i].contains(letra)) {
        return i;
      }
    }
    return -1;
  }

  int getNroRegla(int fila1, int col1, int fila2, int col2) {
    if (fila1 == fila2) {
      return 1;
    }
    if (col1 == col2) {
      return 2;
    }
    return 3;
  }

//--------------------------------------------------------------------------------
  String getDescifrado(String textoCifrado, String clave) {
    textoCifrado = textoCifrado.toUpperCase();
    if (clave == "") {
      return "LA CLAVE ES NECESARIA PARA DESCIFRAR";
    }
    if (textoCifrado.length % 2 != 0) {
      textoCifrado += "X";
    }
    _tablaAlfabeto(clave);
    String descifrado = "";
    int i = 0;
    while (i < textoCifrado.length) {
      String dosLetras = textoCifrado.substring(i, i + 2);
      //print(dosLetras);
      int fila1 = 0, fila2 = 0, col1 = 0, col2 = 0;
      if (dosLetras[0] == "I" || dosLetras[0] == "J") {
        fila1 = getFila("IJ");
        col1 = _tabla[fila1].indexOf("IJ");
        fila2 = getFila(dosLetras[1]);
        col2 = _tabla[fila2].indexOf(dosLetras[1]);
      } else {
        if (dosLetras[1] == "I" || dosLetras[1] == "J") {
          fila1 = getFila(dosLetras[0]);
          col1 = _tabla[fila1].indexOf(dosLetras[0]);
          fila2 = getFila("IJ");
          col2 = _tabla[fila2].indexOf("IJ");
        } else {
          if (dosLetras[0] == "N" || dosLetras[0] == "Ñ") {
            fila1 = getFila("NÑ");
            col1 = _tabla[fila1].indexOf("NÑ");
            fila2 = getFila(dosLetras[1]);
            col2 = _tabla[fila2].indexOf(dosLetras[1]);
          } else {
            if (dosLetras[1] == "N" || dosLetras[1] == "Ñ") {
              fila1 = getFila(dosLetras[0]);
              col1 = _tabla[fila1].indexOf(dosLetras[0]);
              fila2 = getFila("NÑ");
              col2 = _tabla[fila2].indexOf("NÑ");
            } else {
              fila1 = getFila(dosLetras[0]);
              col1 = _tabla[fila1].indexOf(dosLetras[0]);
              fila2 = getFila(dosLetras[1]);
              col2 = _tabla[fila2].indexOf(dosLetras[1]);
            }
          }
        }
      }
      int nroRegla = getNroRegla(fila1, col1, fila2, col2);
      if (nroRegla == 1) {
        descifrado +=
            _tabla[fila1][(col1 - 1) % 5] + _tabla[fila2][(col2 - 1) % 5];
      } else if (nroRegla == 2) {
        descifrado +=
            _tabla[(fila1 - 1) % 5][col1] + _tabla[(fila2 - 1) % 5][col2];
      } else {
        descifrado += _tabla[fila1][col2] + _tabla[fila2][col1]; //nroRegla == 3
      }
      i += 2;
    }
    return descifrado;
  }

//--------------------------------------------------------------------------------
  void _tablaAlfabeto(String clave) {
    _alfabeto = _alfabeto.replaceAll("J", "");
    _alfabeto = _alfabeto.replaceAll("Ñ", "");
    _addClaveToTable(clave);
    _addAlfabToTable();
    _resetAlfabeto();
  }

  void _resetAlfabeto() {
    _alfabeto = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
  }

  bool _noCompleta() {
    if (_tabla.length == 0) {
      List<String> fila = [];
      _tabla.add(fila);
    }
    return _tabla[_tabla.length - 1].length < 5;
  }

  void _completar() {
    int pos = _tabla[_tabla.length - 1].length;
    for (int i = pos; i < 5; i++) {
      String letra = _alfabeto[0];
      if (letra == "N") {
        _tabla[_tabla.length - 1].add("NÑ");
        _alfabeto = _alfabeto.replaceAll("N", "");
      } else if (letra == "I") {
        _tabla[_tabla.length - 1].add("IJ");
        _alfabeto = _alfabeto.replaceAll("I", "");
      } else {
        _tabla[_tabla.length - 1].add(letra);
        _alfabeto = _alfabeto.replaceAll(letra, "");
      }
    }
  }

  String _deleteDuplicates(String clave) {
    String claveLimpia = "";
    for (int i = 0; i < clave.length; i++) {
      if (!claveLimpia.contains(clave[i])) {
        claveLimpia += clave[i];
      }
    }
    if (claveLimpia.contains("N") && claveLimpia.contains("Ñ")) {
      claveLimpia = claveLimpia.replaceAll("Ñ", "");
    }
    if (claveLimpia.contains("I") && claveLimpia.contains("J")) {
      claveLimpia = claveLimpia.replaceAll("J", "");
    }
    return claveLimpia;
  }

  void _addClaveToTable(String clave) {
    clave = _deleteDuplicates(clave);
    while (clave.length > 4) {
      String fiveLetters = clave.substring(0, 5);
      _tabla.add(_getlistFiveLetters(fiveLetters));
      clave = clave.replaceAll(fiveLetters, "");
    }
    if (clave.length > 0) {
      _tabla.add(_getlistFiveLetters(clave));
    }
    if (_noCompleta()) {
      _completar();
    }
  }

  void _addAlfabToTable() {
    String fiveLetters = "";
    while (_alfabeto.length > 4) {
      fiveLetters = _alfabeto.substring(0, 5);
      List<String> listFiveLetters = _getlistFiveLetters(fiveLetters);
      _tabla.add(listFiveLetters);
    }
  }

  List<String> _getlistFiveLetters(String texto) {
    List<String> listFiveLetters = [];
    while (texto.length > 0) {
      if (texto[0] == "I") {
        listFiveLetters.add("IJ");
        texto = texto.replaceAll("I", "");
        _alfabeto = _alfabeto.replaceAll("I", "");
      } else if (texto[0] == "N") {
        listFiveLetters.add("NÑ");
        texto = texto.replaceAll("N", "");
        _alfabeto = _alfabeto.replaceAll("N", "");
      } else {
        listFiveLetters.add(texto[0]);
        _alfabeto = _alfabeto.replaceAll(texto[0], "");
        texto = texto.replaceAll(texto[0], "");
      }
    }
    return listFiveLetters;
  }
}
