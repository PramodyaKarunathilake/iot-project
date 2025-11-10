import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<String> history = [
    "08:00 - Cooked Breakfast (15 mins)",
    "12:30 - Lunch (20 mins)",
    "19:00 - Dinner (25 mins)",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cooking History")),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.history),
            title: Text(history[index]),
          );
        },
      ),
    );
  }
}
