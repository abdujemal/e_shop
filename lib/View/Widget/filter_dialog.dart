import 'package:e_shop/View/Widget/custom_button.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:e_shop/data/models/tag_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  int? selectedIndex;

  RangeValues priceRangeValues = const RangeValues(30, 60);
  RangeValues distanceValues = const RangeValues(5, 10);

  var categories = ["New Arrival", "Top Trending", "Featured Products"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      priceRangeValues = Get.find<MainController>().tags.value.price!;
      distanceValues = Get.find<MainController>().tags.value.distance!;
      if (Get.find<MainController>().tags.value.category == null) {
        selectedIndex = null;
      } else {
        selectedIndex =
            categories.indexOf(Get.find<MainController>().tags.value.category!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 450,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  "Filter",
                  style: TextStyle(color: Colors.black),
                ),
                leading: TextButton(
                    onPressed: () {
                      Get.find<MainController>().tags.value =
                          Tag(null, null, null);
                      setState(() {
                        selectedIndex = null;
                      });
                    },
                    child: const Text(
                      "Clear",
                      style: TextStyle(color: Colors.black),
                    )),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Container(
                          padding: const EdgeInsets.all(6),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(50)),
                          child: SvgPicture.asset('assets/icons/xmark.svg')))
                ],
              ),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title("Category"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: category(categories)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    sliderTitle("Price", "\$50-\$200"),
                    priceSlider(),
                    const SizedBox(
                      height: 20,
                    ),
                    sliderTitle("Distance", "5km-20km"),
                    distanceSlider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: CustomButton(
                          text: "Apply Filter",
                          onTap: () {
                            if (selectedIndex == null) {
                              Get.find<MainController>().tags.value =
                                  Tag(null, priceRangeValues, distanceValues);
                            } else {
                              Get.find<MainController>().tags.value = Tag(
                                  categories[selectedIndex!],
                                  priceRangeValues,
                                  distanceValues);
                            }
                            Get.back();
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  sliderTitle(titl, range) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title(titl),
        Text(
          range,
          style: const TextStyle(color: Colors.black),
        )
      ],
    );
  }

  priceSlider() {
    return RangeSlider(
      activeColor: primaryColor,
      inactiveColor: Colors.grey[350],
      values: priceRangeValues,
      min: 20,
      max: 200,
      divisions: 10,
      labels: RangeLabels(
        "\$${priceRangeValues.start.round().toString()}",
        "\$${priceRangeValues.end.round().toString()}",
      ),
      onChanged: (RangeValues values) {
        setState(() {
          priceRangeValues = values;
        });
      },
    );
  }

  distanceSlider() {
    return RangeSlider(
      activeColor: primaryColor,
      inactiveColor: Colors.grey[350],
      values: distanceValues,
      min: 1,
      max: 40,
      divisions: 10,
      labels: RangeLabels(
        "${distanceValues.start.round().toString()}km",
        "${distanceValues.end.round().toString()}km",
      ),
      onChanged: (RangeValues values) {
        setState(() {
          distanceValues = values;
        });
      },
    );
  }

  category(categories) {
    return List.generate(categories.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8.0),
        child: InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: selectedIndex == index ? primaryColor : Colors.white),
            child: Center(
                child: Text(
              categories[index],
              style: TextStyle(
                color: selectedIndex == index ? Colors.white : Colors.black,
              ),
            )),
          ),
        ),
      );
    });
  }

  title(String s) {
    return Text(
      s,
      textAlign: TextAlign.start,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
    );
  }
}
