import 'package:flutter/material.dart';
import 'package:bq_scanner/constants.dart';
import 'package:bq_scanner/screens/home.dart';
import 'package:bq_scanner/screens/sidebar.dart';
import 'package:bq_scanner/screens/generated.dart';

class QrCodeGenerationScreen extends StatefulWidget {
  const QrCodeGenerationScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeGenerationScreen> createState() => _QrCodeGenerationScreenState();
}

class _QrCodeGenerationScreenState extends State<QrCodeGenerationScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _qrDataToBeGenerated = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          "$appNamePrefix QR Code Generator",
          style: TextStyle(
            fontSize: 22,
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
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.qr_code_scanner_sharp,
                    size: 120,
                    color: darkTextColor,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "QR Code Generator",
                    style: TextStyle(
                      color: lightTextColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: "Enter any text",
                  labelStyle: TextStyle(
                    color: lightTextColor,
                  ),
                  prefixIcon: Icon(
                    Icons.qr_code_scanner_sharp,
                    color: darkTextColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: darkTextColor,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: darkTextColor,
                      width: 2.0,
                    ),
                  ),
                  fillColor: lightTextColor,
                ),
                onChanged: (value) {
                  setState(() {
                    _qrDataToBeGenerated = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              Column(
                children: [
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
                          builder: (context) => GeneratedQRCode(
                            qrDataToGenerate: _qrDataToBeGenerated,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  OutlinedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 18,
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
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
