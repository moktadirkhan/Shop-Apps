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
  String? color;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
        title: json["title"] == null ? null : json["title"],
        price: json["price"] == null ? null : json["price"],
        size: json["size"] == null ? null : json["size"],
        description: json["description"] == null ? null : json["description"],
        color: json["color"] == null ? null : json["color"],
      );
  Map<String, dynamic> toJson() => {
        'id': id == null ? null : id,
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "price": price == null ? null : price,
        "size": size == null ? null : size,
        "description": description == null ? null : description,
        "color": color == null ? null : color,
      };
}
