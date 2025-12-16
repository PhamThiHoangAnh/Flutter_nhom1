import 'package:flutter/material.dart';

class MyName extends StatelessWidget {
  const MyName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ===== APPBAR CÓ NÚT QUAY VỀ =====
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: myBody(),
    );
  }

  Widget myBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: ListView(
          children: [item1(), item2(), item3(), item4(), item5()],
        ),
      ),
    );
  }
}

// ================= ITEM 1 =================
Widget item1() {
  return SizedBox(
    height: 80,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.extension)),
        ],
      ),
    ),
  );
}

// ================= ITEM 2 =================
Widget item2() {
  return SizedBox(
    height: 130,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Welcome,",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            "Charlie",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    ),
  );
}

// ================= ITEM 3 =================
Widget item3() {
  return SizedBox(
    height: 100,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
  );
}

// ================= ITEM 4 =================
Widget item4() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: const Text(
      "Saved Places",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  );
}

// ================= ITEM 5 =================
Widget item5() {
  return GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    childAspectRatio: 3 / 2,
    children: List.generate(8, (index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset('assets/${(index % 4) + 1}.png', fit: BoxFit.cover),
      );
    }),
  );
}
