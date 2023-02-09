import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/domain/enitity/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  final String id, name, date;
  TransactionModel({required this.date, required this.id, required this.name})
      : super(date: date, id: id, name: name);

  factory TransactionModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return TransactionModel(
        date: snapshot['date'], id: snapshot['id'], name: snapshot['name']);
  }

  Map<String, dynamic> toJson() => {"id": id, "name": name, "date": date};
}
