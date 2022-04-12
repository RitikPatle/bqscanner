import 'package:bq_scanner/constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScanFromGalleryScreen extends StatefulWidget {
  const ScanFromGalleryScreen({Key? key, required this.scannedData})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final scannedData;

  @override
  State<ScanFromGalleryScreen> createState() => _ScanFromGalleryScreenState();
}

class _ScanFromGalleryScreenState extends State<ScanFromGalleryScreen> {
  @override
  void initState() {
    // MaterialPageRoute(
    //   builder: (context) => ShowScannedData(scannedData: widget.scannedData),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),
            Text(
              appName,
              style: TextStyle(
                fontFamily: "Comfortaa",
                decoration: TextDecoration.none,
                color: darkTextColor,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Scanning",
              style: TextStyle(
                fontFamily: "Comfortaa",
                decoration: TextDecoration.none,
                color: lightTextColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 15),
            LoadingAnimationWidget.horizontalRotatingDots(
              color: lightTextColor,
              size: 80,
            ),
          ],
        ),
      ),
    );
  }
}
