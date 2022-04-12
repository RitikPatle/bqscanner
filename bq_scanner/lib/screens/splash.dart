import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bq_scanner/constants.dart';
import 'package:bq_scanner/screens/home.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class XplashXcreen extends StatefulWidget {
  const XplashXcreen({Key? key}) : super(key: key);

  @override
  State<XplashXcreen> createState() => _XplashXcreenState();
}

class _XplashXcreenState extends State<XplashXcreen> {
  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/logo.png",
                height: 300,
                width: 300,
              ),
              const SizedBox(height: 15),
              Text(
                appName,
                style: TextStyle(
                  fontFamily: "Comfortaa",
                  decoration: TextDecoration.none,
                  color: darkTextColor,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "By Ritik Patle",
                style: TextStyle(
                  fontFamily: "Comfortaa",
                  decoration: TextDecoration.none,
                  color: lightTextColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          LoadingAnimationWidget.staggeredDotsWave(
            color: darkTextColor,
            size: 80,
          ),
        ],
      ),
    );
  }
}
