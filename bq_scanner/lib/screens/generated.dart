import 'package:flutter/material.dart';
import 'package:bq_scanner/constants.dart';
import 'package:bq_scanner/screens/home.dart';
import 'package:bq_scanner/screens/qrcode.dart';
import 'package:bq_scanner/screens/sidebar.dart';
import 'package:bq_scanner/screens/barcode.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

class GeneratedQRCode extends StatefulWidget {
  const GeneratedQRCode({Key? key, required this.qrDataToGenerate})
      : super(key: key);
  final String qrDataToGenerate;
  @override
  State<GeneratedQRCode> createState() => _GeneratedQRCodeState();
}

class _GeneratedQRCodeState extends State<GeneratedQRCode> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _qrImage = GlobalKey();
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
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.qr_code_scanner_sharp,
                          size: 50,
                          color: darkTextColor,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "QR Code Generated",
                          style: TextStyle(
                            color: lightTextColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  thickness: 1.0,
                  color: lightTextColor,
                  height: 1,
                ),
                const SizedBox(height: 15),
                RepaintBoundary(
                  key: _qrImage,
                  child: SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width - 55,
                    child: SfBarcodeGenerator(
                      backgroundColor: bgColor,
                      value: widget.qrDataToGenerate,
                      symbology: QRCode(),
                      // showValue: true,
                    ),
                  ),
                  // child: QrImage(
                  //   data: widget.qrDataToGenerate,
                  //   version: QrVersions.auto,
                  //   backgroundColor: Colors.white,
                  //   size: 300,
                  //   errorStateBuilder: (cxt, err) {
                  //     return QrImage(
                  //       data: 'Data was unreadable',
                  //       version: QrVersions.auto,
                  //       backgroundColor: Colors.white,
                  //       size: 300,
                  //     );
                  //   },
                  // ),
                ),
                const SizedBox(height: 15),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  thickness: 1.0,
                  height: 1,
                  color: lightTextColor,
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Download",
                      style: TextStyle(fontSize: 20, color: buttonColor),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 1.0,
                      color: buttonColor,
                    ),
                  ),
                  onPressed: () {
                    ShareFilesAndScreenshotWidgets().shareScreenshot(
                      _qrImage,
                      300,
                      "QR Code",
                      "QR.png",
                      "image/png",
                      text: "Generated by $appNamePrefix QR Code Generator.",
                    );
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "More",
                          style: TextStyle(
                            fontSize: 20,
                            color: buttonColor,
                          ),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: buttonColor),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const QrCodeGenerationScreen(),
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

class GeneratedBarCode extends StatefulWidget {
  const GeneratedBarCode({Key? key, required this.barDataToGenerate})
      : super(key: key);
  final String barDataToGenerate;

  @override
  State<GeneratedBarCode> createState() => _GeneratedBarCodeState();
}

class _GeneratedBarCodeState extends State<GeneratedBarCode> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _barImage = GlobalKey();
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
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.view_column,
                          size: 50,
                          color: darkTextColor,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Barcode Generated",
                          style: TextStyle(
                            color: lightTextColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  thickness: 1.0,
                  color: lightTextColor,
                  height: 1,
                ),
                const SizedBox(height: 20),
                RepaintBoundary(
                  key: _barImage,
                  child: SizedBox(
                    height: 120,
                    width: MediaQuery.of(context).size.width - 55,
                    child: SfBarcodeGenerator(
                      backgroundColor: bgColor,
                      value: widget.barDataToGenerate,
                      symbology: Code128C(),
                      showValue: true,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  thickness: 1.0,
                  height: 1,
                  color: lightTextColor,
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Share Barcode",
                      style: TextStyle(fontSize: 20, color: buttonColor),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 1.0,
                      color: buttonColor,
                    ),
                  ),
                  onPressed: () {
                    ShareFilesAndScreenshotWidgets().shareScreenshot(
                      _barImage,
                      300,
                      "Barcode",
                      "BarC.png",
                      "image/png",
                      text: "Generated by $appNamePrefix Barcode Generator.",
                    );
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
                          "More",
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
                            builder: (context) =>
                                const BarcodeGenerationScreen(),
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
