// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mobile_app_boilerplate/config/palette.dart';
import 'package:mobile_app_boilerplate/pages/home/home.dart';
import 'package:mobile_app_boilerplate/pages/landing_page/view/view.dart';
import 'package:mobile_app_boilerplate/widgets/button/button.dart';
import 'package:mobile_app_boilerplate/widgets/textfield/textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Container(
        color: Palette.secondaryColor,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login to your account',
                    style: TextStyle(fontSize: 32, color: Palette.lightColor),
                  ),
                  SizedBox(
                    height: 30,
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
                    prefixIcon: Icon(Icons.password),
                    controller: passwordController,
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Button(
                    width: MediaQuery.of(context).size.width * .8,
                    backgroundColor: Palette.primaryColor,
                    buttonText: 'Login',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                  ),
                ],
              )),
            )));
  }
}
