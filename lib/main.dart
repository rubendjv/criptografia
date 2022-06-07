import 'package:flutter/material.dart';

import 'package:criptografia/routes/pageRoute.dart';
import 'package:criptografia/fragments/cifraPuroPage.dart';
import 'package:criptografia/fragments/cifraPuroClavePage.dart';
import 'package:criptografia/fragments/cifraGruposPage.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavigationDrawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: cifraPuroClavePage(),
      routes: {
        pageRoutes.cifrap: (context) => cifraPuroPage(),
        pageRoutes.cifrapc: (context) => cifraPuroClavePage(),
        pageRoutes.cifrag: (context) => cifraGrupoPage(),
      },
    );
  }
}
