import 'package:flutter/material.dart';
import '../models/document.dart';

class DocumentProvider extends ChangeNotifier {
  List<Document> _documents = [];
  bool _isLoading = false;

  List<Document> get documents => _documents;
  bool get isLoading => _isLoading;

  void loadDocuments() async {
    _isLoading = true;
    notifyListeners();

    // Simuler le chargement de données (remplacer par une vraie API)
    await Future.delayed(Duration(seconds: 2));
    _documents = [
      Document(
        id: '1',
        title: 'Flutter Development Guide',
        author: 'John Doe',
        description: 'A comprehensive guide to Flutter development.',
        thumbnailUrl: 'https://via.placeholder.com/150',
        contentUrl: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf', // Exemple PDF
        categories: ['Technology', 'Programming'],
        pages: 100,
        publishedDate: DateTime.now(),
      ),
      Document(
        id: '2',
        title: 'World History',
        author: 'Jane Smith',
        description: 'An overview of world history from ancient times to present.',
        thumbnailUrl: 'https://via.placeholder.com/150',
        contentUrl: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
        categories: ['History', 'Education'],
        pages: 200,
        publishedDate: DateTime.now(),
      ),
      // Ajouter plus de documents mock
    ];

    _isLoading = false;
    notifyListeners();
  }
}
