// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:e_shop/domain/enitity/address_enity.dart';
import 'package:e_shop/injection.dart';

class Address extends AddressEntity {
  final String name;
  final String stNumber;
  final String city;
  final String? id;

  Address(
      {required this.name,
      required this.stNumber,
      required this.city,
      this.id})
      : super(name: name, stNumber: stNumber, city: city, id: id);

  factory Address.fromFirebase(DocumentSnapshot snap) {
    final snapshot = snap.data() as Map<String, dynamic>;

    return Address(
        name: snapshot['name'],
        stNumber: snapshot['stNumber'],
        city: snapshot['city'],
        id: snap.id.toString());
  }

  Map<String, dynamic> toFirbaseMap() {
    return {
      'name': name,
      'stNumber': stNumber,
      'city': city,
      'uid': di<FirebaseAuth>().currentUser!.uid,
    };
  }

  Address copyWith({
    String? name,
    String? stNumber,
    String? city,
    String? id,
  }) {
    return Address(
      name: name ?? this.name,
      stNumber: stNumber ?? this.stNumber,
      city: city ?? this.city,
      id: id ?? this.id,
    );
  }
}
