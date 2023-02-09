import 'package:e_shop/data/data_source/data_source.dart';
import 'package:e_shop/data/models/user_model.dart';
import 'package:e_shop/data/models/product_model.dart';
import 'package:e_shop/data/models/address_model.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';

import 'package:e_shop/domain/repo/repo.dart';

import '../models/order_model.dart';

class RepoImpl extends Repo {
  DataSource dataSource;
  RepoImpl(this.dataSource);
  @override
  Future<Either<Exception, void>> addAddress(Address address) async {
    try {
      final res = await dataSource.addAddress(address);
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> forgetPassword(String email) async {
    try {
      final res = await dataSource.forgetPassword(email);
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, List<Address>>> getAddresses() async {
    try {
      final res = await dataSource.getAddresses();
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, List<MyOrder>>> getOrders() async {
    try {
      final res = await dataSource.getOrders();
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, List<Product>>> getProducts() async {
    try {
      final res = await dataSource.getProducts();
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, List<Product>>> getProductsOfOrders(
      MyOrder order) async {
    try {
      final res = await dataSource.getProductsOfOrders(order);
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, UserModel>> getUser() async {
    try {
      final res = await dataSource.getUser();
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, void>> placeOrder(String payment, Address address) async {
    try {
      final res = await dataSource.placeOrder(payment, address);
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, List<Product>>> searchProducts(String query) async {
    try {
      final res = await dataSource.searchProducts(query);
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, UserModel>> setUser(String email, String name,
      String phone, String location, String zipCode) async {
    try {
      final res =
          await dataSource.setUser(email, name, phone, location, zipCode);
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, UserModel>> signInWithEmailnPassword(
      String email, String password) async {
    try {
      final res = await dataSource.signInWithEmailnPassword(email, password);
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> signOut() async {
    try {
      final res = await dataSource.signOut();
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, UserModel>> signUpWithEmailnPassword(
      String email,
      String password,
      String name,
      String phone,
      String location,
      String zipCode,
      File image) async {
    try {
      final res = await dataSource.signUpWithEmailnPassword(
          email, password, name, phone, location, zipCode, image);
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, UserModel>> signUpWithFacebook(
      {String? name, String? phone, String? location, String? zipCode}) async {
    try {
      final res = await dataSource.signUpWithFacebook(
          name: name, phone: phone, location: location, zipCode: zipCode);
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, UserModel>> signUpWithGoogle(
      {String? name, String? phone, String? location, String? zipCode}) async {
    try {
      final res = await dataSource.signUpWithGoogle(
          name: name, phone: phone, location: location, zipCode: zipCode);
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, List<Address>>> editAddress(Address address) async {
    try {
      final res = await dataSource.editAddress(address);

      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, void>> deleteAddress(
      Address address) async {
    try {
      final res = await dataSource.deleteAddress(address);

      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }
  
 
}
