class CifraZigZag {
  String textoclaro;
  String textocifrado;
  int rails;

  CifraZigZag()
      : textoclaro = "",
        textocifrado = "",
        rails = 0;

  set textoClaro(String valor) => textoclaro = valor;
  set textoCifrado(String valor) => textocifrado = valor;
  set numeroFilas(int valor) => rails = valor;

  String cifrar() {
    String salida = "";

    String text = textoclaro.toUpperCase();
    //text = Regex.Replace(text, @"[^A-Z0-9]", string.Empty);

    List<String> lines = List.generate(rails, (index) => "");

    int currentLine = 0;
    int direction = 1;

    for (int i = 0; i < text.length; i++) {
      lines[currentLine] += text[i];

      if (currentLine == 0) {
        direction = 1;
      } else if (currentLine == rails - 1) {
        direction = -1;
      }

      currentLine += direction;
    }

    //StringBuilder result = new StringBuilder();
    ////result.Append(lines[i].ToString());
    for (int i = 0; i < rails; i++) {
      salida += lines[i];
    }

    return salida;
  }

  String descifrar() {
    String salida = "";
    String text = textocifrado.toUpperCase();
    List<String> lines = List.generate(rails, (index) => "");

    List<int> linesLenght = List.generate(rails, (index) => 0);

    int currentLine = 0;
    int direction = 1;

    for (int i = 0; i < text.length; i++) {
      linesLenght[currentLine]++;
      if (currentLine == 0) {
        direction = 1;
      } else if (currentLine == rails - 1) {
        direction = -1;
      }
      currentLine += direction;
    }
    int currentChar = 0;

    for (int line = 0; line < rails; line++) {
      for (int c = 0; c < linesLenght[line]; c++) {
        lines[line] += text[currentChar];
        currentChar++;
      }
    }

    currentLine = 0;
    direction = 1;

    List<int> currentReadLine = List.generate(rails, (index) => 0);

    for (int i = 0; i < text.length; i++) {
      salida += lines[currentLine][currentReadLine[currentLine]];
      currentReadLine[currentLine]++;

      if (currentLine == 0) {
        direction = 1;
      } else if (currentLine == rails - 1) {
        direction = -1;
      }
      currentLine += direction;
    }

    return salida;
  }
}
