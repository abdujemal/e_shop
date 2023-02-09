import 'dart:async';

import 'package:e_shop/View/Widget/custom_button.dart';
import 'package:e_shop/View/Widget/input_layout.dart';
import 'package:e_shop/View/controller/address_controller.dart';
import 'package:e_shop/View/screens/notifications.dart';
import 'package:e_shop/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class AddAddress extends StatefulWidget {
  Address? address;
  AddAddress({super.key, this.address});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController nameTc = TextEditingController();
  TextEditingController stNumberTc = TextEditingController();
  TextEditingController cityTc = TextEditingController();

  var addressKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.address != null) {
      nameTc.text = widget.address!.name;
      stNumberTc.text = widget.address!.stNumber;
      cityTc.text = widget.address!.city;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.address != null ?
          "Edit Address":
          "Add Address",
          style: const TextStyle(color: Colors.black),
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
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: addressKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor: primaryColor.withOpacity(0.16),
                radius: 50,
                child: const Icon(
                  Icons.location_on,
                  color: primaryColor,
                  size: 60,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InputLayout(
                  title: "Name",
                  controller: nameTc,
                  type: TextInputType.text,
                  leadingIcon: Icons.text_fields),
              const SizedBox(
                height: 15,
              ),
              InputLayout(
                  title: "City",
                  controller: cityTc,
                  type: TextInputType.text,
                  leadingIcon: Icons.location_city),
              const SizedBox(
                height: 15,
              ),
              InputLayout(
                  title: "Streat Number",
                  controller: stNumberTc,
                  type: TextInputType.number,
                  leadingIcon: Icons.numbers),
              const SizedBox(
                height: 15,
              ),
              GetBuilder<AddressController>(builder: (controller) {
                if (controller.addAddressState.value == RequestState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(color: primaryColor),
                  );
                }
                return CustomButton(
                    text: "Save",
                    onTap: () {
                      if (addressKey.currentState!.validate()) {
                        if (widget.address != null) {
                          Address address = widget.address!.copyWith(
                              name: nameTc.text,
                              stNumber: stNumberTc.text,
                              city: cityTc.text
                          );

                          controller.editAddress(address);
                        } else {
                          Address address = Address(
                              name: nameTc.text,
                              stNumber: stNumberTc.text,
                              city: cityTc.text);

                          controller.addAddress(address);
                        }
                      }
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
