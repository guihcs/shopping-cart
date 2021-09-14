

class Product {

  late String name;
  late String description;
  late num price;
  late String imageName;

  Product.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = json['description'];
    price = json['price'];
    imageName = json['imageName'];
  }

}