import 'package:e_shop/View/Widget/color_dot.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/data/models/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartCard extends StatefulWidget {
  final Cart cart;
  final Function onIncreament, onDecrement;
  const CartCard(
      {Key? key,
      required this.cart,
      required this.onIncreament,
      required this.onDecrement})
      : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Spacer(),
          image(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [SizedBox(width:150,child: Text(widget.cart.name)), const SizedBox(height: 10,),
             Text("\$${widget.cart.price}", style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),)],
          ),
          const Spacer(),
          ColorDot(color: Color(widget.cart.choosenColor), isActive: true, onTap: (){}),
          const Spacer(),
          quntityUi(),
          const Spacer()
        ],
      ),
    );
  }

  image() {
    return Container(
      decoration: BoxDecoration(
          color: widget.cart.bg_rgb, borderRadius: BorderRadius.circular(5)),
      width: 70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.network(
          widget.cart.img,
          width: 120,
          height: 70,
        ),
      ),
    );
  }

  quntityUi() {
    return Row(
      children: [
        InkWell(
          onTap: () => widget.onDecrement(),
          child: Ink(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(69, 255, 140, 0)),
            child: const Icon(
              Icons.remove,
              color: primaryColor,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "${widget.cart.quantity}",
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () => widget.onIncreament(),
          child: Ink(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(69, 255, 140, 0)),
            child: const Icon(
              Icons.add,
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
