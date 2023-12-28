import 'package:flutter/material.dart';

class QRScannerProvider with ChangeNotifier {
  String qrMessage = 'Output will Appear Here';
  String qrCode = '';

  void showScanResult(String output) async {
    if (output == '-1') {
      qrMessage = 'QR Image not detected';
    } else {
      qrMessage = output;
    }

    notifyListeners();
  }

  void clearContent() {
    qrMessage = '';
    notifyListeners();
  }

  void generateQRCode(String data) {
    qrCode = data;
    notifyListeners();
  }
}
