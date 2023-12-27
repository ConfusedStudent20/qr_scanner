import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCodeScan extends StatefulWidget {
  const QRCodeScan({Key? key}) : super(key: key);

  @override
  State<QRCodeScan> createState() => _QRCodeScanState();
}

class _QRCodeScanState extends State<QRCodeScan> {
  String qrMessage = 'Output will Appear Here';

  Future<void> scanQR() async {
    try {
      final qrResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      if (qrResult == '-1') {
        // QR code detection failed
        setState(() {
          qrMessage = 'QR code detection failed';
        });
      } else {
        setState(() {
          qrMessage = qrResult;
        });
      }
    } catch (error) {
      setState(() {
        qrMessage = 'Error: ${error.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner Output')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              qrMessage,
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
                ElevatedButton(onPressed: scanQR, child: const Text('Scan QR')),
                ElevatedButton(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: qrMessage),
                    );
                  },
                  child: const Text('Copy Result'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
