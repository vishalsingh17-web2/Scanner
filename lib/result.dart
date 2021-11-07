import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ResultPage extends StatefulWidget {
  final Barcode barcode;
  ResultPage({required this.barcode});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [Text(widget.barcode.rawBytes.toString()),Text(widget.barcode.format.toString()),Text(widget.barcode.code!)],
          ),
        ),
      ),
    );
  }
}
