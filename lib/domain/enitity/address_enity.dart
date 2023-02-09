import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String name, stNumber, city;
  final String? id;
  AddressEntity({
    required this.city,
    required this.name,
    required this.stNumber,
    required this.id});

  @override
  List<Object?> get props => [name, stNumber, city, id];
}
