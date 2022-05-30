// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

import 'package:criptografia/navigationDrawer/navigationDrawer.dart';

class contactPage extends StatelessWidget {
 static const String routeName = '/contactPage';

  const contactPage({Key? key}) : super(key: key);
 @override
 Widget build(BuildContext context) {
   return  Scaffold(
       appBar: AppBar(
         title: const Text("Contacts"),
       ),
       drawer: const navigationDrawer(),
       body: const Center(child: Text("This is contacts page")));
 }
}