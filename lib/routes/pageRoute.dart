// ignore_for_file: file_names
import 'package:criptografia/fragments/cifraFilasPage.dart';
import 'package:criptografia/fragments/cifraPuroPage.dart';
import 'package:criptografia/fragments/cifraGruposPage.dart';
import 'package:criptografia/fragments/cifraPuroClavePage.dart';
import 'package:criptografia/fragments/cifraSeriesPage.dart';

// ignore: camel_case_types
class pageRoutes {
  static const String cifrap = cifraPuroPage.routeName;
  static const String cifrapc = cifraPuroClavePage.routeName;
  static const String cifrag = cifraGrupoPage.routeName;
  static const String cifras = cifraSeriesPage.routeName;
  static const String cifraf = cifraFilasPage.routeName;
}
