import 'package:dartz/dartz.dart';
import 'package:e_shop/base_usecase.dart';
import 'package:e_shop/data/models/order_model.dart';
import 'package:e_shop/domain/repo/repo.dart';

class GetOrderUsecase extends BaseUseCase {
  Repo repo;
  GetOrderUsecase(this.repo);
  @override
  Future<Either<Exception, List<MyOrder>>> call(parameters) async {
    return await repo.getOrders();
  }
}
