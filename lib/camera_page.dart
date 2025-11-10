import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live Camera View")),
      body: Center(
        child: Container(
          height: 250,
          width: 350,
          color: Colors.black12,
          child: Icon(Icons.camera_alt, size: 100, color: Colors.grey),
        ),
      ),
    );
  }
}
