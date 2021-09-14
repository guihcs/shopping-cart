import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/bloc/cart_bloc.dart';
import 'package:my_project/models/product_model.dart';
import 'package:my_project/widgets/product_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
        actions: [
          BlocBuilder<CartBloc, List<Product>>(
            builder: (context, state) {
              num total = 0;

              if(state.isNotEmpty) {
                total = BlocProvider.of<CartBloc>(context).getAll().map((e) => e.price).reduce((value, element) => value + element);

              }

              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Center(
                    child: Text(
                  'Total: \$${total.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24),
                )),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, List<Product>>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ...state.map((product) => ProductTile(
                      product: product,
                      onTap: () {
                        BlocProvider.of<CartBloc>(context).removeProduct(product);
                      },
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
