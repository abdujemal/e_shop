import 'package:e_shop/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function onTap;
  final Widget trailing;
  final Widget leading;
  final String text;
  final Color btnColor, textColor;
  CustomButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.textColor = Colors.white,
      this.btnColor = primaryColor,
      this.trailing = const SizedBox(),
      this.leading = const SizedBox()})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () => widget.onTap(),
      child: Ink(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: widget.btnColor, borderRadius: BorderRadius.circular(50)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: widget.leading,
              ),
              Text(
                widget.text,
                style:  TextStyle(
                  fontSize: 17,
                    color: widget.textColor, 
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: widget.trailing,
              )
            ]),
      ),
    );
  }
}
