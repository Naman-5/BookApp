import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Reader extends StatelessWidget {
  String resourceLink;
  Reader({super.key, required this.resourceLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(child: SfPdfViewer.network(resourceLink)),
    );
  }
}
