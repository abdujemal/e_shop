import 'package:e_shop/View/Widget/color_dot.dart';
import 'package:e_shop/data/models/order_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderProductCard extends StatefulWidget {
  final OrderProductModel orderProductModel;
  const OrderProductCard({super.key, required this.orderProductModel});

  @override
  State<OrderProductCard> createState() => _OrderProductCardState();
}

class _OrderProductCardState extends State<OrderProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        elevation: 3,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.network(widget.orderProductModel.img, width: 100, height: 100,)),
                    const SizedBox(height: 5,),
                    Text(widget.orderProductModel.name, style: const TextStyle(color: Colors.black, fontSize: 17), overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: 5,),
                    Row(children: [
                      Text("\$${widget.orderProductModel.price}"),
                      const Spacer(),
                      Text("quantity: ${widget.orderProductModel.quantity}")
                    ],),
                    
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: ColorDot(color: Color(widget.orderProductModel.color), isActive: false, onTap: (){},),
            )
          ],
        ));
  }
}
