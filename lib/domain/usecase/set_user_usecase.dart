// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_shop/base_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';
import '../repo/repo.dart';

class SetUserUseCase extends BaseUseCase<UserModel, SetUserParameter> {
  Repo repo;
  SetUserUseCase({
    required this.repo,
  });
  @override
  Future<Either<Exception, UserModel>> call(SetUserParameter parameter) async {
    return await repo.setUser(parameter.email, parameter.name, parameter.phone,
        parameter.location, parameter.zipCode);
  }
}

class SetUserParameter extends Equatable {
  String email;
  String phone;
  String location;
  String name;
  String zipCode;
  SetUserParameter({
    required this.email,
    required this.phone,
    required this.location,
    required this.name,
    required this.zipCode,
  });

  @override
  List<Object?> get props => [email, phone, location, name, zipCode];
}
