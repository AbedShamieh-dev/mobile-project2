import 'package:flutter/material.dart';
import 'home.dart'; // Import Home page where news can be filtered
import 'news.dart'; // Import the News page for adding news
import 'login.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
