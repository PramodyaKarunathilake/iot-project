import 'package:flutter/material.dart';
import 'set_timer_page.dart';
import 'history_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String flameLevel = "Medium";
  int totalWorkingSeconds = 0;
  bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FF),
      appBar: AppBar(
        title: const Text(
          "Gas Cooker Controller",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// 🔥 Flame Control Card
            _buildCard(
              icon: Icons.local_fire_department,
              title: "Flame Control",
              subtitle: "Current flame: $flameLevel",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _flameButton("Low"),
                  _flameButton("Medium"),
                  _flameButton("High"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ⏱ Timer Card
            _buildCard(
              icon: Icons.timer,
              title: "Cooker Timer",
              subtitle: "Set auto turn-off time",
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE8D9FF),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TimerPage()),
                  );
                },
                child: const Text("Set Timer", style: TextStyle(color: Colors.black)),
              ),
            ),

            const SizedBox(height: 20),

            /// 🕒 Working Time Counter
            _buildCard(
              icon: Icons.timelapse,
              title: "Working Time",
              subtitle: "Total running time: $totalWorkingSeconds sec",
              child: Switch(
                value: isRunning,
                onChanged: (value) {
                  setState(() {
                    isRunning = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            /// 📷 Camera View Card
            _buildCard(
              icon: Icons.camera_alt,
              title: "Live Camera",
              subtitle: "View real-time cooking area",
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDEBFF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(Icons.videocam, size: 40, color: Colors.black54),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// 📚 History Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD9E6FF),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HistoryPage()),
                );
              },
              icon: const Icon(Icons.history, color: Colors.black),
              label: const Text(
                "View History",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Card widget
  Widget _buildCard({required IconData icon, required String title, required String subtitle, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.deepPurple),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }

  /// Flame Buttons
  Widget _flameButton(String level) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: flameLevel == level ? Colors.deepPurple : const Color(0xFFE8D9FF),
      ),
      onPressed: () {
        setState(() {
          flameLevel = level;
        });
      },
      child: Text(level, style: const TextStyle(color: Colors.white)),
    );
  }
}
