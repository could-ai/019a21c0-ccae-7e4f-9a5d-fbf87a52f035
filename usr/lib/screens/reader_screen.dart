import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../models/document.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ReaderScreen extends StatefulWidget {
  final Document document;

  ReaderScreen({required this.document});

  @override
  _ReaderScreenState createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  String? localFilePath;

  @override
  void initState() {
    super.initState();
    _downloadAndSavePdf();
  }

  Future<void> _downloadAndSavePdf() async {
    final response = await http.get(Uri.parse(widget.document.contentUrl));
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${widget.document.id}.pdf');
    await file.writeAsBytes(response.bodyBytes);
    setState(() {
      localFilePath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.document.title),
      ),
      body: localFilePath == null
          ? Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: localFilePath,
            ),
    );
  }
}
