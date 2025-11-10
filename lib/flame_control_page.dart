import 'package:flutter/material.dart';

class FlameControlPage extends StatefulWidget {
  @override
  _FlameControlPageState createState() => _FlameControlPageState();
}

class _FlameControlPageState extends State<FlameControlPage> {
  String flame = "Medium";

  Widget buildFlameButton(String label, Color color) {
    return GestureDetector(
      onTap: () => setState(() => flame = label),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: flame == label ? color : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
        ),
        child: Column(
          children: [
            Icon(Icons.local_fire_department,
                size: 60, color: flame == label ? Colors.white : color),
            SizedBox(height: 8),
            Text(label,
                style: TextStyle(
                    color: flame == label ? Colors.white : Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flame Control"), backgroundColor: Colors.deepOrangeAccent),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade100, Colors.yellow.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Adjust Flame Level", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildFlameButton("Low", Colors.blue),
                buildFlameButton("Medium", Colors.orange),
                buildFlameButton("High", Colors.redAccent),
              ],
            ),
            SizedBox(height: 50),
            Text("Current Flame: $flame",
                style: TextStyle(fontSize: 22, color: Colors.deepOrangeAccent, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
