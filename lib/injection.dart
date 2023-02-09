import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:e_shop/View/controller/address_controller.dart';
import 'package:e_shop/View/controller/bindings.dart';
import 'package:e_shop/View/controller/login_signUp_controller.dart';
import 'package:e_shop/View/controller/order_controller.dart';
import 'package:e_shop/data/data_source/data_source.dart';
import 'package:e_shop/data/repo/repo_impl.dart';
import 'package:e_shop/domain/repo/repo.dart';
import 'package:e_shop/domain/usecase/add_address_usecase.dart';
import 'package:e_shop/domain/usecase/delete_address_usecase.dart';
import 'package:e_shop/domain/usecase/edit_address_usecase.dart';
import 'package:e_shop/domain/usecase/forget_password_usecase.dart';
import 'package:e_shop/domain/usecase/get_address_usecase.dart';
import 'package:e_shop/domain/usecase/get_order_usecase.dart';
import 'package:e_shop/domain/usecase/get_product_of_order_usecase.dart';
import 'package:e_shop/domain/usecase/get_product_usecase.dart';
import 'package:e_shop/domain/usecase/get_user_usecase.dart';
import 'package:e_shop/domain/usecase/place_order_usecase.dart';
import 'package:e_shop/domain/usecase/search_products_usecase.dart';
import 'package:e_shop/domain/usecase/set_user_usecase.dart';
import 'package:e_shop/domain/usecase/sign_in_with_email_n_password.dart';
import 'package:e_shop/domain/usecase/sign_out_usecase.dart';
import 'package:e_shop/domain/usecase/sign_up_with_facebook_usecase.dart';
import 'package:e_shop/domain/usecase/sign_up_with_google_usecase.dart';
import 'package:e_shop/domain/usecase/signup_with_email_n_password_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

var di = GetIt.instance;

void di_setUp() {
  print("injection started");
  // controllers
  di.registerFactory<Bindings>(() => Binding(di(), di(), di(), di(), di(), di(),
      di(), di(), di(), di(), di(), di(), di(), di(), di()));
  di.registerFactory(() => MainController(di()));
  di.registerFactory(() =>
      LoginSignUpController(di(), di(), di(), di(), di(), di(), di(), di()));
  di.registerFactory(() => AddressController(di(), di(), di(), di()));
  di.registerFactory(() => OrderController(di(), di()));
  
  // data sources
  di.registerLazySingleton<DataSource>(
      () => DataSourceImpl(di(), di(), di(), di(), di()));

  // repo
  di.registerLazySingleton<Repo>(() => RepoImpl(di()));

  // usecase
  di.registerLazySingleton(() => DeleteAddressUsecase(di()));
  di.registerLazySingleton(() => AddAddressUsecase(di()));
  di.registerLazySingleton(() => EditAddressUsecase(di()));
  di.registerLazySingleton(() => ForgetPasswordUsecase(di()));
  di.registerLazySingleton(() => GetAddressesUsecase(di()));
  di.registerLazySingleton(() => GetOrderUsecase(di()));
  di.registerLazySingleton(() => GetProductOfOrderUsecase(di()));
  di.registerLazySingleton(() => GetProductUsecase(di()));
  di.registerLazySingleton(() => GetUserUsecase(di()));
  di.registerLazySingleton(() => PlaceOrderUsecase(di()));
  di.registerLazySingleton(() => SearchProductsUsecase(di()));
  di.registerLazySingleton(() => SetUserUseCase(repo: di()));
  di.registerLazySingleton(() => SignInWithEmailnPasswordUsecase(di()));
  di.registerLazySingleton(() => SignOutUsecase(di()));
  di.registerLazySingleton(() => SignUpWithEmailnPasswordUsecase(di()));
  di.registerLazySingleton(() => SignUpWithFacebookUsecase(di()));
  di.registerLazySingleton(() => SignUpWithGoogleUsecase(di()));

  // externals
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  FacebookAuth facebookAuth = FacebookAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn();

  di.registerLazySingleton(() => firebaseStorage);
  di.registerLazySingleton(() => firebaseAuth);
  di.registerLazySingleton(() => firebaseFirestore);
  di.registerLazySingleton(() => facebookAuth);
  di.registerLazySingleton(() => googleSignIn);

  print("injection ended");
}
