import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // Use a separate widget for home page content
      routes: {
        '/category1': (context) =>
            Category1Page(), // Define route for Category1Page
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Blog App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              // Add your settings action here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCategoryColumn(context, 'Category 1'),
                buildCategoryColumn(context, 'Category 2'),
                buildCategoryColumn(context, 'Category 3'),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: buildLongBox('Long Box Content ${index + 1}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryColumn(BuildContext context, String category) {
    return GestureDetector(
      onTap: () {
        if (category == 'Category 1') {
          Navigator.pushNamed(
              context, '/category1'); // Navigate to Category1Page
        }
        // Add logic for other categories if needed
      },
      child: Column(
        children: [
          buildCategoryCircle(category),
        ],
      ),
    );
  }

  Widget buildCategoryCircle(String text) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildLongBox(String text) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: const Color.fromARGB(255, 158, 158, 158)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class Category1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category 1 Page'),
      ),
      body: Center(
        child: Text(
          'This is Category 1 content.',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
