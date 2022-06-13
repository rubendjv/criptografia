// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:criptografia/navigationDrawer/navigationDrawer.dart';
import 'package:criptografia/algoritmos/CifraVernam.dart';

class cifraVernamPage extends StatelessWidget {
  static const String routeName = '/cifraVernamPage';

  cifraVernamPage({Key? key}) : super(key: key);
  final ctrTxtM = TextEditingController();
  final ctrTxtC = TextEditingController();
  final ctrTxtB = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String accion = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cifra Vernam"),
        ),
        drawer: const navigationDrawer(),
        body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: ctrTxtB,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Clave',
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
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        ),
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () {
                        accion = "M";
                        if (_formKey.currentState!.validate()) {
                          CifraVernam series = CifraVernam();
                          ctrTxtC.text =
                              series.getCifrado(ctrTxtM.text, ctrTxtB.text);
                        }
                      },
                      child: const Text('Cifrar Texto'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: const Size(88, 44),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        accion = "C";
                        if (_formKey.currentState!.validate()) {
                          CifraVernam series = CifraVernam();
                          ctrTxtM.text =
                              series.getDescifrado(ctrTxtC.text, ctrTxtB.text);
                        }
                      },
                      child: const Text('Desifrar Texto'),
                    )
                  ],
                )
              ],
            )));
  }
}
