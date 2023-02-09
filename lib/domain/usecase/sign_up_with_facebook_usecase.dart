// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_shop/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

import '../../base_usecase.dart';
import '../repo/repo.dart';

class SignUpWithFacebookUsecase
    extends BaseUseCase<UserModel, SignUpFacebookParameter> {
  Repo repo;
  SignUpWithFacebookUsecase(this.repo);
  @override
  Future<Either<Exception, UserModel>> call(
      SignUpFacebookParameter parameters) async {
    return await repo.signUpWithFacebook(
        name:parameters.name, phone:parameters.phone, location:parameters. location, zipCode:parameters.zipCode);
  }
}

class SignUpFacebookParameter extends Equatable {
  String? name, phone, location, zipCode;

  SignUpFacebookParameter(
      {this.name, this.phone, this.location, this.zipCode});

  @override
  List<Object?> get props => [name, phone, location, zipCode];
}
