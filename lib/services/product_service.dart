

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_project/models/product_model.dart';

class ProductService {

  static Future<List<Product>> getProducts() async {
    String productData = await rootBundle.loadString('assets/json/products.json');
    List<dynamic> productsData = jsonDecode(productData);
    return productsData.map( (json) => Product.fromJson(json)).toList();
  }

}