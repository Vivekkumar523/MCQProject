
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class Certificate extends StatefulWidget {
  const Certificate({super.key});

  @override
  State<Certificate> createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  Future<void> loadPdf() async {
    final bytes = await rootBundle.load('assets/images/certificate.pdf');
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/certificate.pdf');
    await file.writeAsBytes(bytes.buffer.asUint8List());
    setState(() {
      localPath = file.path;
    });
  }
  @override
  Widget build(BuildContext context) {
    return localPath != null
        ? PDFView(filePath: localPath!)
        : Center(child: CircularProgressIndicator());
  }
}
