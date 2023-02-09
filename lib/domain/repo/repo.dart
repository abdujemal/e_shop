import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_shop/data/models/address_model.dart';
import 'package:e_shop/data/models/order_model.dart';
import 'package:e_shop/data/models/user_model.dart';

import '../../data/models/product_model.dart';
import '../../data/models/transaction_model.dart';

abstract class Repo{
  // Authentication

  Future<Either<Exception, UserModel>> signUpWithEmailnPassword(String email, String password,
      String name, String phone, String location, String zipCode, File image);

  Future<Either<Exception, UserModel>> signUpWithGoogle(
      {String? name, String? phone, String? location, String? zipCode});

  Future<Either<Exception, UserModel>> signUpWithFacebook(
      {String? name, String? phone, String? location, String? zipCode});

  Future<Either<Exception, UserModel>> signInWithEmailnPassword(String email, String password);

  Future<Either<Exception, bool>> forgetPassword(String email);

  Future<Either<Exception, bool>> signOut();

  Future<Either<Exception, UserModel>> getUser();

  Future<Either<Exception, UserModel>> setUser(
      String email, String name, String phone, String location, String zipCode);

  // cloud firestore

  Future<Either<Exception, List<Product>>> getProducts();

  Future<Either<Exception, List<Product>>> searchProducts(String query);

  Future<Either<Exception, List<MyOrder>>> getOrders();

  Future<Either<Exception, void>> placeOrder(String payment, Address address);

  Future<Either<Exception, List<Product>>> getProductsOfOrders(MyOrder order);

  Future<Either<Exception, List<Address>>> getAddresses();

  Future<Either<Exception, void>> addAddress(Address address);

  Future<Either<Exception, List<Address>>> editAddress(Address address);

  Future<Either<Exception, void>> deleteAddress(Address address);


}