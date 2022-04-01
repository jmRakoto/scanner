import 'package:flutter/material.dart';
import 'package:qr_scanner/presentation/views/pages/scanner/pages/body.dart';
import 'package:qr_scanner/presentation/views/pages/scanner/pages/header.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: const [
          Header(),
          Positioned(
            top: 100,
            child: Body(),
          ),
        ],
      )),
    );
  }
}
