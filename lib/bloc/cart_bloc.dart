

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/models/product_model.dart';

class CartBloc extends Cubit<List<Product>> {
  CartBloc() : super([]);

  addProduct(Product product) {
    state.add(product);
    emit(List.from(state));
  }

  removeProduct(Product product){
    state.remove(product);
    emit(List.from(state));
  }

  List<Product> getAll(){
    return state;
  }


}