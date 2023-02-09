import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../base_usecase.dart';
import '../repo/repo.dart';

class ForgetPasswordUsecase extends BaseUseCase {
  Repo repo;
  ForgetPasswordUsecase(this.repo);
  @override
  Future<Either<Exception, bool>> call(parameters) async {
    return await repo.forgetPassword(parameters.email);
  }
}

class ForgetPasswordParameter extends Equatable {
  String email;
  ForgetPasswordParameter({required this.email});
  @override
  List<Object?> get props => [email];
}
