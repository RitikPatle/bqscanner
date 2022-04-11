import 'package:flutter/material.dart';
import 'package:bq_scanner/constants.dart';
import 'package:bq_scanner/screens/home.dart';
import 'package:bq_scanner/screens/result.dart';
import 'package:bq_scanner/screens/sidebar.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  MobileScannerController cameraController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      key: _scaffoldKey,
      endDrawer: const Sidebar(),
      appBar: AppBar(
        backgroundColor: appBarColor,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_open_sharp,
            size: 30.0,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openEndDrawer();
          },
        ),
        title: const Text(
          appName,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(
                      Icons.flash_off,
                      color: Colors.white,
                    );
                  case TorchState.on:
                    return const Icon(
                      Icons.flash_on,
                      color: Colors.white,
                    );
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state as CameraFacing) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      "Scanning",
                      style: TextStyle(
                        fontSize: 20,
                        color: lightTextColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    LoadingAnimationWidget.horizontalRotatingDots(
                      color: lightTextColor,
                      size: 35,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.qr_code_scanner_sharp,
                      size: 35,
                      color: darkTextColor,
                    ),
                    Icon(
                      Icons.search,
                      size: 20,
                      color: darkTextColor,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 320,
              width: 320,
              child: MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: (barcode, args) {
                  final String? scannedData = barcode.rawValue;
                  if (scannedData != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowScannedData(
                          scannedData: scannedData,
                        ),
                      ),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShowScannedData(
                          scannedData:
                              "QR Code | Barcode does not contain any data.",
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            Text(
              "Scan any QR Code or Barcode",
              style: TextStyle(
                color: lightTextColor,
                fontSize: 20,
              ),
            ),
            OutlinedButton(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 18,
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
