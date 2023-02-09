import 'package:e_shop/View/screens/details_screen.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:e_shop/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class NewArrivalProducts extends StatelessWidget {
  const NewArrivalProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "New Arrival",
            pressSeeAll: () {},
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          child: GetBuilder<MainController>(builder: (controller) {
            if (controller.productState.value == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(color: primaryColor),
              );
            }
            return Row(
              children: List.generate(
                controller.products.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: ProductCard(
                    isLiked: controller.products[index].isLiked,
                    index: index,
                    controller: controller,
                    title: controller.products[index].title,
                    image: controller.products[index].image,
                    price: controller.products[index].price,
                    bgColor: controller.products[index].bgColor ?? Colors.white,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                product: controller.products[index]),
                          ));
                    },
                  ),
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
