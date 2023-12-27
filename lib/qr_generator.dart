import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator extends StatefulWidget {
  const QRCodeGenerator({Key? key}) : super(key: key);

  @override
  State<QRCodeGenerator> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<QRCodeGenerator> {
  TextEditingController qrController = TextEditingController();

  @override
  void dispose() {
    qrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderAll = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 2.0,
        title: const Text(
          'QR Generator',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (qrController.text.isNotEmpty)
                  Card(
                    elevation: 3.0,
                    shadowColor: Colors.black,
                    child: QrImageView(
                      //try this once yourself

                      // dataModuleStyle: const QrDataModuleStyle(
                      //     dataModuleShape: QrDataModuleShape.circle,
                      //     color: Colors.red),
                      // eyeStyle: const QrEyeStyle(
                      //   eyeShape: QrEyeShape.square,
                      //   color: Color.fromARGB(255, 10, 10, 10),
                      // ),
                      backgroundColor: const Color.fromARGB(255, 242, 240, 240),
                      data: qrController.text,
                      size: 200,
                      version: QrVersions.auto,
                    ),
                  ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: qrController,
                  decoration: InputDecoration(
                    border: borderAll,
                    focusedBorder: borderAll,
                    enabledBorder: borderAll,
                    contentPadding: const EdgeInsets.all(5.0),
                    labelText: 'Generate QR Code',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text(
                    'Generate',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
