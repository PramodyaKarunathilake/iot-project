import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'set_timer_page.dart';
import 'history_page.dart';

void main() {
  runApp(const GasCookerApp());
}

class GasCookerApp extends StatelessWidget {
  const GasCookerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gas Cooker Controller",
      theme: ThemeData(
        fontFamily: "Roboto",
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7F5AF0),
        ),
      ),
      home: const DashboardPage(),
    );
  }
}
