// ignore_for_file: sized_box_for_whitespace, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.backgroundColor,
      required this.buttonText,
      this.height,
      this.width,
      this.onPressed});
  final Color backgroundColor;
  final String buttonText;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * .5,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        ),
      ),
    );
  }
}
