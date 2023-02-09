import 'package:dartz/dartz.dart';
import 'package:e_shop/base_usecase.dart';
import 'package:e_shop/data/models/address_model.dart';
import 'package:e_shop/domain/repo/repo.dart';
import 'package:equatable/equatable.dart';

class PlaceOrderUsecase extends BaseUseCase<void, PlaceOrderParam> {
  Repo repo;
  PlaceOrderUsecase(this.repo);
  @override
  Future<Either<Exception, void>> call(parameters) {
    final res = repo.placeOrder(parameters.payment, parameters.address);
    return res;
  }
}

class PlaceOrderParam extends Equatable {
  String payment;
  Address address;
  PlaceOrderParam(this.payment, this.address);

  @override
  List<Object?> get props => [order];
}
