import 'package:flutter/material.dart';

class Constant {
// General
  static String appName = "CIVILI MALL";

  // Route
  static String routeAuthen = '/authenState';
  static String routeIntro = '/introState';
  static String routeMall = '/mallState';
  static String routeScanQR = '/scanQRState';

  // Image
  static String logo = "assets/images/cvl_logo.png";
  static String bgLogin = "assets/images/bgLogin.png";
  static String bgLogin2 = "assets/images/bgLogin2.png";

  // Color
  static Color primary = Color(0xffba0c00);
  static Color primaryLight = Color(0xfff44e2e);
  static Color primaryDark = Color(0xff820000);
  static Color white = Color(0xffffffff);

  // Style
  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        color: primaryDark,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: primaryDark,
        fontWeight: FontWeight.w700,
      );
  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: primaryDark,
        fontWeight: FontWeight.normal,
      );
}
