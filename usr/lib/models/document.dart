class Document {
  final String id;
  final String title;
  final String author;
  final String description;
  final String thumbnailUrl;
  final String contentUrl; // URL to PDF or text
  final List<String> categories;
  final int pages;
  final DateTime publishedDate;

  Document({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.thumbnailUrl,
    required this.contentUrl,
    required this.categories,
    required this.pages,
    required this.publishedDate,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      description: json['description'],
      thumbnailUrl: json['thumbnailUrl'],
      contentUrl: json['contentUrl'],
      categories: List<String>.from(json['categories']),
      pages: json['pages'],
      publishedDate: DateTime.parse(json['publishedDate']),
    );
  }
}
