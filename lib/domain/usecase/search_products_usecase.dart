import 'package:dartz/dartz.dart';
import 'package:e_shop/base_usecase.dart';
import 'package:e_shop/data/models/product_model.dart';
import 'package:e_shop/domain/repo/repo.dart';
import 'package:equatable/equatable.dart';

class SearchProductsUsecase
    extends BaseUseCase<List<Product>, SearchProductParams> {
  Repo repo;
  SearchProductsUsecase(this.repo);
  @override
  Future<Either<Exception, List<Product>>> call(
      SearchProductParams parameters) async {
    return await repo.searchProducts(parameters.query);
  }
}

class SearchProductParams extends Equatable {
  String query;
  SearchProductParams(this.query);
  @override
  List<Object?> get props => [query];
}
