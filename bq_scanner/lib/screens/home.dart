import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bq_scanner/constants.dart';
import 'package:bq_scanner/screens/qrcode.dart';
import 'package:bq_scanner/screens/scanner.dart';
import 'package:bq_scanner/screens/sidebar.dart';
import 'package:bq_scanner/screens/barcode.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcae8ff),
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
                const SizedBox(height: 5),
                Text(
                  "Scanner | Generator",
                  style: TextStyle(
                    color: lightTextColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            OutlinedButton(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Scan QR | Barcode",
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 20,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScanScreen(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1.0,
                  color: buttonColor,
                ),
              ),
            ),
            OutlinedButton(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Generate QR Code",
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrCodeGenerationScreen(),
                  ),
                );
              },
            ),
            OutlinedButton(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Generate Barcode",
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
                    builder: (context) => const BarcodeGenerationScreen(),
                  ),
                );
              },
            ),
            OutlinedButton(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Exit Application",
                  style: TextStyle(
                    fontSize: 18,
                    color: buttonColor,
                  ),
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 0.9,
                  color: buttonColor,
                ),
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
