import 'package:flutter/material.dart';

void main() {
  runApp(const MyPlace());
}

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [block1(), block2(), block3(), block4()]),
    );
  }
}

Widget block1() {
  var src =
      "https://images.unsplash.com/photo-1758776426509-ce8772f42bbe?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw2MHx8fGVufDB8fHx8fA%3D%3D";
  return Image.network(src);
}

Widget block2() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Oeschinen Lake Campground",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 4),
              Text(
                "Kandersteg, Switzerland",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        const Icon(Icons.star, color: Colors.red),
        const SizedBox(width: 4),
        const Text("4.1"),
      ],
    ),
  );
}

Widget block3() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButtonColumn(Icons.call, "CALL"),
        buildButtonColumn(Icons.near_me, "ROUTE"),
        buildButtonColumn(Icons.share, "SHARE"),
      ],
    ),
  );
}

Column buildButtonColumn(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: Colors.blue),
      const SizedBox(height: 8),
      Text(label, style: const TextStyle(fontSize: 12, color: Colors.blue)),
    ],
  );
}

Widget block4() {
  return const Padding(
    padding: EdgeInsets.all(20.0),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. '
      'Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. '
      'A gondola ride from Kandersteg, followed by a half-hour walk through pastures '
      'and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. '
      'Activities enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true, // cho phép xuống dòng tự động
      style: TextStyle(fontSize: 16, height: 1.4),
    ),
  );
}
