import 'package:dartz/dartz.dart';
import 'package:e_shop/base_usecase.dart';
import 'package:e_shop/data/models/address_model.dart';
import 'package:e_shop/domain/repo/repo.dart';
import 'package:equatable/equatable.dart';

class AddAddressUsecase extends BaseUseCase<void, AddAddressUsecaseParam> {
  Repo repo;
  AddAddressUsecase(this.repo);
  @override
  Future<Either<Exception, void>> call(parameters) async {
    return await repo.addAddress(parameters.address);
  }
}

class AddAddressUsecaseParam extends Equatable {
  Address address;
  AddAddressUsecaseParam(this.address);
  @override
  List<Object?> get props => [address];
}
