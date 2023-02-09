import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/data/models/address_model.dart';
import 'package:e_shop/data/models/order_model.dart';
import 'package:e_shop/data/models/product_model.dart';
import 'package:e_shop/data/models/transaction_model.dart';
import 'package:e_shop/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

import '../../View/controller/MainController.dart';
import '../../injection.dart';
import '../models/cart_model.dart';

abstract class DataSource {
  // Authentication

  Future<UserModel> signUpWithEmailnPassword(String email, String password,
      String name, String phone, String location, String zipCode, File image);

  Future<UserModel> signUpWithGoogle(
      {String? name, String? phone, String? location, String? zipCode});

  Future<UserModel> signUpWithFacebook(
      {String? name, String? phone, String? location, String? zipCode});

  Future<UserModel> signInWithEmailnPassword(String email, String password);

  Future<bool> forgetPassword(String email);

  Future<bool> signOut();

  Future<UserModel> getUser();

  Future<UserModel> setUser(
      String email, String name, String phone, String location, String zipCode);

  // cloud firestore

  Future<List<Product>> getProducts();

  Future<List<Product>> searchProducts(String query);

  Future<List<MyOrder>> getOrders();

  Future<void> placeOrder(String payment, Address address);

  Future<List<Product>> getProductsOfOrders(MyOrder order);

  Future<List<Address>> getAddresses();

  Future<void> addAddress(Address address);

  Future<List<Address>> editAddress(Address address);

  Future<void> deleteAddress(Address address);
}

class DataSourceImpl extends DataSource {
  FirebaseAuth firebaseAuth;
  FirebaseFirestore firebaseFirestore;
  FirebaseStorage firebaseStorage;
  FacebookAuth facebookAuth;
  GoogleSignIn googleSignIn;

  DataSourceImpl(this.firebaseAuth, this.firebaseFirestore,
      this.firebaseStorage, this.facebookAuth, this.googleSignIn);

