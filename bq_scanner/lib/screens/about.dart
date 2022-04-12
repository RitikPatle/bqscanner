import 'package:flutter/material.dart';
import 'package:bq_scanner/constants.dart';
import 'package:bq_scanner/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bq_scanner/screens/sidebar.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          appName,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu_open_sharp,
              size: 30.0,
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          )
        ],
      ),
      endDrawer: const Sidebar(),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/logo.png",
                  height: 180,
                  width: 180,
                ),
                const SizedBox(height: 10),
                Text(
                  appName,
                  style: TextStyle(
                    color: darkTextColor,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Scanner | Generator",
                  style: TextStyle(
                    color: lightTextColor,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "By Ritik Patle",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: lightTextColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            OutlinedButton(
              child: Container(
                alignment: Alignment.center,
                width: 220,
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Visit Ritik's Website",
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 20,
                  ),
                ),
              ),
              onPressed: () {
                launch('https://ritik-patle.web.app/');
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1.0,
                  color: buttonColor,
                ),
              ),
            ),
            OutlinedButton(
              child: Container(
                alignment: Alignment.center,
                width: 220,
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "See Privacy Policy",
                  style: TextStyle(
                    fontSize: 20,
                    color: buttonColor,
                  ),
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1.0,
                  color: buttonColor,
                ),
              ),
              onPressed: () {
                launch('https://sites.google.com/view/bqscanner/home');
              },
            ),
            OutlinedButton(
              child: Container(
                alignment: Alignment.center,
                width: 220,
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Back to Home",
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 20,
                  ),
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1.0,
                  color: buttonColor,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
