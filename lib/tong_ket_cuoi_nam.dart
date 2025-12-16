import 'package:flutter/material.dart';
import 'package:flutter_application_1/logout.dart';
import 'package:flutter_application_1/my_product.dart';
import 'package:flutter_application_1/my_home_page.dart';
import 'package:flutter_application_1/my_place.dart';
import 'package:flutter_application_1/my_school.dart';
import 'package:flutter_application_1/my_name.dart';
import 'package:flutter_application_1/change_color_app.dart';
import 'package:flutter_application_1/number_couting_app.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/BMI.dart';
import 'package:flutter_application_1/form.dart';
import 'package:flutter_application_1/newspage.dart';

class TongKetCuoiNam extends StatelessWidget {
  const TongKetCuoiNam({super.key});

  static const String tetImage =
      'https://cdn11.dienmaycholon.vn/filewebdmclnew/public/userupload/files/Image%20FP_2024/anh-dai-dien-tet-17.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ================= APPBAR =================
      appBar: AppBar(
        backgroundColor: const Color(0xFFB71C1C), // đỏ rượu vang
        elevation: 4,
        title: const Text(
          "TỔNG HỢP BÀI FLUTTER",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      // ================= DRAWER =================
      drawer: Drawer(
        child: Stack(
          children: [
            // Ảnh nền
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(tetImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Lớp phủ mờ
            Container(color: Colors.black.withOpacity(0.6)),

            // Menu
            ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  child: Center(
                    child: Text(
                      "DANH SÁCH BÀI",
                      style: TextStyle(
                        color: Color(0xFFFFE082), // vàng kem
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),

                _menuItem(context, "Bài 1", MyHomepage()),
                _menuItem(context, "Bài 2", const MySchool()),
                _menuItem(context, "Bài 3", MyPlace()),
                _menuItem(context, "Bài 4", DangKyScreen()),
                _menuItem(context, "Bài 5", MyLogin()),
                _menuItem(context, "Bài 6", FeedbackForm()),
                _menuItem(context, "Bài 7", BMIScreen()),
                _menuItem(context, "Bài 8", MyName()),
                _menuItem(context, "Bài 9", ColorChangerApp()),
                _menuItem(context, "Bài 10", const NumberCountingApp()),
                _menuItem(context, "Bài 11", MyProduct()),
                _menuItem(context, "Bài 12", const MyNewsPage()),
              ],
            ),
          ],
        ),
      ),

      // ================= BODY =================
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(tetImage),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Overlay nền
          Container(color: Colors.black.withOpacity(0.45)),

          // Nội dung trung tâm
          const Center(
            child: Text(
              "LẬP TRÌNH DI ĐỘNG",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFFF3CD), // vàng nhạt
                fontSize: 34,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.black,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= MENU ITEM =================
  Widget _menuItem(BuildContext context, String title, Widget page) {
    return ListTile(
      leading: const Icon(Icons.star_rounded, color: Color(0xFFFFD54F)),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFF5F5F5),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      hoverColor: Colors.white.withOpacity(0.1),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
    );
  }
}
