import 'dart:developer';

import 'package:e_shop/View/Widget/filter_dialog.dart';
import 'package:e_shop/View/screens/search_page.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class SearchForm extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  final bool isSearching;
  final TextEditingController searchTc;

  SearchForm({
    Key? key,
    required this.isSearching,
    required this.searchTc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Form(
        key: formKey,
        child: TextFormField(
          controller: searchTc,
          onFieldSubmitted: (value) {
            if (isSearching) {
              controller.setSearchQuery(value);
              controller.search();
              controller.update();
            } else {
              controller.setSearchQuery(value);
              Get.to(() => const SearchPage());
            }
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Search items...",
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            errorBorder: outlineInputBorder,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(14),
              child: SvgPicture.asset("assets/icons/Search.svg"),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: SizedBox(
                width: 48,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onPressed: () {
                    Get.dialog(const FilterDialog());
                  },
                  child: SvgPicture.asset("assets/icons/Filter.svg"),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
