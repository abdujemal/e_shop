// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_shop/View/controller/address_controller.dart';
import 'package:e_shop/View/controller/order_controller.dart';
import 'package:e_shop/domain/usecase/add_address_usecase.dart';
import 'package:e_shop/domain/usecase/delete_address_usecase.dart';
import 'package:e_shop/domain/usecase/edit_address_usecase.dart';
import 'package:e_shop/domain/usecase/get_address_usecase.dart';
import 'package:e_shop/domain/usecase/get_order_usecase.dart';
import 'package:e_shop/domain/usecase/get_product_usecase.dart';
import 'package:e_shop/domain/usecase/get_user_usecase.dart';
import 'package:e_shop/domain/usecase/place_order_usecase.dart';
import 'package:e_shop/domain/usecase/set_user_usecase.dart';
import 'package:get/get.dart';

import 'package:e_shop/View/controller/MainController.dart';
import 'package:e_shop/View/controller/login_signUp_controller.dart';
import 'package:e_shop/domain/usecase/forget_password_usecase.dart';
import 'package:e_shop/domain/usecase/sign_in_with_email_n_password.dart';
import 'package:e_shop/domain/usecase/sign_out_usecase.dart';
import 'package:e_shop/domain/usecase/sign_up_with_facebook_usecase.dart';
import 'package:e_shop/domain/usecase/sign_up_with_google_usecase.dart';
import 'package:e_shop/domain/usecase/signup_with_email_n_password_usecase.dart';

class Binding extends Bindings {
  SignUpWithGoogleUsecase signUpWithGoogleUsecase;
  SignUpWithEmailnPasswordUsecase signUpWithEmailnPasswordUsecase;
  SignInWithEmailnPasswordUsecase signInWithEmailnPasswordUsecase;
  SignUpWithFacebookUsecase signUpWithFacebookUsecase;
  SignOutUsecase signOutUsecase;
  ForgetPasswordUsecase forgetPasswordUsecase;
  GetUserUsecase getUserUsecase;
  SetUserUseCase setUserUseCase;
  GetProductUsecase getProductUsecase;
  AddAddressUsecase addAddressUsecase;
  EditAddressUsecase editAddressUsecase;
  GetAddressesUsecase getAddressesUsecase;
  DeleteAddressUsecase deleteAddressUsecase;
  PlaceOrderUsecase placeOrderUsecase;
  GetOrderUsecase getOrderUsecase;

  Binding(
      this.deleteAddressUsecase,
      this.addAddressUsecase,
      this.getAddressesUsecase,
      this.getUserUsecase,
      this.signUpWithGoogleUsecase,
      this.signUpWithEmailnPasswordUsecase,
      this.signInWithEmailnPasswordUsecase,
      this.signUpWithFacebookUsecase,
      this.signOutUsecase,
      this.forgetPasswordUsecase,
      this.setUserUseCase,
      this.getProductUsecase,
      this.editAddressUsecase,
      this.getOrderUsecase,
      this.placeOrderUsecase);

  @override
  void dependencies() {
    Get.lazyPut(() => MainController(getProductUsecase));
    Get.lazyPut(() => LoginSignUpController(
        getUserUsecase,
        signUpWithGoogleUsecase,
        signUpWithEmailnPasswordUsecase,
        signInWithEmailnPasswordUsecase,
        signUpWithFacebookUsecase,
        signOutUsecase,
        forgetPasswordUsecase,
        setUserUseCase));
    Get.lazyPut(() => AddressController(addAddressUsecase, getAddressesUsecase,
        editAddressUsecase, deleteAddressUsecase));
    Get.lazyPut(() => OrderController(getOrderUsecase, placeOrderUsecase));
  }
}
