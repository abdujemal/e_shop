import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/domain/enitity/order_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../injection.dart';

class MyOrder extends OrderEntity {
  final String? id;
  final String date;
  final String price;
  final String status;
  final String uid;
  final String payment;
  final String stNumber;
  final String city;
  final List<dynamic> products;
  MyOrder(
      {this.id,
      required this.city,
      required this.stNumber,
      required this.payment,
      required this.price,
      required this.status,
      required this.date,
      required this.uid,
      required this.products})
      : super(
            uid: uid,
            id: id,
            stNumber: stNumber,
            city: city,
            price: price,
            status: status,
            date: date,
            products: products,
            payment: payment);

  factory MyOrder.fromFirebase(DocumentSnapshot snap) {
    final snapshot = snap.data() as Map<String, dynamic>;
    return MyOrder(
        stNumber: snapshot['stNumber'],
        city: snapshot['city'],
        payment: snapshot['payment'],
        uid: snapshot['uid'],
        products: snapshot['products'],
        id: snap.id,
        price: snapshot["price"],
        status: snapshot['status'],
        date: snapshot['date']);
  }

  Map<String, dynamic> toFirebaseMap() {
    return {
      'city': city,
      'stNumber': stNumber,
      'uid': di<FirebaseAuth>().currentUser!.uid,
      'price': price,
      'status': status,
      'date': date,
      'products': products,
      'payment': payment
    };
  }
}
