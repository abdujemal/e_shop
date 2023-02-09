import 'package:dartz/dartz.dart';
import 'package:e_shop/base_usecase.dart';
import 'package:e_shop/data/models/order_model.dart';
import 'package:e_shop/data/models/product_model.dart';
import 'package:e_shop/domain/repo/repo.dart';
import 'package:equatable/equatable.dart';

class GetProductOfOrderUsecase
    extends BaseUseCase<List<Product>, GetProductOfOrderParam> {
  Repo repo;
  GetProductOfOrderUsecase(this.repo);
  @override
  Future<Either<Exception, List<Product>>> call(
      GetProductOfOrderParam parameters) async {
    return await repo.getProductsOfOrders(parameters.myOrder);
  }
}

class GetProductOfOrderParam extends Equatable {
  MyOrder myOrder;
  GetProductOfOrderParam(this.myOrder);
  @override
  List<Object?> get props => [myOrder];
}
