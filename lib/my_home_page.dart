import 'package:flutter/material.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Text(
              "Xin chào mọi người",
              style: TextStyle(color: Colors.blueAccent, fontSize: 30),
            ),
          ),
          Icon(Icons.heart_broken, size: 10, color: Colors.red),
          Text(
            "Lập trình DĐ - nhóm 2",
            style: TextStyle(color: Colors.blue, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
