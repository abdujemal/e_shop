import 'package:e_shop/constants.dart';
import 'package:e_shop/data/models/menu_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;
  final bool isActive;
  final Function onTap;
  const MenuCard(
      {super.key,
      required this.menu,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(),
      leading: Container(
          decoration: BoxDecoration(
              color: primaryColor.withAlpha(50),
              borderRadius: BorderRadius.circular(9)),
          padding: const EdgeInsets.all(5),
          child: Icon(menu.icon, color: primaryColor,)),
      title: Text(
        menu.name,
        style: TextStyle(fontWeight: isActive ? FontWeight.bold : null),
      ),
    );
  }
}
