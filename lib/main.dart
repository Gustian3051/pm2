import 'package:flutter/material.dart';
import 'package:pm2/stateful_widget_page.dart';
import 'package:pm2/stateless_widget_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutSederhana(),
    );
  }
}

class LayoutSederhana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh Layout Sederhana'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StatelessWidgetPage()),
            ),
            child: Text('Ke Stateless Widget'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StatefulWidgetPage()),
            ),
            child: Text('Ke Stateful Widget'),
          ),
        ],
      ),
    );
  }
}
