import 'package:flutter/material.dart';
import 'package:bq_scanner/constants.dart';
import 'package:bq_scanner/screens/home.dart';
import 'package:bq_scanner/screens/sidebar.dart';
import 'package:bq_scanner/screens/generated.dart';

class BarcodeGenerationScreen extends StatefulWidget {
  const BarcodeGenerationScreen({Key? key}) : super(key: key);

  @override
  State<BarcodeGenerationScreen> createState() =>
      _BarcodeGenerationScreenState();
}

class _BarcodeGenerationScreenState extends State<BarcodeGenerationScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _barDataToBeGenerated = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          "$appNamePrefix Barcode Generator",
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
                    Icons.view_column,
                    size: 100,
                    color: iconOnLight,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Barcode Generator",
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
                    Icons.view_column,
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
                    _barDataToBeGenerated = value;
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
                        "Generate Barcode",
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
                          builder: (context) => GeneratedBarCode(
                            barDataToGenerate: _barDataToBeGenerated,
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
