import 'package:e_shop/View/Widget/address_card.dart';
import 'package:e_shop/View/Widget/custom_button.dart';
import 'package:e_shop/View/Widget/payment_card.dart';
import 'package:e_shop/View/controller/address_controller.dart';
import 'package:e_shop/View/controller/order_controller.dart';
import 'package:e_shop/View/screens/notifications.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/data/models/payment_model.dart';
import 'package:e_shop/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  List<Payment> payments = [
    Payment("Applepay", "assets/images/applepay.png"),
    Payment("Visa", "assets/images/visa.png"),
    Payment("Mastercard", 'assets/images/master_card.png'),
    Payment("paypal", "assets/images/paypal.png")
  ];

  MainController mainController = Get.put(di<MainController>());
  AddressController addressController = Get.put(di<AddressController>());
  OrderController controller = Get.put(OrderController(di(), di()));

  int selectedAddress = 0;
  int selectedPAyment = 0;

  @override
  void initState() {
    super.initState();

    addressController = Get.put(di<AddressController>());
    mainController = Get.put(di<MainController>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 35,
            ),
          ),
          title: const Text(
            "Check Out",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: SvgPicture.asset("assets/icons/Notification.svg"),
              onPressed: () {
                Get.to(() => const Notifications());
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    title("Delivery Address"),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          mainController.setMainMenuIndex(1);
                          // Get.back();
                        },
                        child: const Text("add"))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<AddressController>(builder: (controller) {
                  return Column(
                    children: deliverAddresses(controller),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                title("Billing Information"),
                billingInfo(),
                const SizedBox(
                  height: 20,
                ),
                title("Payment Method"),
                const SizedBox(
                  height: 10,
                ),
                paymentMethods(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Obx(() {                      
                      if (controller.addOrderState.value ==
                          RequestState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(color: primaryColor),
                        );
                      }
                      return CustomButton(
                        text: "Submit",
                        onTap: () {
                          if (mainController.cartList.isNotEmpty) {
                            controller.placeOrder(
                                payments[selectedPAyment].name,
                                addressController.addresses[selectedAddress]);
                          } else {
                            toast("your cart is empty.", ToastType.error);
                          }
                        },
                      );
                    })),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }

  title(String s) {
    return Text(
      s,
      textAlign: TextAlign.start,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
    );
  }

  deliverAddresses(AddressController controller) {
    return List.generate(
        controller.addresses.length,
        (index) => AddressCard(
              onTap: () {
                setState(() {
                  selectedAddress = index;
                });
              },
              isSelected: selectedAddress == index,
              address: controller.addresses[index],
            ));
  }

  billingInfo() {
    return GetBuilder<MainController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            billInfoItem("Delivery Fee", "200"),
            const SizedBox(
              height: 5,
            ),
            billInfoItem("Subtotal", controller.subTotal.value.toString()),
            const Divider(
              color: Colors.grey,
            ),
            billInfoItem("Total", "${controller.subTotal.value + 200}")
          ],
        ),
      );
    });
  }

  billInfoItem(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        const Text(":"),
        Text(
          "ETB${price}",
          style: const TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  paymentMethods() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
            payments.length,
            (index) => PaymentCard(
                  payment: payments[index],
                  isActive: selectedPAyment == index,
                  onTap: () {
                    setState(() {
                      selectedPAyment = index;
                    });
                  },
                )),
      ),
    );
  }
}
