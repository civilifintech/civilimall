import 'package:civilimall/state/authenState.dart';
import 'package:civilimall/state/introState.dart';
import 'package:civilimall/state/mallState.dart';
import 'package:civilimall/state/scanQRState.dart';
import 'package:civilimall/state/formState.dart';
import 'package:civilimall/utility/constant.dart';

import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> map = {
  '/authenState': (BuildContext context) => Authen(),
  '/introState': (BuildContext context) => Intro(),
  '/mallState': (BuildContext context) => Mall(),
  '/scanQRState': (BuildContext context) => ScanQR(),
  '/scanFormState': (BuildContext context) => scanForm(),
};

String? initlalRoute;
void main() {
  // initlalRoute = Constant.routeAuthen;
  initlalRoute = Constant.routeIntro;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constant.appName,
      routes: map,

      // theme: ThemeData(fontFamily: 'Sukhumvit Set'),
      initialRoute: initlalRoute,
    );
  }
}
