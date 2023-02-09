import 'package:dartz/dartz.dart';
import 'package:e_shop/base_usecase.dart';
import 'package:e_shop/data/models/product_model.dart';
import 'package:e_shop/domain/repo/repo.dart';

class GetProductUsecase extends BaseUseCase<List<Product>, NoParameters> {
  Repo repo;
  GetProductUsecase(this.repo);
  @override
  Future<Either<Exception, List<Product>>> call(NoParameters parameters) async {
    return await repo.getProducts();
  }
}
