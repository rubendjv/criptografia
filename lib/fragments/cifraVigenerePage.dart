// ignore_for_file: file_names, camel_case_types, must_be_immutable
import 'package:flutter/material.dart';

import 'package:criptografia/navigationDrawer/navigationDrawer.dart';
import 'package:criptografia/algoritmos/CifraVigenere.dart';

class cifraVigenerePage extends StatelessWidget {
  static const String routeName = '/cifraVigenerePage';

  cifraVigenerePage({Key? key}) : super(key: key);
  final ctrTxtM = TextEditingController();
  final ctrTxtC = TextEditingController();
  final ctrTxtClave = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String accion = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cifra de Vigenere"),
        ),
        drawer: const navigationDrawer(),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: ctrTxtClave,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Clave',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese una Clave';
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
                              String texto = ctrTxtM.text.toUpperCase();
                              texto = texto.replaceAll(' ', '');
                              CifraVigenere vigenere = CifraVigenere();
                              vigenere.textoClaro = texto;
                              vigenere.textoClave =
                                  ctrTxtClave.text.toUpperCase();
                              ctrTxtC.text = vigenere.cifrar();
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
                              String texto = ctrTxtC.text.toUpperCase();
                              texto = texto.replaceAll(' ', '');
                              texto = texto.replaceAll('\n', '');
                              var vigenere = CifraVigenere();
                              vigenere.textoCifrado = texto;
                              vigenere.textoClave =
                                  ctrTxtClave.text.toUpperCase();
                              ctrTxtM.text = vigenere.descifrar();
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
