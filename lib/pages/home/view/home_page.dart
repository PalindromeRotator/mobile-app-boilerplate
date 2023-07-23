// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile_app_boilerplate/config/palette.dart';
import 'package:mobile_app_boilerplate/pages/home/widgets/rescue_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Quick Action'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Quick Call'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Perform the action you want when the second button is pressed
              },
              child: Text('Browse Nearby Responders'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Palette.secondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Welcome to Bagong Polomolok Rescue Application',
            style: TextStyle(color: Palette.lightColor, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RescueButton(
                buttonSize: 150,
                buttonColor: Palette.tertiaryColor,
                buttonText: 'Medical',
                fontSize: 20,
                onPressed: () {
                  _showAlertDialog(context);
                },
              ),
              RescueButton(
                buttonSize: 150,
                buttonColor: Palette.tertiaryColor,
                buttonText: 'Fire',
                fontSize: 20,
                onPressed: () {
                  _showAlertDialog(context);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RescueButton(
                buttonSize: 150,
                buttonColor: Palette.tertiaryColor,
                buttonText: 'Police',
                fontSize: 20,
                onPressed: () {
                  _showAlertDialog(context);
                },
              ),
              RescueButton(
                buttonSize: 150,
                buttonColor: Palette.tertiaryColor,
                buttonText: 'Natural Disaster',
                fontSize: 20,
                onPressed: () {
                  _showAlertDialog(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
