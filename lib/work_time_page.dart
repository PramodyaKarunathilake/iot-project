import 'package:flutter/material.dart';
import 'dart:async';

class WorkTimePage extends StatefulWidget {
  const WorkTimePage({super.key});

  @override
  State<WorkTimePage> createState() => _WorkTimePageState();
}

class _WorkTimePageState extends State<WorkTimePage> {
  late Timer _timer;
  int _seconds = 0;
  bool _isRunning = false;

  void _startTimer() {
    if (_isRunning) return;
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    _isRunning = false;
    _timer.cancel();
  }

  String _formatTime(int seconds) {
    int h = seconds ~/ 3600;
    int m = (seconds % 3600) ~/ 60;
    int s = seconds % 60;
    return "${h.toString().padLeft(2, '0')}:"
           "${m.toString().padLeft(2, '0')}:"
           "${s.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Work Time Tracker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.timer, size: 80, color: Colors.teal),
            const SizedBox(height: 20),
            Text(
              _formatTime(_seconds),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _startTimer,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Start"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade300,
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: _stopTimer,
                  icon: const Icon(Icons.stop),
                  label: const Text("Stop"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent.shade200,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
