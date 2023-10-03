import 'dart:io';

import 'package:e_shop/View/screens/LoginSignUp.dart';
import 'package:e_shop/View/screens/main.dart';
import 'package:e_shop/base_usecase.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/domain/usecase/forget_password_usecase.dart';
import 'package:e_shop/domain/usecase/get_user_usecase.dart';
import 'package:e_shop/domain/usecase/set_user_usecase.dart';
import 'package:e_shop/domain/usecase/sign_in_with_email_n_password.dart';
import 'package:e_shop/domain/usecase/sign_out_usecase.dart';
import 'package:e_shop/domain/usecase/sign_up_with_facebook_usecase.dart';
import 'package:e_shop/domain/usecase/sign_up_with_google_usecase.dart';
import 'package:e_shop/domain/usecase/signup_with_email_n_password_usecase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/user_model.dart';

class LoginSignUpController extends GetxController {
  Rx<UserModel> currentUser = UserModel(
          name: "",
          email: "",
          location: "",
          zipCode: "",
          phoneNumber: "",
          id: "",
          img: "")
      .obs;

  Rx<RequestState> googleSignUpState = RequestState.idle.obs;

  Rx<RequestState> facebookSignUpState = RequestState.idle.obs;

  Rx<RequestState> emailSignInState = RequestState.idle.obs;

  Rx<RequestState> emailSignUpState = RequestState.idle.obs;

  Rx<RequestState> signOutState = RequestState.idle.obs;

  Rx<RequestState> setUserState = RequestState.idle.obs;

  Rx<File> registerImg = File("").obs;

  final SignUpWithGoogleUsecase signUpWithGoogleUsecase;
  final SignUpWithEmailnPasswordUsecase signUpWithEmailnPasswordUsecase;
  final SignInWithEmailnPasswordUsecase signInWithEmailnPasswordUsecase;
  final SignUpWithFacebookUsecase signUpWithFacebookUsecase;
  final SignOutUsecase signOutUsecase;
  final ForgetPasswordUsecase forgetPasswordUsecase;
  final GetUserUsecase getUserUsecase;
  final SetUserUseCase setUserUseCase;

  LoginSignUpController(
      this.getUserUsecase,
      this.signUpWithGoogleUsecase,
      this.signUpWithEmailnPasswordUsecase,
      this.signInWithEmailnPasswordUsecase,
      this.signUpWithFacebookUsecase,
      this.signOutUsecase,
      this.forgetPasswordUsecase,
      this.setUserUseCase);

  void setUser(String email, String phone, String location, String name,
      String zipCode) async {
    setUserState.value = RequestState.loading;
    update();

    final res = await setUserUseCase.call(SetUserParameter(
        email: email,
        phone: phone,
        location: location,
        name: name,
        zipCode: zipCode));

    res.fold((l) {
      setUserState.value = RequestState.error;
      toast(l.toString(), ToastType.error);
      update();
    }, (r) {
      setUserState.value = RequestState.loaded;
      currentUser.value = r;
      toast("You have successfully updates your profile.", ToastType.success);
      update();
    });
  }

  Future<void> getUesr() async {
    final res = await getUserUsecase.call(const NoParameters());
    res.fold((l) {
      Get.offAll(() => const LoginSignUp());
    }, (r) {
      currentUser.value = r;
      Get.offAll(() => const Main());
    });
  }

  void googleSignUp(
      String? name, String? phone, String? location, String? zipCode) async {
    googleSignUpState.value = RequestState.loading;
    update();

    final res = await signUpWithGoogleUsecase.call(SignUpGoogleParameter(
        name: name, phone: phone, location: location, zipCode: zipCode));

    res.fold((l) {
      googleSignUpState.value = RequestState.error;
      toast(l.toString(), ToastType.error);
      update();
    }, (r) {
      googleSignUpState.value = RequestState.loaded;
      currentUser.value = r;
      toast("You have successfully signin with your google account.",
          ToastType.success);
      update();
      Get.offAll(() => const Main());
    });
  }

  void facebookSignUp(
      String? name, String? phone, String? location, String? zipCode) async {
    facebookSignUpState.value = RequestState.loading;
    update();

    final res = await signUpWithFacebookUsecase(SignUpFacebookParameter(
        name: name, phone: phone, location: location, zipCode: zipCode));

    res.fold((l) {
      facebookSignUpState.value = RequestState.error;
      toast(l.toString(), ToastType.error);
      update();
    }, (r) {
      facebookSignUpState.value = RequestState.loaded;
      currentUser.value = r;
      toast("You have successfully signin with your facebook account.",
          ToastType.success);
      update();
      Get.offAll(() => const Main());
    });
  }

  void signInWithEmailnPassword(String email, String password) async {
    emailSignInState.value = RequestState.loading;
    update();

    final res = await signInWithEmailnPasswordUsecase(
        SignInWithEmailPasswordParameter(email, password));

    res.fold((l) {
      emailSignInState.value = RequestState.error;
      toast(l.toString(), ToastType.error);
      update();
    }, (r) {
      emailSignInState.value = RequestState.loaded;
      currentUser.value = r;
      toast("You have successfully signin with your email account.",
          ToastType.success);
      update();
      Get.offAll(() => const Main());
    });
  }

  void signUpWithEmailnPassword(String email, String password, String name,
      String phone, String location, String zipCode, File image) async {
    emailSignUpState.value = RequestState.loading;
    update();

    final res = await signUpWithEmailnPasswordUsecase(
        SignUpWEmailPasswordParameters(
            email: email,
            password: password,
            name: name,
            phone: phone,
            location: location,
            zipCode: zipCode,
            image: image));

    res.fold((l) {
      emailSignUpState.value = RequestState.error;
      toast(l.toString(), ToastType.error);
      print(l.toString());
      update();
    }, (r) {
      emailSignUpState.value = RequestState.loaded;
      currentUser.value = r;
      toast("You have successfully signUp with your email account.",
          ToastType.success);
      update();
      Get.offAll(() => const Main());
    });
  }

  void signOut() async {
    signOutState.value = RequestState.loading;
    update();

    final res = await signOutUsecase.call(const NoParameters());

    res.fold((l) {
      signOutState.value = RequestState.error;
      toast(l.toString(), ToastType.error);
      update();
    }, (r) {
      signOutState.value = RequestState.loaded;

      currentUser.value = UserModel(
          name: "",
          email: "",
          location: "",
          zipCode: "",
          phoneNumber: "",
          id: "",
          img: "");

      toast("You have successfully signed out.", ToastType.success);
      update();
      Get.offAll(() => const LoginSignUp());
      // Get.toEnd(() => const LoginSignUp());
    });
  }

  void setImage() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      print(xFile.path);
      File? imgFile = File(xFile.path);
      registerImg.value = imgFile;
      update();
    } else {
      toast("Please, try again", ToastType.error);
    }
  }
}
