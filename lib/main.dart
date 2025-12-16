import 'package:flutter/material.dart';

//import 'package:flutter_application_1/my_product.dart';

//import 'package:flutter_application_1/my_home_page.dart';

//import 'package:flutter_application_1/my_place.dart';

//import 'package:flutter_application_1/my_school.dart';

//import 'package:flutter_application_1/my_name.dart';

//import 'package:flutter_application_1/change_color_app.dart';,

//import 'package:flutter_application_1/number_couting_app.dart';

//import 'package:flutter_application_1/login.dart';

//import 'package:flutter_application_1/logout.dart';

//import 'package:flutter_application_1/BMI.dart';

//import 'package:flutter_application_1/form.dart';
//import 'package:flutter_application_1/newspage.dart';
import 'tong_ket_cuoi_nam.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'My Name App',

      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),

      home: const TongKetCuoiNam(), //
    );
  }
}
