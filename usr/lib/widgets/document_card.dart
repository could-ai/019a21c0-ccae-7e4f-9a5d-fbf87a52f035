import 'package:flutter/material.dart';
import '../models/document.dart';

class DocumentCard extends StatelessWidget {
  final Document document;
  final VoidCallback onTap;

  DocumentCard({required this.document, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Image.network(document.thumbnailUrl, width: 50, height: 70, fit: BoxFit.cover),
        title: Text(document.title, maxLines: 2, overflow: TextOverflow.ellipsis),
        subtitle: Text('${document.author} • ${document.pages} pages'),
        onTap: onTap,
      ),
    );
  }
}
