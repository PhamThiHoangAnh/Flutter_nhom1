import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/product.dart';

class Api {
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    var url = 'https://fakestoreapi.com/products';
    var response = await dio.request(url);
    List<Product> ls = [];
    if (response.statusCode == 200) {
      // print(response.data);
      List data = response.data;
      ls = data.map((json) => Product.fromJson(json)).toList();
    } else {
      print('Lỗi cái gì đó');
    }
    return ls;
  }
}

var testApi = Api();
