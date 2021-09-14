



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/bloc/cart_bloc.dart';
import 'package:my_project/models/product_model.dart';

class ProductTile extends StatelessWidget {

  final Product product;
  final void Function()? onTap;

  const ProductTile({Key? key, required this.product, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onTap?.call();
      },
      leading: Container(
          width: 60,
          height: 60,
          child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/' + product.imageName,
                fit: BoxFit.cover,
              ))),
      title: Text(product.name),
      subtitle: Text(product.description),
      trailing: Text('R\$${product.price.toStringAsFixed(2)}'),
    );
  }
}


