import 'package:e_shop/View/Widget/order_product_card.dart';
import 'package:e_shop/View/screens/notifications.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/data/models/order_model.dart';
import 'package:e_shop/data/models/order_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderDetial extends StatefulWidget {
  final MyOrder order;
  const OrderDetial({super.key, required this.order});

  @override
  State<OrderDetial> createState() => _OrderDetialState();
}

class _OrderDetialState extends State<OrderDetial> {
  List<String> orderStatuses = [
    "Ordered",
    "Payment Received",
    "Processing",
    "All Shipped"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Detail",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            Get.back();
          },
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              title("Products of your order"),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.order.products.length,
                  itemBuilder: (context, index) {
                    return OrderProductCard(
                        orderProductModel: OrderProductModel.fromString(
                            widget.order.products[index]));
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              title("Order Status"),
              const SizedBox(
                height: 15,
              ),
              ...orderStatus()
            ],
          ),
        ),
      ),
    );
  }

  orderStatus() {
    return List.generate(orderStatuses.length, (index) {
      bool isStatus = orderStatuses[index] == widget.order.status;
      bool isEnd = orderStatuses.length - 1 == index;
      return Container(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                isStatus
                    ? const Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 15,
                      )
                    : const Icon(
                        Icons.circle_outlined,
                        size: 15,
                      ),
                const SizedBox(
                  width: 20,
                  height: 5,
                ),
                isEnd
                    ? const SizedBox()
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Container(width: 1, color: Colors.green),
                        ),
                      ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderStatuses[index],
                  style: TextStyle(
                      color: isStatus ? primaryColor : Colors.grey[800],
                      fontWeight: isStatus ? FontWeight.bold : null,
                      fontSize: 17),
                ),
                isStatus
                    ? const Text(
                        "We have Recieved your order",
                        style: TextStyle(fontSize: 12),
                      )
                    : const SizedBox(),
              ],
            )
          ],
        ),
      );
    });
  }

  title(String txt) {
    return Text(
      txt,
      style: Theme.of(context).textTheme.headline6!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
    );
  }
}
