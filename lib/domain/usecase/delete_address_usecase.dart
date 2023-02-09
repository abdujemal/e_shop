import 'package:dartz/dartz.dart';
import 'package:e_shop/domain/repo/repo.dart';
import 'package:equatable/equatable.dart';

import '../../base_usecase.dart';
import '../../data/models/address_model.dart';

class DeleteAddressUsecase extends BaseUseCase<void, DeleteAddressParam> {
  Repo repo;
  DeleteAddressUsecase(this.repo);
  @override
  Future<Either<Exception, void>> call(DeleteAddressParam parameters) async {
    final res = await repo.deleteAddress(parameters.address);
    return res;
  }
}

class DeleteAddressParam extends Equatable {
  Address address;
  DeleteAddressParam(this.address);

  @override
  List<Object?> get props => [address];
}
