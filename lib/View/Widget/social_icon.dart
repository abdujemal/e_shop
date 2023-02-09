import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SocialIcon extends StatefulWidget {
  IconData icon;
  Function onTap;
  Color iconColor;
  SocialIcon({Key? key, required this.icon, required this.onTap, this.iconColor = Colors.black})
      : super(key: key);

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> widget.onTap(),
      child: Card(
        shape: CircleBorder(),
        color: Colors.white,
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(4),
            child: Icon(
              widget.icon,
              size: 50,
              color: widget.iconColor,
            )),
      ),
    );
  }
}
