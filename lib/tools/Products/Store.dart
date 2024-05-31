import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoodedhaven/tools/Products/Product.dart';

class Store extends ChangeNotifier {
  static List<Product> products = [
    Product(
      title: "Chill and Bench Hoodie",
      price: 40,
      promoprice: 60,
      imagepath: "assets/Products/Chill and bench.jpg",
    ),
    Product(
        title: "Pants",
        price: 40,
        promoprice: 60,
        imagepath: "assets/Products/Pants.jpg"),
    Product(
        title: "Jordan1",
        price: 150,
        promoprice: 300,
        imagepath: "assets/Products/Jordan1.jpg"),
    Product(
        title: "Jordan1",
        price: 150,
        promoprice: 300,
        imagepath: "assets/Products/Jordan1.jpg"),
    Product(
        title: "Jordan1", price: 150, imagepath: "assets/Products/Jordan1.jpg"),
  ];

  static List<Product> promo = [
    ...products.where((element) => element.promoprice != null)
  ];
  static List<Product> Featured = [];

  final List cart = [];
  //addToCart
  void addToCart(Product product) {
    bool isThesame = false;
    int index = 0;
    for (var i = 0; i < cart.length; i++) {
      isThesame = product.equals(cart[i]);
      if (isThesame) {
        index = i;
      }
    }
    if (isThesame)
      cart[index].quantity += product.quantity;
    else
      cart.add(product);

    notifyListeners();
  }

  //removeFromCart
  void removeFromCart(Product product) {
    cart.remove(product);
    notifyListeners();
  }

  //total price
  double totalPrice() {
    double total = 0;
    for (var element in cart) {
      total += double.parse(element.price.toString()) * element.quantity;
    }
    return total;
  }
}
