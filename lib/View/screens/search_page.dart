import 'package:e_shop/View/Widget/categories.dart';
import 'package:e_shop/View/Widget/new_arrival_products.dart';
import 'package:e_shop/View/Widget/popular_products.dart';
import 'package:e_shop/View/Widget/product_card.dart';
import 'package:e_shop/View/screens/details_screen.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:e_shop/data/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../Widget/search_form.dart';
import '../Widget/section_title.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchTc = TextEditingController();
  List<Product> searchedProducts = [];

  @override
  initState() {
    super.initState();
    Get.find<MainController>().search();
  }

  searchResults() {
    return GetBuilder<MainController>(builder: (controller) {
      return SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 185,
          mainAxisSpacing: 10,
          crossAxisSpacing: 16,
          mainAxisExtent: 200,
        ),
        delegate: SliverChildBuilderDelegate(((context, index) {
          return ProductCard(
            isLiked: controller.products[index].isLiked,
            index: index,
            controller: controller,
            title: controller.searchResuts[index].title,
            image: controller.searchResuts[index].image,
            price: controller.searchResuts[index].price,
            bgColor: controller.searchResuts[index].bgColor!,
            press: () {
              Get.to(() => DetailsScreen(product: demo_product[index]));
            },
          );
        }), childCount: controller.searchResuts.length),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    searchTc.text = Get.find<MainController>().searchQuery.value;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 35,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "15/2 New Texas",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SearchForm(
                              searchTc: searchTc,
                              isSearching: true,
                            ),
                            SectionTitle(
                              title: "Recent searchs",
                              pressSeeAll: () {},
                            ),
                            GetBuilder<MainController>(builder: (controller) {
                              return Text(
                                'Search results showing for "${controller.searchQuery.value}"',
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                              );
                            }),
                          ],
                        ),
                      ),
                  childCount: 1),
            ),
          ),
          searchResults()
        ],
      ),
    );
  }
}
