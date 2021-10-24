import 'package:flutter/material.dart';

class Product {
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });

  String? image, title, description;
  int? price, size, id;
  Color? color;
}
