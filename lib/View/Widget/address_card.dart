import 'package:e_shop/View/controller/address_controller.dart';
import 'package:e_shop/View/screens/add_address.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddressCard extends StatefulWidget {
  final Address address;
  final bool isSelected;
  final Function onTap;

  const AddressCard(
      {Key? key,
      required this.address,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: widget.isSelected
                ? BorderSide.none
                : const BorderSide(color: Color.fromARGB(255, 195, 195, 195))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () => widget.onTap(),
            title: Text(widget.address.name),
            leading: widget.isSelected
                ? const Icon(
                    Icons.check_circle,
                    color: primaryColor,
                  )
                : const Icon(
                    Icons.circle_outlined,
                    color: Color.fromARGB(255, 196, 196, 196),
                  ),
            subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.address.city),
                  Text(widget.address.stNumber)
                ]),
            trailing: Column(
              children: [
                GestureDetector(
                  child: const Icon(Icons.edit),
                  onTap: () {
                    Get.to(() => AddAddress(
                          address: widget.address,
                        ));
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                GetBuilder<AddressController>(builder: (controler) {
                  return GestureDetector(
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onTap: () {
                      controler.deleteAddress(widget.address);
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
