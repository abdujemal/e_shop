import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/data/models/color_model.dart';
import 'package:flutter/material.dart';

import '../../domain/enitity/product_entity.dart';

class Product extends ProductEntity{
  final String image, title, description;
  final int price;
  Color? bgColor;
  bool isLiked;
  final List<dynamic> colors;

  Product({
    this.isLiked = false,
    required this.description,
    required this.colors,
    required this.image,
    required this.title,
    required this.price,
    this.bgColor ,
  }): super(
    isLiked: isLiked,
    description: description,
    colors: colors,
    image: image,
    title: title,
    price: price,
    bgColor: bgColor
  );

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Product(
      description: snapshot ['description'], 
      colors: snapshot['colors'] , 
      image: snapshot['image'], 
      title: snapshot['title'], 
      price: snapshot['price'],
      bgColor: snapshot['bgColor'] != null ? Color(snapshot['bgColor']) : const Color(0xFFEFEFF2)
      );
  }

  Map<String, dynamic> toJson() => {
       'description': description,
       'colors': colors,
       'image': image,
       'title': title,
       'price': price,
       'bgColor': bgColor?.value
      };
  
}

List<Product> demo_product = [
  Product(
      image: "assets/images/product_0.png",
      title: "Long Sleeve Shirts",
      description:
          "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.",
      price: 165,
      bgColor: const Color(0xFFFEFBF9),
      colors: [0xFFBEE8EA,
        0xFF141B4A
      ]),
  Product(
      image: "assets/images/product_1.png",
      title: "Casual Henley Shirts",
      description:
          "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.",
      price: 99,
      colors: [
        0xFFBEE8EA,
        0xFF141B4A
      ]),
  Product(
      image: "assets/images/product_2.png",
      title: "Curved Hem Shirts",
      description:
          "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.",
      price: 180,
      bgColor: const Color(0xFFF8FEFB),
      colors: [
        0xFFBEE8EA,
        0xFF141B4A
      ]),
  Product(
      image: "assets/images/product_3.png",
      title: "Casual Nolin",
      description:
          "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.",
      price: 149,
      bgColor: const Color(0xFFEEEEED),
      colors: [
        0xFFBEE8EA,
        0xFF141B4A
      ]),
];
