import 'package:e_shop/constants.dart';
import 'package:flutter/material.dart';

class InputLayout extends StatefulWidget {
  TextEditingController controller;
  IconData leadingIcon;
  TextInputType type;
  bool isObscure;
  String title;
  String? Function(String? v)? validation;

  InputLayout(
      {Key? key,
      required this.title,
      required this.controller,
      required this.type,
      required this.leadingIcon,
      this.validation,
      this.isObscure = false})
      : super(key: key);

  @override
  State<InputLayout> createState() => _InputLayoutState();
}

class _InputLayoutState extends State<InputLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(.16),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(14),
            child: Icon(
              widget.leadingIcon,
              color: primaryColor,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextFormField(
              validator: widget.validation ??
                  (value) {
                    if(value!.isEmpty){
                      return "This field is required";
                    }
                  },
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                fontSize: 14,
                height: 2,
              ),
              controller: widget.controller,
              obscureText: widget.isObscure,
              keyboardType: widget.type,
              decoration: InputDecoration.collapsed(hintText: widget.title),
          ))
        ],
      ),
    );
  }
}
