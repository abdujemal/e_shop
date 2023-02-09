import 'package:e_shop/View/screens/order_detail.dart';
import 'package:e_shop/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCard extends StatefulWidget {
  final MyOrder order;
  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.delivery_dining),
      title: Text("${widget.order.products.length} Products"),
      subtitle: Text(widget.order.date),
      trailing: TextButton(
        child: const Text("Show Products"),
        onPressed: () {
          Get.to(() => OrderDetial(order: widget.order));
        },
      ),
    );
  }
}
