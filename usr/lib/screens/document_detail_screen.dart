import 'package:flutter/material.dart';
import '../models/document.dart';
import 'reader_screen.dart';

class DocumentDetailScreen extends StatelessWidget {
  final Document document;

  DocumentDetailScreen({required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(document.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(document.thumbnailUrl, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              document.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Par ${document.author}',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 8),
            Text(
              '${document.pages} pages',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(document.description),
            SizedBox(height: 16),
            Wrap(
              children: document.categories
                  .map((category) => Chip(label: Text(category)))
                  .toList(),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReaderScreen(document: document),
                  ),
                );
              },
              child: Text('Lire maintenant'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
