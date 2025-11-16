import 'package:flutter/material.dart';
import '../widgets/feature_card.dart';
import 'work_time_page.dart';
import 'set_timer_page.dart';
import 'history_page.dart';
import 'flame_control_page.dart';
import 'camera_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {'title': 'Work Time', 'icon': Icons.timer, 'page': WorkTimePage()},
    {'title': 'Set Timer', 'icon': Icons.access_time_filled, 'page': TimerPage()},
    {'title': 'History', 'icon': Icons.history, 'page': HistoryPage()},
    {'title': 'Flame Control', 'icon': Icons.local_fire_department, 'page': FlameControlPage()},
    {'title': 'Camera View', 'icon': Icons.videocam, 'page': CameraPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6F9),
      appBar: AppBar(
        title: const Text("Gas Cooker Controller"),
        centerTitle: true,
        backgroundColor: Colors.teal.shade300,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: features.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 12, 
            mainAxisSpacing: 12
          ),
          itemBuilder: (context, index) {
            var feature = features[index];
            return FeatureCard(
              title: feature['title'],
              icon: feature['icon'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => feature['page']),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
