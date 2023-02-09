import 'package:flutter/animation.dart';

class Cart {
  final String img, name, description, colors, isLiked, id, category;
  int quantity;
  int price;
  Color bg_rgb;
  int choosenColor;
  Cart(
      {required this.choosenColor,
      required this.bg_rgb,
      required this.img,
      required this.name,
      required this.category,
      required this.colors,
      required this.description,
      required this.id,
      required this.isLiked,
      required this.quantity,
      required this.price});
}
