import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/document.dart';
import '../providers/document_provider.dart';
import '../widgets/document_card.dart';
import 'search_screen.dart';
import 'document_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DocumentProvider>(context, listen: false).loadDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scribd Clone'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<DocumentProvider>(
        builder: (context, documentProvider, child) {
          if (documentProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: documentProvider.documents.length,
            itemBuilder: (context, index) {
              final document = documentProvider.documents[index];
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
          );
        },
      ),
    );
  }
}
