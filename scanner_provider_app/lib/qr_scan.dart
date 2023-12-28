// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:scanner_app/provider.dart';

class QRCodeScan extends StatefulWidget {
  const QRCodeScan({Key? key}) : super(key: key);

  @override
  State<QRCodeScan> createState() => _QRCodeScanState();
}

class _QRCodeScanState extends State<QRCodeScan> {
  Future<void> scanQR() async {
    final user = context.read<QRScannerProvider>();

    try {
      final qrResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      // if (qrResult == '-1') {
      //   // QR code detection failed

      user.showScanResult(qrResult);
      // setState(() {
      //   qrMessage = 'QR code detection failed';
      // });
      // } else {
      //   setState(() {
      //     qrMessage = qrResult;
      //   });
      // }
    } catch (error) {
      'Error: ${error.toString()}';
    }
  }

  @override
  void didChangeDependencies() {
    // Clear the content when the dependencies change (e.g., when navigating back)
    context.read<QRScannerProvider>().clearContent();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner Output')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<QRScannerProvider>(
            builder: (context, userProvider, _) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    userProvider.qrMessage,
                    maxLines: 4,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: scanQR,
                        child: const Text('Scan QR'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: userProvider.qrMessage),
                          );
                        },
                        child: const Text('Copy Result'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
