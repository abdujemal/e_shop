import 'package:dartz/dartz.dart';
import 'package:e_shop/base_usecase.dart';
import 'package:e_shop/data/models/address_model.dart';
import 'package:e_shop/domain/repo/repo.dart';

class GetAddressesUsecase extends BaseUseCase<List<Address>, NoParameters> {
  Repo repo;
  GetAddressesUsecase(this.repo);
  @override
  Future<Either<Exception, List<Address>>> call(parameters) async {
    return await repo.getAddresses();
  }
}
