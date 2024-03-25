import 'package:flutter/material.dart';

class Product {
  String? title;
  int? price;
  int? promoprice;
  String? imagepath;
  String size;
  Color color;
  int quantity;
  String? reviews;

  Product(
      {required this.title,
      required this.price,
      this.promoprice,
      this.size = "S",
      this.reviews,
      this.color = Colors.black,
      this.quantity = 1,
      required this.imagepath});
  bool equals(Product p) {
    return this.imagepath == p.imagepath && this.title == p.title && this.size == p.size ? true : false;
  }
}
