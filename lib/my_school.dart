import 'package:flutter/material.dart';

class MySchool extends StatelessWidget {
  const MySchool({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> classes = [
      {
        'title': 'XML và ứng dụng - Nhóm 1',
        'code': '2025-2026.1.TIN4583.001',
        'students': 58,
        'color': Colors.blueGrey.shade700.withOpacity(0.8),
      },
      {
        'title': 'Lập trình ứng dụng cho các thiết bị di động',
        'code': '2025-2026.1.TIN4403.006',
        'students': 55,
        'color': Colors.redAccent.shade100.withOpacity(0.8),
      },
      {
        'title': 'Lập trình ứng dụng cho các thiết bị di động',
        'code': '2025-2026.1.TIN4403.005',
        'students': 52,
        'color': Colors.orangeAccent.shade100.withOpacity(0.8),
      },
      {
        'title': 'Lập trình ứng dụng cho các thiết bị di động',
        'code': '2025-2026.1.TIN4403.004',
        'students': 50,
        'color': Colors.blue.shade400.withOpacity(0.8),
      },
      {
        'title': 'Lập trình ứng dụng cho các thiết bị di động',
        'code': '2025-2026.1.TIN4403.003',
        'students': 58,
        'color': Colors.green.shade300.withOpacity(0.8),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        automaticallyImplyLeading: false, // ẩn nút back
        titleSpacing: 20, // cách lề trái một chút
        title: const Text(
          'Lớp học của tôi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Stack(
        children: [
          // 🖼 Hình nền
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1759800805898-269a6937be84?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw0Mnx8fGVufDB8fHx8fA%3D%3D',
              fit: BoxFit.cover,
            ),
          ),

          // 🌫 Lớp phủ mờ
          Container(color: Colors.black.withOpacity(0.3)),

          // 📋 Danh sách lớp học
          ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: classes.length,
            itemBuilder: (context, index) {
              final lop = classes[index];
              return Card(
                color: lop['color'],
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🌟 Tiêu đề + nút ba chấm
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              lop['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          PopupMenuButton<String>(
                            color: Colors.white,
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            onSelected: (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Bạn chọn: $value')),
                              );
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'Chi tiết',
                                child: Text('Chi tiết lớp học'),
                              ),
                              const PopupMenuItem(
                                value: 'Chỉnh sửa',
                                child: Text('Chỉnh sửa'),
                              ),
                              const PopupMenuItem(
                                value: 'Xóa',
                                child: Text('Xóa'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        lop['code'],
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${lop['students']} học viên',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
