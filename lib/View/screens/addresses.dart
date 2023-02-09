import 'package:e_shop/View/Widget/address_card.dart';
import 'package:e_shop/View/controller/address_controller.dart';
import 'package:e_shop/View/screens/add_address.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/MainController.dart';
import 'notifications.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({super.key});

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  AddressController addressController = Get.put(di<AddressController>());

  @override
  void initState() {
    super.initState();
    addressController.getAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Addresses",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
            onPressed: () {
              Get.to(() => const Notifications());
            },
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Get.put(di<MainController>()).z.value.toggle!();
          },
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
      ),
      body: GetBuilder<AddressController>(builder: (controller) {
        if (controller.addressState.value == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(color: primaryColor),
          );
        } else if (controller.addressState.value == RequestState.loaded &&
            controller.addresses.value.isEmpty) {
          return const Center(
            child: Text("No Address"),
          );
        }
        return ListView.builder(
            itemCount: controller.addresses.length,
            itemBuilder: (context, index) => AddressCard(
                  onTap: () {},
                  isSelected: false,
                  address: controller.addresses[index],
                ));
      }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          child: const Icon(Icons.add),
          onPressed: () {
            Get.to(() => AddAddress());
          }),
    );
  }
}
