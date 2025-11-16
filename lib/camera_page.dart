import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera View")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.videocam, size: 100, color: Colors.teal.shade400),
            const SizedBox(height: 20),
            Text(
              "Live camera feed will display here.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal.shade900,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_circle_fill),
              label: const Text("Open Camera"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
