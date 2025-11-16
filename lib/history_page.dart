import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FF),
      appBar: AppBar(
        title: const Text("History"),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.all(15),
        itemBuilder: (_, i) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.history),
              title: Text("Record #${i + 1}"),
              subtitle: const Text("Worked 15 mins • Medium Flame"),
            ),
          );
        },
      ),
    );
  }
}
