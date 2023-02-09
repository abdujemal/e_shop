import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/domain/enitity/user_entity.dart';

class UserModel extends UserEntity {
  final String name;
  final String email;
  final String location;
  final String zipCode;
  final String phoneNumber;
  final String img;
  final String id;
  UserModel(
      {required this.name,
      required this.email,
      required this.location,
      required this.zipCode,
      required this.phoneNumber,
      required this.id,
      required this.img})
      : super(
            name: name,
            email: email,
            location: location,
            zipCode: zipCode,
            phoneNumber: phoneNumber,
            img: img,
            id: id);

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
        name: snapshot['name'],
        email: snapshot['email'],
        location: snapshot['location'],
        zipCode: snapshot['zipCode'],
        phoneNumber: snapshot['phoneNumber'],
        id: snapshot['id'],
        img: snapshot['img']);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'location': location,
        'zipCode': zipCode,
        'phoneNumber': phoneNumber,
        'id': id,
        'img': img
      };
}
