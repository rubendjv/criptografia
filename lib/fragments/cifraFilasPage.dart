// ignore_for_file: file_names

import 'package:criptografia/algoritmos/CifraFilas.dart';
import 'package:flutter/material.dart';
import 'package:criptografia/navigationDrawer/navigationDrawer.dart';

class cifraFilasPage extends StatelessWidget {
  static const String routeName = '/cifraFilasPage';

  cifraFilasPage({Key? key}) : super(key: key);
  final ctrTxtM = TextEditingController();
  final ctrTxtC = TextEditingController();
  final ctrTxtB = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String accion = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cifra por Filas"),
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
                      child: TextFormField(
                        controller: ctrTxtB,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Filas',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese un numero de Filas';
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
                            maxLines: 8, //or null
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
                            maxLines: 8, //or null
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
                              CifraFilas filas = CifraFilas();
                              filas.textoClaro = ctrTxtM.text;
                              filas.numeroFilas = int.parse(ctrTxtB.text);
                              ctrTxtC.text = filas.cifrar();
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
                              CifraFilas filas = CifraFilas();
                              filas.textoCifrado = ctrTxtC.text;
                              filas.numeroFilas = int.parse(ctrTxtB.text);
                              ctrTxtM.text = filas.descifrar();
                            }
                          },
                          child: const Text('Desifrar Texto'),
                        )
                      ],
                    )
                  ],
                ))));
  }
}
