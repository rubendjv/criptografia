import 'package:flutter/material.dart';

import 'package:criptografia/routes/pageRoute.dart';
import 'package:criptografia/fragments/cifraPuroPage.dart';
import 'package:criptografia/fragments/contactPage.dart';
import 'package:criptografia/fragments/eventPage.dart';

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
     home: homePage(),
     routes:  {
       pageRoutes.home: (context) => homePage(),
       pageRoutes.contact: (context) => const contactPage(),
       pageRoutes.event: (context) => const eventPage(),
     },
   );
 }
}
