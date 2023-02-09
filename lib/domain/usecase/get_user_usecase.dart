import 'package:dartz/dartz.dart';

import '../../base_usecase.dart';
import '../../data/models/user_model.dart';
import '../repo/repo.dart';

class GetUserUsecase extends BaseUseCase {
  Repo repo;
  GetUserUsecase(this.repo);
  @override
  Future<Either<Exception, UserModel>> call(parameters) async {
    return await repo.getUser();
  }
}
