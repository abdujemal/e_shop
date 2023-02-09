import 'package:e_shop/View/Widget/product_card.dart';
import 'package:e_shop/View/screens/details_screen.dart';
import 'package:e_shop/View/screens/notifications.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.find<MainController>().z.value.toggle!();
          },
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        title: const Text(
          "Favourites",
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
      body: GetBuilder<MainController>(builder: (controller) {
        var likedProducts =
            controller.products.where((product) => product.isLiked).toList();

        
        return likedProducts.isEmpty?
              Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/empty_favorite.png"),
                  SizedBox(height: 20,),
                  Text("Empty Favorites", style: TextStyle(fontSize: 20),)
                ],
              ),
            ): GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 185,
              mainAxisSpacing: 10,
              crossAxisSpacing: 16,
              mainAxisExtent: 200,
            ),
            itemCount: likedProducts.length,
            itemBuilder: (context, index) {
              return 
              ProductCard(
                  index: index,
                  controller: controller,
                  image: likedProducts[index].image,
                  title: likedProducts[index].title,
                  price: likedProducts[index].price,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                              product: controller.products[index]),
                        ));
                  },
                  bgColor: likedProducts[index].bgColor!,
                  isLiked: likedProducts[index].isLiked);
            });
      }),
    );
  }
}
