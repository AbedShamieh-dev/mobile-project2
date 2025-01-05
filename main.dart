import 'package:flutter/material.dart';
import 'home.dart'; 
import 'news.dart'; 
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
