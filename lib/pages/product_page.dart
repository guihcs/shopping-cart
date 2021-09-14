import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/bloc/cart_bloc.dart';
import 'package:my_project/models/product_model.dart';
import 'package:my_project/services/product_service.dart';
import 'package:my_project/widgets/product_tile.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('cart');
        },
        child: Icon(Icons.shopping_cart_outlined),
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: Text('Product Page'),
    );
  }

  _body() {
    return FutureBuilder<List<Product>>(
      future: ProductService.getProducts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

        return Column(
          children: [
            ...snapshot.data!.map((product) {
              return ProductTile(
                  product: product,
                onTap: (){
                  BlocProvider.of<CartBloc>(context).addProduct(product);
                },
              );
            })
          ],
        );
      },
    );
  }

}
