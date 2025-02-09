import 'package:flutter/material.dart';

class StatelessWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget Page'),
      ),
      body: Center(
        child: Text(
          'Ini adalah Stateless Widget',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}