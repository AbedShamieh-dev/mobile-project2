import 'package:flutter/material.dart';
import 'home.dart'; // Import the Home page

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Skip validation and navigate directly to the Home page
  void _login(BuildContext context) {
    // Directly navigate to Home page without validation
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()), // Navigate to Home page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0.0,
        leading: Icon(Icons.ac_unit),
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://media.istockphoto.com/id/1287181716/vector/lebanese-flag-wavy-abstract-background-vector-illustration.jpg?s=612x612&w=0&k=20&c=4pajVYkyUAmstQ6_Oz9msotbCH4W0u9PZJ2_Q0hsV9g='), // URL of the Lebanese flag image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align fields to the top
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 60),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
              const SizedBox(height: 16),


              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
              const SizedBox(height: 32),


              ElevatedButton(
                onPressed: () => _login(context),
                child: const Text('Login', style: TextStyle(fontSize: 18,color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
