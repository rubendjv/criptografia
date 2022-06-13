// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';

import 'package:criptografia/widgets/createDrawerHeader.dart';
import 'package:criptografia/widgets/createDrawerBodyItem.dart';
import 'package:criptografia/routes/pageRoute.dart';

class navigationDrawer extends StatelessWidget {
  const navigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          const Text("  Cifra Desplazamiento"),
          createDrawerBodyItem(
            icon: Icons.crop_square_rounded,
            text: 'Cifra Puro',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.cifrap),
          ),
          createDrawerBodyItem(
            icon: Icons.crop,
            text: 'Cifra Puro con Clave',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.cifrapc),
          ),
          const Divider(),
          const Text("  Transposicion"),
          createDrawerBodyItem(
            icon: Icons.crop,
            text: 'Grupos',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.cifrag),
          ),
          createDrawerBodyItem(
            icon: Icons.crop,
            text: 'Series',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.cifras),
          ),
          createDrawerBodyItem(
            icon: Icons.crop,
            text: 'Filas',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.cifraf),
          ),
          createDrawerBodyItem(
            icon: Icons.crop,
            text: 'Zig Zag',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.cifraz),
          ),
          const Divider(),
          const Text("  Sustitucion"),
          createDrawerBodyItem(
            icon: Icons.crop,
            text: 'PlayFair',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.cifrapf),
          ),
          createDrawerBodyItem(
            icon: Icons.crop,
            text: 'Vernam',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.cifrav),
          ),
        ],
      ),
    );
  }
}
