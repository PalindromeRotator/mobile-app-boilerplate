// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_app_boilerplate/config/constants.dart';
import 'package:mobile_app_boilerplate/config/palette.dart';
import 'package:mobile_app_boilerplate/pages/login/view/view.dart';
import 'package:mobile_app_boilerplate/pages/sign_up/view/view.dart';
import 'package:mobile_app_boilerplate/widgets/button/button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background.png'), // Replace with your image asset path
            fit: BoxFit.cover, // You can adjust the fit as needed
          ),
        ),
        child: Center(
            child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 5, sigmaY: 5), // Adjust the blur intensity
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            'assets/logo.png',
                            width: 150,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            Constants.appNameInitials,
                            style: TextStyle(
                                fontSize: 32, color: Palette.lightColor),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            Constants.appName,
                            style: TextStyle(
                                fontSize: 16, color: Palette.lightColor),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Button(
                            backgroundColor: Palette.tertiaryColor,
                            buttonText: 'Login',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginView(
                                          pageName: "login_page",
                                        )),
                              );
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Button(
                            backgroundColor: Palette.primaryColor,
                            buttonText: 'Register',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpView(
                                          pageName: "sign_up_page",
                                        )),
                              );
                            },
                          ),
                        ],
                      ),
                    )))));
  }
}
