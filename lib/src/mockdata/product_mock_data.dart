import 'package:flutter/material.dart';
import 'package:shop_app/src/models/product.dart';

class ProductMockData {
  static List<Product> getDummyProduct() {
    Product product1 = Product(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: "Something about the product",
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE),
    );
    Product product2 = Product(
        id: 2,
        title: "Belt Bag",
        price: 234,
        size: 8,
        description: "Something about the product",
        image: "assets/images/bag_2.png",
        color: Color(0xFFD3A984));
    Product product3 = Product(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: "Something about the product",
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493),
    );
    Product product4 = Product(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: "Something about the product",
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398),
    );

    return [
      product1,
      product2,
      product3,
      product4,
    ];
  }

  static List<Product> getWomensDummyProducts() {
    Product product1 = Product(
      id: 1,
      title: "Women 1",
      price: 234,
      size: 12,
      description: "Something about the product",
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE),
    );
    Product product2 = Product(
        id: 2,
        title: "Women 2",
        price: 234,
        size: 8,
        description: "Something about the product",
        image: "assets/images/bag_2.png",
        color: Color(0xFFD3A984));
    Product product3 = Product(
      id: 3,
      title: "Women 3",
      price: 234,
      size: 10,
      description: "Something about the product",
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493),
    );
    Product product4 = Product(
      id: 4,
      title: "Women 4",
      price: 234,
      size: 11,
      description: "Something about the product",
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398),
    );

    return [
      product1,
      product2,
      product3,
      product4,
    ];
  }
}
