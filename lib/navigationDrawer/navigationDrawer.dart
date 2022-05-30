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
         createDrawerBodyItem(
           icon: Icons.crop_square_rounded,
           text: 'Cifra Puro',
           onTap: () =>
               Navigator.pushReplacementNamed(context, pageRoutes.home),
         ),
         createDrawerBodyItem(
           icon: Icons.crop,
           text: 'Cifra Puro con Clave',
           onTap: () =>
               Navigator.pushReplacementNamed(context, pageRoutes.event),
         ),
         const Divider(),
         ListTile(
           title: const Text('App version 1.0.0'),
           onTap: () {},
         ),
       ],
     ),
   );
 }
}