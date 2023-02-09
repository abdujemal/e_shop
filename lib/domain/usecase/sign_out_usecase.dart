import 'package:dartz/dartz.dart';

import '../../base_usecase.dart';
import '../repo/repo.dart';

class SignOutUsecase extends BaseUseCase {
  Repo repo;
  SignOutUsecase(this.repo);
  @override
  Future<Either<Exception, bool>> call(parameters) async {
    return await repo.signOut();
  }
}
