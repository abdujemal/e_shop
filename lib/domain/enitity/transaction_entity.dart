import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String id, name, date;
  TransactionEntity({required this.date, required this.id, required this.name});
  
  @override
  List<Object?> get props => [id, name, date];
}
