// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';

import 'package:criptografia/navigationDrawer/navigationDrawer.dart';

class eventPage extends StatelessWidget {
 static const String routeName = '/eventPage';

  const eventPage({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
         title: const Text("Events"),
       ),
       drawer: const navigationDrawer(),
       body: const Center(child: Text("Hey! this is events list page")));
 }
}