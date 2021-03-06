import 'package:flutter/material.dart';
import 'package:bq_scanner/constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:bq_scanner/screens/home.dart';
import 'package:bq_scanner/screens/scanner.dart';
import 'package:bq_scanner/screens/sidebar.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowScannedData extends StatefulWidget {
  const ShowScannedData({Key? key, required this.scannedData})
      : super(key: key);

  final String scannedData;

  @override
  State<ShowScannedData> createState() => _ShowScannedDataState();
}

class _ShowScannedDataState extends State<ShowScannedData> {
  bool isUrl = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    bool tempData = Uri.parse(widget.scannedData).host == '' ? false : true;
    if (tempData == true) {
      setState(() {
        isUrl = true;
      });
    } else {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      key: _scaffoldKey,
      endDrawer: const Sidebar(),
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          appName,
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
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      height: 120,
                      width: 120,
                    ),
                    Text(
                      "Scanned Successfully",
                      style: TextStyle(
                        color: lightTextColor,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: darkTextColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        5.0,
                      ),
                    ),
                  ),
                  child: SelectableText(
                    widget.scannedData,
                    style: TextStyle(
                      color: lightTextColor,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (isUrl == true)
                  OutlinedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Launch Url",
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
                      launch(widget.scannedData);
                    },
                  ),
                const SizedBox(height: 10),
                OutlinedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Share Text",
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
                    Share.share(widget.scannedData);
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Scan",
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
                            builder: (context) => const ScanScreen(),
                          ),
                        );
                      },
                    ),
                    OutlinedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Back",
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
      ),
    );
  }
}
