import 'package:flutter/material.dart';
import 'package:scanner_app/qr_generator.dart';
import 'package:scanner_app/qr_scan.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
        centerTitle: true,
        elevation: 4.0,
        shadowColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const QRCodeScan()));
                    },
                    child: const Text('Scan QR Code')),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const QRCodeGenerator()));
                    },
                    child: const Text('Generate QR Code')),
              ]),
        ),
      ),
    );
  }
}
