import 'package:e_shop/data/models/color_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductEntity extends Equatable {
  final String image, title, description;
  final int price;
  final Color? bgColor;
  bool isLiked;
  final List<dynamic> colors;

  ProductEntity({
    this.isLiked = false,
    required this.description,
    required this.colors,
    required this.image,
    required this.title,
    required this.price,
    this.bgColor = const Color(0xFFEFEFF2),
  });
  
  @override
  List<Object?> get props => [image, title, description, price, bgColor, isLiked, colors];
}


