import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name, email, location, zipCode, phoneNumber, img, id;
  
  UserEntity({
    required this.name,
    required this.email,
    required this.location,
    required this.zipCode,
    required this.phoneNumber,
    required this.id,
    required this.img
    });
    
    @override
    List<Object?> get props => [name, email, location, zipCode, phoneNumber, id, img];
  
}
