// ignore_for_file: file_names
import 'package:criptografia/algoritmos/CifraPuro.dart';
import 'package:flutter/material.dart';

import 'package:criptografia/navigationDrawer/navigationDrawer.dart';
import 'package:criptografia/algoritmos/CifraCardano.dart';

// ignore: camel_case_types
class cifraCardanoPage extends StatefulWidget {
  static const String routeName = '/cifraCardanoPage';

  @override
  _cifraCardanoState createState() => _cifraCardanoState();
}

class _cifraCardanoState extends State<cifraCardanoPage> {
  final ctrTxtM = TextEditingController();
  final ctrTxtC = TextEditingController();
  final ctrTxtB = TextEditingController(text: '3');
  final _formKey = GlobalKey<FormState>();
  String accion = "";
  CifraCardano cardano = CifraCardano();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cifra Rejilla de Cardano"),
        ),
        drawer: const navigationDrawer(),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: _buildGameBody(),
                    ),
                    Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: ctrTxtM,
                            maxLines: 3, //or null
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Texto Claro',
                            ),
                            validator: (value) {
                              if (accion != "M") return null;
                              if (value == null || value.isEmpty) {
                                return 'Ingrese un valor para Texto Claro';
                              }
                              return null;
                            },
                          ),
                        )),
                    Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: ctrTxtC,
                            maxLines: 3, //or null
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Texto Cifrado',
                            ),
                            validator: (value) {
                              if (accion != "C") return null;
                              if (value == null || value.isEmpty) {
                                return 'Ingrese un valor para Texto Cifrado';
                              }
                              return null;
                            },
                          ),
                        )),
                    Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            minimumSize: const Size(88, 44),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)),
                            ),
                            backgroundColor: Colors.orange,
                          ),
                          onPressed: () {
                            accion = "M";
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                ctrTxtC.text = cardano.cifrar(ctrTxtM.text);
                              });
                            }
                          },
                          child: const Text('Cifrar Texto'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            minimumSize: const Size(88, 44),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)),
                            ),
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            accion = "C";
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                ctrTxtM.text = cardano.descifrar(ctrTxtC.text);
                              });
                            }
                          },
                          child: const Text('Desifrar Texto'),
                        )
                      ],
                    )
                  ],
                ))));
  }

  Widget _buildGameBody() {
    int gridStateLength = cardano.gridState.length;
    return SizedBox(
        width: 360, // hard coding child width
        child: Column(children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0)),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridStateLength,
                ),
                itemBuilder: _buildGridItems,
                itemCount: gridStateLength * gridStateLength,
              ),
            ),
          ),
        ]));
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int gridStateLength = cardano.gridState.length;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    return GestureDetector(
      onTap: () => _gridItemTapped(x, y),
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: Center(
            child: _buildGridItem(x, y),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(int x, int y) {
    switch (cardano.gridState[x][y]) {
      case '':
        return const Text('');
      case '1':
        return Container(
            color: Colors.green,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  cardano.matriz.length > 1
                      ? cardano.matriz[x][y]
                      : cardano.gridState[x][y],
                  style: TextStyle(fontSize: 20),
                )));
      case '2':
        return Container(
            color: Colors.yellow,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                cardano.matriz.length > 1
                    ? cardano.matriz[x][y]
                    : cardano.gridState[x][y],
                style: TextStyle(fontSize: 20),
              ),
            ));
      case '3':
        return Container(
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                  cardano.matriz.length > 1
                      ? cardano.matriz[x][y]
                      : cardano.gridState[x][y],
                  style: TextStyle(fontSize: 20)),
            ));
      case '4':
        return Container(
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                  cardano.matriz.length > 1
                      ? cardano.matriz[x][y]
                      : cardano.gridState[x][y],
                  style: TextStyle(fontSize: 20)),
            ));
      default:
        return Text(cardano.gridState[x][y].toString());
    }
  }

  void _gridItemTapped(int x, int y) {
    setState(() {
      if (cardano.gridState[x][y] == '') {
        cardano.gridState[x][y] = '1';
        cardano.copiarValor(x, y);
      } else if (cardano.gridState[x][y] == '1') {
        cardano.gridState[x][y] = '';
        cardano.copiarValor(x, y);
      }
    });
  }
}
