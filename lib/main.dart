import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/bloc/cart_bloc.dart';
import 'package:my_project/pages/cart_page.dart';
import 'package:my_project/pages/product_page.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartBloc(),)
      ],
      child: MaterialApp(
        initialRoute: 'products',
        routes: {
          'products': (context) => ProductPage(),
          'cart': (context) => CartPage(),
        },
      )));
}
