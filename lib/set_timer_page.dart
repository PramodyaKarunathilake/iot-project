import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class SetTimerPage extends StatefulWidget {
  @override
  _SetTimerPageState createState() => _SetTimerPageState();
}

class _SetTimerPageState extends State<SetTimerPage> {
  int seconds = 0;
  Timer? timer;

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        t.cancel();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Cooking finished! Gas turned off.")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Set Cooking Timer"), backgroundColor: Colors.purpleAccent),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.purple.shade100, Colors.cyan.shade100]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPaint(
                foregroundPainter: TimerPainter(seconds),
                child: Container(
                  height: 220,
                  width: 220,
                  alignment: Alignment.center,
                  child: Text("$seconds s", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 20),
              Slider(
                value: seconds.toDouble(),
                min: 0,
                max: 600,
                activeColor: Colors.purpleAccent,
                divisions: 60,
                label: "$seconds sec",
                onChanged: (v) => setState(() => seconds = v.toInt()),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: startTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text("Start Timer", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final int seconds;
  TimerPainter(this.seconds);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double progress = (seconds / 600) * 2 * pi;
    canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height), -pi / 2, progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
