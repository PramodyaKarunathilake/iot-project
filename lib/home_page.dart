import 'package:flutter/material.dart';
import 'work_time_page.dart';
import 'set_timer_page.dart';
import 'flame_control_page.dart';
import 'history_page.dart';
import 'camera_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {
      "title": "Work Time",
      "icon": Icons.timer,
      "color1": Colors.orange,
      "color2": Colors.pink,
      "page": WorkTimePage()
    },
    {
      "title": "Set Timer",
      "icon": Icons.access_time,
      "color1": Colors.indigo,
      "color2": Colors.cyan,
      "page": SetTimerPage()
    },
    {
      "title": "Flame Control",
      "icon": Icons.local_fire_department,
      "color1": Colors.red,
      "color2": Colors.amber,
      "page": FlameControlPage()
    },
    {
      "title": "History",
      "icon": Icons.history,
      "color1": Colors.teal,
      "color2": Colors.greenAccent,
      "page": HistoryPage()
    },
    {
      "title": "Camera",
      "icon": Icons.videocam,
      "color1": Colors.deepPurple,
      "color2": Colors.blueAccent,
      "page": CameraPage()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Cooker Dashboard"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F7FA), Color(0xFFF3E5F5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
          itemCount: features.length,
          itemBuilder: (context, i) {
            final feature = features[i];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => feature["page"] as Widget),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [feature["color1"] as Color, feature["color2"] as Color],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(feature["icon"] as IconData, color: Colors.white, size: 50),
                    const SizedBox(height: 12),
                    Text(
                      feature["title"] as String,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
