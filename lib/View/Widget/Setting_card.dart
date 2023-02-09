import 'package:e_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final Widget trailing;
  const SettingCard(
      {Key? key,
      required this.icon,
      required this.title,
      this.trailing = const Icon(Icons.keyboard_arrow_right)})
      : super(key: key);

  @override
  State<SettingCard> createState() => _SettingCardState();
}

class _SettingCardState extends State<SettingCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          decoration: BoxDecoration(
              color: primaryColor.withAlpha(50),
              borderRadius: BorderRadius.circular(9)),
          padding: const EdgeInsets.all(5),
          child: Icon(
            widget.icon,
            color: primaryColor,
          )),
      trailing: widget.trailing,
      title: Text(widget.title),
    );
  }
}
