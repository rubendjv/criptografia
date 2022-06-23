// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:criptografia/algoritmos/Kasiski.dart';
import 'package:criptografia/navigationDrawer/navigationDrawer.dart';
import 'package:criptografia/algoritmos/CifraVigenere.dart';

class kasiskiPage extends StatefulWidget {
  static const String routeName = '/kasiskiPage';

  @override
  _kasiskiState createState() => _kasiskiState();
}

class _kasiskiState extends State<kasiskiPage> {
  final ctrTxtM = TextEditingController();
  final ctrTxtC = TextEditingController();
  final ctrTxtB = TextEditingController(text: '3');
  final ctrMcd = TextEditingController();
  final ctrClave = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String accion = "";
  Kasiski kasiski = Kasiski();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Criptoanalisis Kasiski"),
        ),
        drawer: const navigationDrawer(),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        controller: ctrTxtB,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Tamaño de repeticiones',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese un numero correcto';
                          }
                          return null;
                        },
                      ),
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
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            accion = "C";
                            if (_formKey.currentState!.validate()) {
                              kasiski.textoCifrado = ctrTxtC.text;
                              kasiski.anchoCadena = int.parse(ctrTxtB.text);
                              setState(() {
                                kasiski.buscarRepetidos();
                                ctrMcd.text = kasiski.valorMcd().toString();
                                ctrClave.text = kasiski.clave;
                                ctrTxtM.text = "";
                              });
                            }
                          },
                          child: const Text('Repeticiones'),
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
                            backgroundColor: Color.fromARGB(255, 6, 117, 43),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              int cantidad = int.parse(ctrMcd.text);
                              kasiski.subCriptogramas(cantidad);
                              kasiski.subRepeticiones(cantidad);
                              setState(() {
                                ctrClave.text = kasiski.clave;
                              });
                            }
                          },
                          child: const Text('Subcriptogramas'),
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
                            backgroundColor:
                                const Color.fromARGB(255, 255, 94, 0),
                          ),
                          onPressed: () {
                            accion = "C";
                            if (_formKey.currentState!.validate()) {
                              String texto = ctrTxtC.text.toUpperCase();
                              texto = texto.replaceAll(' ', '');
                              texto = texto.replaceAll('\n', '');
                              CifraVigenere vigenere = CifraVigenere();
                              vigenere.textoCifrado = texto;
                              vigenere.textoClave = ctrClave.text.toUpperCase();
                              ctrTxtM.text = vigenere.descifrar();
                            }
                          },
                          child: const Text('Descifrar Texto'),
                        ),
                      ],
                    ),
                    kasiski.subcrip.isEmpty
                        ? _tablaRepeticiones()
                        : _tablaSubcripto(),
                    kasiski.subrep.isNotEmpty
                        ? _tablaAnalisis() //const Text('...'),
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text("Longitud de clave"),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: TextFormField(
                                    controller: ctrMcd,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'mcd',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text("Clave"),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextFormField(
                              controller: ctrClave,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))));
  }

  Widget _tablaRepeticiones() {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Texto')),
        DataColumn(label: Text('Catidad')),
        DataColumn(label: Text('Distancia')),
      ],
      rows: kasiski.repeticiones.lista
          .map((element) => DataRow(cells: <DataCell>[
                DataCell(Text(element.texto)),
                DataCell(Text(element.cantidad.toString())),
                DataCell(Text(element.distancia.toString())),
              ]))
          .toList(),
    );
  }

  Widget _tablaSubcripto() {
    int nf = 0;
    return DataTable(
      columns: const [
        DataColumn(label: Text('Texto')),
        DataColumn(label: Text('Catidad')),
      ],
      rows: kasiski.subcrip
          .map((element) => DataRow(cells: <DataCell>[
                DataCell(Text('C' + (++nf).toString() + ':')),
                DataCell(Text(element)),
              ]))
          .toList(),
    );
  }

  Widget _tablaAnalisis() {
    String alfabeto = 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ ';
    List<String> fila =
        List<String>.generate(alfabeto.length, (index) => alfabeto[index]);
    return DataTable(
      columnSpacing: 11.0,
      columns: fila.map((e) => DataColumn(label: Text(e))).toList(),
      rows: kasiski.subrep
          .map((element) => DataRow(
              cells: element
                  .split(',')
                  .map((letra) => DataCell(Container(
                      color: letra.substring(letra.indexOf('.') + 1) == '1'
                          ? Color.fromARGB(255, 255, 38, 38)
                          : letra.substring(letra.indexOf('.') + 1) == '2'
                              ? Color.fromARGB(255, 1, 163, 14)
                              : letra.substring(letra.indexOf('.') + 1) == '3'
                                  ? Color.fromARGB(255, 63, 50, 253)
                                  : letra.substring(letra.indexOf('.') + 1) ==
                                          '4'
                                      ? Color.fromARGB(255, 252, 255, 54)
                                      : Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: letra.length > 0
                              ? Text(letra.substring(0, letra.length - 2))
                              : Text('')))))
                  .toList()))
          .toList(),
    );
  }
}
