import 'package:e_shop/View/controller/MainController.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.index,
    required this.controller,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.bgColor,
    required this.isLiked,
  }) : super(key: key);
  final String image, title;
  final VoidCallback press;
  final int price, index;
  final Color bgColor;
  final bool isLiked;
  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154,
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        decoration: const BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(defaultBorderRadius)),
                  ),
                  child: Image.network(
                    image,
                    height: 132,
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: defaultPadding / 4),
                    Text(
                      "\$" + price.toString(),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  isLiked ?
                  Icons.favorite:
                  Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () => {
                  controller.like(index)
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
