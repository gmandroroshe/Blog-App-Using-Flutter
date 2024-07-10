import 'package:flutter/material.dart';
import 'settings_page.dart'; // Import the settings page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.deepPurpleAccent,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontSize: 16.0),
          bodyMedium: TextStyle(color: Colors.black54, fontSize: 14.0),
          titleLarge: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: HomePage(), // Use a separate widget for home page content
      routes: {
        '/category1': (context) =>
            Category1Page(), // Define route for Category1Page
        '/settings': (context) =>
            SettingsPage(), // Define route for SettingsPage
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Tech Blog',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
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
                    child: LongBox(text: 'Long Box Content ${index + 1}'),
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
          SizedBox(height: 8.0),
          Text(category, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget buildCategoryCircle(String text) {
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class LongBox extends StatelessWidget {
  final String text;

  LongBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
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
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Blog App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'This is Category 1 content.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: LongBox(text: 'Long Box Content ${index + 1}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
