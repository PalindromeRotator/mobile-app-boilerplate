// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_app_boilerplate/config/palette.dart';

class Textfield extends StatelessWidget {
  const Textfield(
      {super.key,
      this.hintText,
      required this.controller,
      this.prefixIcon,
      this.isPassword});
  final String? hintText;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final bool? isPassword;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: TextFormField(
          obscureText: isPassword ?? false,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText ?? 'Hint',
            prefixIcon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black, // The tint color you want to apply
                BlendMode.srcIn,
              ),
              child: prefixIcon ?? Icon(Icons.abc),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ));
  }
}
