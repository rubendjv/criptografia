// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:criptografia/navigationDrawer/navigationDrawer.dart';

class grupoPage extends StatelessWidget {
  static const String routeName = '/grupoPage';

  grupoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Criptografia y Seguridad"),
        ),
        drawer: const navigationDrawer(),
        body: SingleChildScrollView(
            child: Column(children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Text('PROYECTO #1', style: TextStyle(fontSize: 25)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Text('Grupo D', style: TextStyle(fontSize: 25)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Text('Integrantes', style: TextStyle(fontSize: 25)),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child:
                  Text('ARDAYA GARZON RONALD', style: TextStyle(fontSize: 25)),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Text('CABALLERO ORTIZ MARIA DEL CARMEN',
                  style: TextStyle(fontSize: 25)),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Text('CAMPOS COSSIO JUAN JOSE',
                  style: TextStyle(fontSize: 25)),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Text('CHAMBI GONZALES NIELS ROY',
                  style: TextStyle(fontSize: 25)),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Text('DORADO GUERRERO CARLOS EDUARDO',
                  style: TextStyle(fontSize: 25)),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Text('GATICA AGUIRRE VICTOR HUGO',
                  style: TextStyle(fontSize: 25)),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Text('JUSTINIANO VACA RUBEN DARIO',
                  style: TextStyle(fontSize: 25)),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Text('MAMANI QUISPIA AXEL ALEXANDER',
                  style: TextStyle(fontSize: 25)),
            ),
          )
        ])));
  }
}
