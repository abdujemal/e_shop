import 'package:e_shop/base_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/user_model.dart';
import '../repo/repo.dart';

class SignUpWithGoogleUsecase extends BaseUseCase<UserModel, SignUpGoogleParameter>{
  Repo repo;
  SignUpWithGoogleUsecase(this.repo);
  @override
  Future<Either<Exception, UserModel>> call(parameters) async {
    return await repo.signUpWithGoogle(
      name:parameters.name,
      phone:parameters.phone,
      location:parameters.location,
      zipCode:parameters.zipCode
    );
  }
}

class SignUpGoogleParameter extends Equatable {
  String? name, phone, location, zipCode;

  SignUpGoogleParameter({
    this.location,
    this.name,
    this.phone,
    this.zipCode,
  });
  
  
  
  @override
  List<Object?> get props => [
    location,
    name,
    phone,
    zipCode
  ];
}
