import 'package:flutter/material.dart';

class WorkTimePage extends StatefulWidget {
  @override
  _WorkTimePageState createState() => _WorkTimePageState();
}

class _WorkTimePageState extends State<WorkTimePage> {
  bool isCooking = false;
  Stopwatch stopwatch = Stopwatch();
  String elapsed = "00:00:00";

  void toggleCooking() {
    setState(() {
      if (isCooking) {
        stopwatch.stop();
      } else {
        stopwatch.start();
      }
      isCooking = !isCooking;
    });

    Future.doWhile(() async {
      if (stopwatch.isRunning) {
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          elapsed = stopwatch.elapsed.toString().split('.').first;
        });
        return true;
      }
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Work Time Tracker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Elapsed Time: $elapsed", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleCooking,
              child: Text(isCooking ? "Stop Cooking" : "Start Cooking"),
            ),
          ],
        ),
      ),
    );
  }
}
