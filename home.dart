import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'news.dart';
import 'addNews.dart'; // Import the AddNewsPage

const String baseURL = 'abed-mazen-project.atwebpages.com';

class News {
  final int id;
  final String title;
  final String author;
  final String source;
  final String date;
  final String content;
  final String category;

  News(this.id, this.title, this.author, this.source, this.date, this.content, this.category);
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = false;
  List<News> _newsArticles = [];
  String _selectedCategory = 'Both';


  void updateNews(Function(bool) f, {String category = 'Both'}) async {
    try {
      _newsArticles.clear();
      final url = Uri.http(baseURL, '/getNews.php', {'category': category});

      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));

      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final List jsonResponse = jsonDecode(response.body);

        if (jsonResponse.isEmpty) {
          print("No data found");
        } else {
          for (var row in jsonResponse) {
            News article = News(
              row['db_id'],
              row['db_title'],
              row['db_author'],
              row['db_source'],
              row['db_date'],
              row['db_content'],
              row['db_category'],
            );
            _newsArticles.add(article);
          }
          f(true);
        }
      } else {
        print("Failed to load data, status code: ${response.statusCode}");
        f(false);
      }
    } catch (e) {
      print("Error: $e");
      f(false);
    }
  }


  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
      _loading = false;
    });

    updateNews((success) {
      setState(() {
        _loading = true;
      });
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load news')),
        );
      }
    }, category: category);
  }

  @override
  void initState() {
    super.initState();
    updateNews((success) {
      setState(() {
        _loading = true;
      });
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to load news')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lebanon News', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        elevation: 0.0,
        leading: Icon(Icons.ac_unit, color: Colors.green),
        centerTitle: true,
      ),
      body: _loading
          ? Column(
        children: [
          const SizedBox(height: 10),
          const Text('Select Category', style: TextStyle(fontSize: 20)),
          DropdownButton<String>(
            value: _selectedCategory,
            items: ['Local', 'International', 'Both']
                .map((category) => DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            ))
                .toList(),
            onChanged: (category) {
              if (category != null) {
                _onCategorySelected(category);
              }
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _newsArticles.length,
              itemBuilder: (context, index) {
                var article = _newsArticles[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text(
                      article.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'By ${article.author}',
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                          Text(
                            article.date,
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.red,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsPage(article: article),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      )
          : const Center(child: CircularProgressIndicator()),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewsPage()),
          );
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
