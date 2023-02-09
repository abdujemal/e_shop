import 'package:e_shop/constants.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:e_shop/data/models/cart_model.dart';
import 'package:e_shop/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Widget/color_dot.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    colors(context) {
      return Column(
        children: [
          Text(
            "Colors",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(height: defaultPadding / 2),
          GetBuilder<MainController>(builder: (controller) {
            return Row(
                children: List.generate(
              widget.product.colors.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ColorDot(
                  onTap: () {
                    setState(() {
                      currentColor = index;
                    });
                  },
                  color: Color(widget.product.colors[index]),
                  isActive: currentColor == index,
                ),
              ),
            ));
          }),
        ],
      );
    }

    return Scaffold(
      backgroundColor: widget.product.bgColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                )),
          )
        ],
      ),
      body: Column(
        children: [
          Image.network(
            widget.product.image,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding,
                  defaultPadding * 2, defaultPadding, defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Text(
                        "\$" + widget.product.price.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(widget.product.description),
                  ),
                  colors(context),
                  const SizedBox(height: defaultPadding * 2),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.find<MainController>().cartList.value.add(Cart(
                              choosenColor: widget.product.colors[currentColor],
                              quantity: 1,
                              img: widget.product.image,
                              name: widget.product.title,
                              category: "",
                              colors: "",
                              description: "",
                              id: "",
                              isLiked: "",
                              bg_rgb: widget.product.bgColor!,
                              price: widget.product.price));
                          Get.find<MainController>().calculate();
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            shape: const StadiumBorder()),
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
