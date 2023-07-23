// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mobile_app_boilerplate/config/palette.dart';
import 'package:mobile_app_boilerplate/pages/landing_page/view/view.dart';
import 'package:mobile_app_boilerplate/widgets/button/button.dart';
import 'package:mobile_app_boilerplate/widgets/textfield/textfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Container(
        color: Palette.primaryColor,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign up your details',
                    style: TextStyle(fontSize: 32, color: Palette.lightColor),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Textfield(
                    controller: fullNameController,
                    hintText: 'Full name',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Textfield(
                    prefixIcon: Icon(Icons.email),
                    controller: emailController,
                    hintText: 'Email address',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Textfield(
                    prefixIcon: Icon(Icons.location_on),
                    controller: addressController,
                    hintText: 'Address',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Textfield(
                    prefixIcon: Icon(Icons.password),
                    controller: passwordController,
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Textfield(
                    prefixIcon: Icon(Icons.password),
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Button(
                    width: MediaQuery.of(context).size.width * .8,
                    backgroundColor: Palette.secondaryColor,
                    buttonText: 'Register',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LandingView(
                                  pageName: "landing_page",
                                )),
                      );
                    },
                  ),
                ],
              )),
            )));
  }
}