  @override
  Future<bool> forgetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return true;
  }

  @override
  Future<UserModel> signInWithEmailnPassword(
      String email, String password) async {
    UserCredential cred = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    String uid = cred.user!.uid;

    final usersnap = await firebaseFirestore.collection('users').doc(uid).get();
    if (usersnap.exists) {
      return UserModel.fromSnapshot(usersnap);
    } else {
      throw Exception("no user with this id.");
    }
  }

  @override
  Future<bool> signOut() async {
    bool isGoogle =
        firebaseAuth.currentUser!.providerData[0].providerId == "google.com";

    bool isFacebook =
        firebaseAuth.currentUser!.providerData[0].providerId == "facebook.com";

    await firebaseAuth.signOut();
    if (isGoogle) {
      googleSignIn.signOut();
    }else if(isFacebook){
      facebookAuth.logOut();
    }

    return true;
  }

  @override
  Future<UserModel> signUpWithEmailnPassword(
      String email,
      String password,
      String name,
      String phone,
      String location,
      String zipCode,
      File file) async {
    print("registering $email, $password");
    UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    String uid = cred.user!.uid;

    final userRef = firebaseStorage.ref().child("users/$uid");

    UploadTask userTask = userRef.putFile(file);

    String userImage = await userTask.storage.ref().getDownloadURL();

    UserModel userModel = UserModel(
        name: name,
        email: email,
        location: location,
        zipCode: zipCode,
        phoneNumber: phone,
        id: uid,
        img: userImage);

    await firebaseFirestore
        .collection("users")
        .doc(uid)
        .set(userModel.toJson());

    return userModel;
  }

  @override
  Future<UserModel> signUpWithFacebook({
    String? name,
    String? phone,
    String? location,
    String? zipCode,
  }) async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await facebookAuth.login();

    if (loginResult.accessToken != null) {
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      UserCredential cred =
          await firebaseAuth.signInWithCredential(facebookAuthCredential);

      String uid = cred.user!.uid;

      final ds = await firebaseFirestore.collection("users").doc(uid).get();
      if (ds.exists) {
        UserModel userModel = UserModel.fromSnapshot(ds);
        return userModel;
      } else {
        print("registering...facebook");
        UserModel userModel = UserModel(
            name: name ?? "",
            email: cred.user!.email ?? "",
            location: location ?? "",
            zipCode: zipCode ?? "",
            phoneNumber: phone ?? "",
            id: cred.user!.uid,
            img: cred.user!.photoURL ?? "");
        await firebaseFirestore
            .collection("users")
            .doc(uid)
            .set(userModel.toJson());
        return userModel;
      }
    } else {
      throw Exception("Please try again.");
    }
  }

  @override
  Future<UserModel> signUpWithGoogle({
    String? name,
    String? phone,
    String? location,
    String? zipCode,
  }) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential cred = await firebaseAuth.signInWithCredential(credential);

      String uid = cred.user!.uid;

      final ds = await firebaseFirestore.collection('users').doc(uid).get();
      if (ds.exists) {
        UserModel userModel = UserModel.fromSnapshot(ds);
        return userModel;
      } else {
        UserModel userModel = UserModel(
            name: name ?? "",
            email: cred.user!.email ?? "",
            location: location ?? "",
            zipCode: zipCode ?? "",
            phoneNumber: phone ?? "",
            id: cred.user!.uid,
            img: cred.user!.photoURL ?? "");
        await firebaseFirestore
            .collection("users")
            .doc(uid)
            .set(userModel.toJson());
        return userModel;
      }
    } else {
      throw Exception("Please try again");
    }
  }

  @override
  Future<UserModel> getUser() async {
    User? user = firebaseAuth.currentUser;

    if (user != null) {
      final ds =
          await firebaseFirestore.collection("users").doc(user.uid).get();
      if (ds.exists) {
        UserModel userModel = UserModel.fromSnapshot(ds);
        return userModel;
      } else {
        throw Exception("user does not exist.");
      }
    } else {
      throw Exception("not sign up.");
    }
  }

  @override
  Future<UserModel> setUser(String email, String name, String phone,
      String location, String zipCode) async {
    User? user = firebaseAuth.currentUser;
    final data = {
      'email': email,
      'name': name,
      'phoneNumber': phone,
      'location': location,
      'zipCode': zipCode
    };
    await firebaseFirestore.collection("users").doc(user!.uid).update(data);

    final userDs =
        await firebaseFirestore.collection('users').doc(user.uid).get();

    return UserModel.fromSnapshot(userDs);
  }

  @override
  Future<List<MyOrder>> getOrders() async {
    final orderQs = await firebaseFirestore.collection("orders").get();

    List<MyOrder> orders = [];

    for (var orderDc in orderQs.docs) {
      MyOrder order = MyOrder.fromFirebase(orderDc);
      orders.add(order);
    }

    return orders;
  }

  @override
  Future<List<Product>> getProducts() async {
    final qsProduct = await firebaseFirestore.collection("products").get();

    List<Product> lstOfProducts = [];

    for (var product in qsProduct.docs) {
      if (product.exists) {
        Product productModel = Product.fromSnapshot(product);
        lstOfProducts.add(productModel);
      }
    }
    return lstOfProducts;
  }

  @override
  Future<List<Product>> getProductsOfOrders(MyOrder order) {
    // TODO: implement getProductsOfOrders
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> searchProducts(String query) {
    // TODO: implement searchProducts
    throw UnimplementedError();
  }

  @override
  Future<void> addAddress(Address address) async {
    await firebaseFirestore.collection("addresses").add(address.toFirbaseMap());
  }

  @override
  Future<List<Address>> getAddresses() async {
    String uid = firebaseAuth.currentUser!.uid;

    final addressQs = await firebaseFirestore
        .collection("addresses")
        .where("uid", isEqualTo: uid)
        .get();

    List<Address> addresses = [];

    for (var addressSnap in addressQs.docs) {
      Address address = Address.fromFirebase(addressSnap);
      addresses.add(address);
    }

    return addresses;
  }

  @override
  Future<List<Address>> editAddress(Address address) async {
    await firebaseFirestore
        .collection("addresses")
        .doc(address.id!)
        .set(address.toFirbaseMap());

    return await getAddresses();
  }

  @override
  Future<void> deleteAddress(Address address) async {
    await firebaseFirestore.collection("addresses").doc(address.id!).delete();
  }

  @override
  Future<void> placeOrder(String payment, Address address) async {
    final cartController = Get.put(MainController(di()));

    String date = DateFormat("MMM dd,yyyy").format(DateTime.now());

    List<String> products = [];

    for (Cart cart in cartController.cartList) {
      products.add(
          "${cart.img},${cart.name},${cart.choosenColor},${cart.price},${cart.quantity}");
    }

    MyOrder myOrder = MyOrder(
        city: address.city,
        stNumber: address.stNumber,
        payment: payment,
        price: cartController.subTotal.value.toString(),
        status: 'Ordered',
        date: date,
        uid: di<FirebaseAuth>().currentUser!.uid,
        products: products);
    await firebaseFirestore.collection("orders").add(myOrder.toFirebaseMap());
  }
}
