import 'package:flutter/material.dart';
import 'home.dart';
import 'addNews.dart';

class NewsPage extends StatelessWidget {
  final News article;

  const NewsPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title,style:  TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('By ${article.author}', style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
              Text('Source: ${article.source} | Date: ${article.date}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 16),
              Text(article.content, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
