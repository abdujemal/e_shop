import 'package:dartz/dartz.dart';
import 'package:e_shop/base_usecase.dart';
import 'package:e_shop/data/models/address_model.dart';
import 'package:equatable/equatable.dart';

import '../repo/repo.dart';

class EditAddressUsecase extends BaseUseCase<List<Address>, EditAddressParam> {
  Repo repo;
  EditAddressUsecase(this.repo);
  @override
  Future<Either<Exception, List<Address>>> call(EditAddressParam parameters) async {
    final res = await repo.editAddress(parameters.address);
    return res;
  }
}

class EditAddressParam extends Equatable {
  Address address;
  EditAddressParam(this.address);

  @override
  List<Object?> get props => [address];
}
