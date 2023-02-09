import 'package:e_shop/View/controller/MainController.dart';
import 'package:e_shop/View/screens/completed.dart';
import 'package:e_shop/base_usecase.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/data/models/address_model.dart';
import 'package:e_shop/domain/usecase/get_order_usecase.dart';
import 'package:e_shop/domain/usecase/place_order_usecase.dart';
import 'package:e_shop/injection.dart';
import 'package:get/get.dart';

import '../../data/models/order_model.dart';

class OrderController extends GetxController {
  Rx<RequestState> addOrderState = RequestState.idle.obs;

  Rx<RequestState> orderState = RequestState.idle.obs;

  RxList<MyOrder> orders = <MyOrder>[].obs;

  GetOrderUsecase getOrderUsecase;
  PlaceOrderUsecase placeOrderUsecase;
  OrderController(this.getOrderUsecase, this.placeOrderUsecase);

  placeOrder(String payment, Address address) async {
    addOrderState.value = RequestState.loading;
    update();

    final res = await placeOrderUsecase.call(PlaceOrderParam(payment, address));

    res.fold((l) {
      addOrderState.value = RequestState.error;
      toast(l.toString(), ToastType.error);
      update();
    }, (r) {
      addOrderState.value = RequestState.loaded;
      toast("You have successfully placed your order.", ToastType.success);
      final cartController = Get.put(MainController(di()));
      cartController.cartList.value = [];
      cartController.update();
      update();
      Get.off(() => const Completed());
    });
  }

  getOrder() async {
    orderState.value = RequestState.loading;
    update();

    final res = await getOrderUsecase.call(const NoParameters());

    res.fold((l) {
      orderState.value = RequestState.error;
      toast(l.toString(), ToastType.error);
    }, (r) {
      orderState.value = RequestState.loaded;
      orders.value = r;
      update();
    });
  }
}
