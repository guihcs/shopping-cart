import 'package:flutter/material.dart';
import 'package:my_project/pages/home_page.dart';
import 'package:my_project/pages/product_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'home',
    routes: {
      'home': (context) => HomePage(),
      'product': (context) => ProductPage(),
    },
  ));
}
