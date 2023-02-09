import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String? id;
  final String date;
  final String price;
  final String status;
  final String uid;
  final String payment;
  final String stNumber;
  final String city;

  final List<dynamic> products;
  OrderEntity(
      {this.id,
      required this.city,
      required this.stNumber,
      required this.payment,
      required this.price,
      required this.products,
      required this.status,
      required this.date,
      required this.uid});

  @override
  List<Object?> get props => [id, city, stNumber, date, price, status, products, uid, payment];
}
