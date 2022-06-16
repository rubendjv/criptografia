// ignore_for_file: file_names
import 'package:criptografia/fragments/cifraCardanoPage.dart';
import 'package:criptografia/fragments/cifraColumnasPage.dart';
import 'package:criptografia/fragments/cifraFilasPage.dart';
import 'package:criptografia/fragments/cifraPlayFairPage.dart';
import 'package:criptografia/fragments/cifraPuroPage.dart';
import 'package:criptografia/fragments/cifraGruposPage.dart';
import 'package:criptografia/fragments/cifraPuroClavePage.dart';
import 'package:criptografia/fragments/cifraSeriesPage.dart';
import 'package:criptografia/fragments/cifraVernamPage.dart';
import 'package:criptografia/fragments/cifraZigZagPage.dart';
import 'package:criptografia/fragments/grupoPage.dart';
import 'package:criptografia/fragments/kasiskiPage.dart';

// ignore: camel_case_types
class pageRoutes {
  static const String cifrap = cifraPuroPage.routeName;
  static const String cifrapc = cifraPuroClavePage.routeName;
  static const String cifrag = cifraGrupoPage.routeName;
  static const String cifras = cifraSeriesPage.routeName;
  static const String cifraf = cifraFilasPage.routeName;
  static const String cifraz = cifraZigZagPage.routeName;
  static const String cifrapf = cifraPlayFairPage.routeName;
  static const String cifrav = cifraVernamPage.routeName;
  static const String cifrarc = cifraCardanoPage.routeName;
  static const String cifrac = cifraColumnasPage.routeName;
  static const String kasiski = kasiskiPage.routeName;
  static const String version = grupoPage.routeName;
}
