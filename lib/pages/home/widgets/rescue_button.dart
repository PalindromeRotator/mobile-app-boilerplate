// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:mobile_app_boilerplate/config/palette.dart';

class RescueButton extends StatefulWidget {
  const RescueButton(
      {super.key,
      required this.buttonSize,
      required this.buttonColor,
      required this.buttonText,
      required this.fontSize,
      this.onPressed});
  final double buttonSize;
  final Color buttonColor;
  final String buttonText;
  final double fontSize;
  final VoidCallback? onPressed;
  @override
  State<RescueButton> createState() => _RescueButtonState();
}

class _RescueButtonState extends State<RescueButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.buttonSize,
        height: widget.buttonSize,
        child: Card(
            color: widget.buttonColor,
            elevation: 5,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  widget.buttonColor,
                ),
              ),
              onPressed: widget.onPressed,
              child: Center(
                  child: Text(
                widget.buttonText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: widget.fontSize,
                    color: Palette.secondaryColor),
                textAlign: TextAlign.center,
              )),
            )));
  }
}
