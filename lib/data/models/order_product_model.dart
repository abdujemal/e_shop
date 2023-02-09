// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class OrderProductModel extends Equatable {
  String img;
  String name;
  int color;
  String price;
  int quantity;
  OrderProductModel({
    required this.img,
    required this.name,
    required this.color,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromString(String data) {
    List<String> productData = data.split(",");

    return OrderProductModel(
        img: productData[0],
        name: productData[1],
        color: int.parse(productData[2]),
        price: productData[3],
        quantity: int.parse(productData[4]));
  }

  @override
  List<Object?> get props => [img, name, color, price, quantity];
}
