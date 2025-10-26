import 'package:flutter/material.dart';
import '../models/document.dart';
import '../providers/document_provider.dart';
import '../widgets/document_card.dart';
import 'document_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Document> _filteredDocuments = [];

  @override
  void initState() {
    super.initState();
    _filteredDocuments = Provider.of<DocumentProvider>(context, listen: false).documents;
  }

  void _filterDocuments(String query) {
    final documentProvider = Provider.of<DocumentProvider>(context, listen: false);
    setState(() {
      _filteredDocuments = documentProvider.documents
          .where((doc) => doc.title.toLowerCase().contains(query.toLowerCase()) ||
                          doc.author.toLowerCase().contains(query.toLowerCase()) ||
                          doc.categories.any((cat) => cat.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Rechercher des documents...',
            border: InputBorder.none,
          ),
          onChanged: _filterDocuments,
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredDocuments.length,
        itemBuilder: (context, index) {
          final document = _filteredDocuments[index];
          return DocumentCard(
            document: document,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentDetailScreen(document: document),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
