import 'package:flutter/material.dart';

class AddNewsPage extends StatefulWidget {
  @override
  _AddNewsPageState createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String _selectedCategory = 'Local';
  final List<String> _categories = ['Local', 'International', 'Both'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add News',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.green),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center
          ,
          children: [
            Text(
              'Enter your news below:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),


            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(12.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),


            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _authorController,
                  decoration: InputDecoration(
                    labelText: 'Author',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(12.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),


            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _sourceController,
                  decoration: InputDecoration(
                    labelText: 'Source',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),


            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Date (mm/dd/yyyy)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ),
            SizedBox(height: 16),


            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _contentController,
                  decoration: InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Category Dropdown
            Text(
              'Select Category:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: DropdownButton<String>(
                  value: _selectedCategory,
                  isExpanded: true,
                  items: _categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCategory = newValue!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Thank You!'),
                      content: Text(
                        'The admin will review your response.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );

              },
              child: Text('Submit News',style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
    );
  }
}
