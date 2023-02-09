import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../base_usecase.dart';
import '../../data/models/user_model.dart';
import '../repo/repo.dart';

class SignInWithEmailnPasswordUsecase extends BaseUseCase<UserModel, SignInWithEmailPasswordParameter> {
  Repo repo;
  SignInWithEmailnPasswordUsecase(this.repo);

  @override
  Future<Either<Exception, UserModel>> call(parameters) async {
    return await repo.signInWithEmailnPassword(
        parameters.email, parameters.password);
  }
}

class SignInWithEmailPasswordParameter extends Equatable {
  String email, password;
  SignInWithEmailPasswordParameter(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
