import 'package:flutter/material.dart';

class FlameControlPage extends StatefulWidget {
  const FlameControlPage({super.key});

  @override
  State<FlameControlPage> createState() => _FlameControlPageState();
}

class _FlameControlPageState extends State<FlameControlPage> {
  String _flameLevel = "Medium";

  @override
  Widget build(BuildContext context) {
    IconData flameIcon = Icons.local_fire_department;
    double iconSize = _flameLevel == "Low"
        ? 60
        : _flameLevel == "Medium"
            ? 85
            : 110;

    Color flameColor = _flameLevel == "Low"
        ? Colors.orange.shade300
        : _flameLevel == "Medium"
            ? Colors.deepOrange
            : Colors.redAccent;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flame Control"),
        backgroundColor: Colors.teal.shade600,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade50, Colors.teal.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(flameIcon, color: flameColor, size: iconSize),
                  const SizedBox(height: 10),
                  Text(
                    "Flame Level",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _flameLevel,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: flameColor,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal.shade50,
                    ),
                    child: ToggleButtons(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal.shade700,
                      selectedColor: Colors.white,
                      fillColor: Colors.teal,
                      isSelected: [
                        _flameLevel == "Low",
                        _flameLevel == "Medium",
                        _flameLevel == "High"
                      ],
                      onPressed: (index) {
                        setState(() {
                          if (index == 0) _flameLevel = "Low";
                          else if (index == 1) _flameLevel = "Medium";
                          else _flameLevel = "High";
                        });
                      },
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 18),
                          child: Text("Low"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 18),
                          child: Text("Medium"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 18),
                          child: Text("High"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 8,
                    width: _flameLevel == "Low"
                        ? 80
                        : _flameLevel == "Medium"
                            ? 130
                            : 200,
                    decoration: BoxDecoration(
                      color: flameColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Adjust flame intensity using the buttons above",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
