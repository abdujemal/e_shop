import 'package:e_shop/base_usecase.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/data/models/product_model.dart';
import 'package:e_shop/data/models/tag_model.dart';
import 'package:e_shop/domain/usecase/get_product_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var z = ZoomDrawerController().obs;
  var mainMenuIndex = 0.obs;
  var exploreMenuIndex = 0.obs;
  var searchQuery = "".obs;
  var searchResuts = demo_product.obs;
  var cartList = [].obs;
  var subTotal = 0.obs;
  var products = [].obs;

  Rx<RequestState> productState = RequestState.idle.obs;

  final GetProductUsecase getProductUsecase;
  MainController(this.getProductUsecase);

  Rx<Tag> tags =
      Tag(null, const RangeValues(30, 60), const RangeValues(5, 10)).obs;

  void getProducts() async {
    productState.value = RequestState.loading;
    update();

    final res = await getProductUsecase.call(const NoParameters());

    res.fold((l) {
      productState.value = RequestState.error;
      toast(l.toString(), ToastType.error);
      update();
    }, (r) {
      productState.value = RequestState.loaded;
      products.value = r;
      update();
    });
  }

  like(int index) {
    products[index].isLiked = !products[index].isLiked;
    update();
  }

  search() {
    searchResuts.value = [];
    for (Product product in demo_product) {
      if (product.title.toLowerCase().startsWith(searchQuery.toLowerCase())) {
        searchResuts.add(product);
      }
    }
  }

  calculate() {
    int total = 0;
    for (var cartItem in cartList) {
      total = (total + (cartItem.price * cartItem.quantity) as int);
    }
    subTotal.value = total;
    update();
  }

  setSearchQuery(String v) {
    searchQuery.value = v;
    update();
  }

  setMainMenuIndex(int v) {
    mainMenuIndex.value = v;
    z.value.toggle!();
    update();
  }

  setExploreMenuIndex(int v) {
    exploreMenuIndex.value = v;
    update();
  }
}