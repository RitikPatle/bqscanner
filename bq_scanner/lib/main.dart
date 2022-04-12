import 'package:flutter/material.dart';
import 'package:bq_scanner/constants.dart';
import 'package:bq_scanner/screens/splash.dart';

/*
An QR Code and Barcode Scanner and Generator.
Developed by Ritik Patle [https://ritik-patle.web.app/]
 */

void main() {
  runApp(const QBApp());
}

class QBApp extends StatelessWidget {
  const QBApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Comfortaa",
        primarySwatch: Colors.blue,
      ),
      home: const XplashXcreen(),
    );
  }
}
