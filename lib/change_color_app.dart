import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ColorChangerApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ColorChangerApp extends StatefulWidget {
  const ColorChangerApp({super.key});

  @override
  State<ColorChangerApp> createState() => _ColorChangerAppState();
}

class _ColorChangerAppState extends State<ColorChangerApp> {
  late Color currentColor;
  final List<Color> colors = [
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.red,
  ];

  final Map<Color, String> colorNames = {
    Colors.purple: "Tím",
    Colors.orange: "Cam",
    Colors.blue: "Xanh dương",
    Colors.green: "Xanh lá",
    Colors.pink: "Hồng",
    Colors.red: "Đỏ",
  };

  @override
  void initState() {
    super.initState();
    currentColor = Colors.purple;
  }

  void changeColor() {
    final random = Random();
    setState(() {
      currentColor = colors[random.nextInt(colors.length)];
    });
  }

  void resetColor() {
    setState(() {
      currentColor = Colors.purple;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng Đổi màu nền"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: currentColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Màu hiện tại:",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              colorNames[currentColor] ?? "Không xác định",
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: changeColor,
                  icon: const Icon(Icons.color_lens),
                  label: const Text("Đổi màu"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.teal,
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: resetColor,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
