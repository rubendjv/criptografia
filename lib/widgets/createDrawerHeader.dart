// ignore_for_file: file_names, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

Widget createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/bg_header.png'))),
      child: Stack(children: <Widget>[
        const Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Grupo - D",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}
