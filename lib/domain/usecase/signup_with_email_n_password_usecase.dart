// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../base_usecase.dart';
import '../../data/models/user_model.dart';
import '../repo/repo.dart';

class SignUpWithEmailnPasswordUsecase
    extends BaseUseCase<UserModel, SignUpWEmailPasswordParameters> {
  Repo repo;
  SignUpWithEmailnPasswordUsecase(this.repo);
  
  @override
  Future<Either<Exception, UserModel>> call(parameters) async {
    return await repo.signUpWithEmailnPassword(
        parameters.email,
        parameters.password,
        parameters.name,
        parameters.phone,
        parameters.location,
        parameters.zipCode,
        parameters.image);
  }
}

class SignUpWEmailPasswordParameters extends Equatable {
  String email;
  String password;
  String name;
  String phone;
  String location;
  String zipCode;
  File image;
  SignUpWEmailPasswordParameters({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.location,
    required this.zipCode,
    required this.image,
  });

  @override
  List<Object?> get props =>
      [email, password, name, phone, location, zipCode, image];
}
