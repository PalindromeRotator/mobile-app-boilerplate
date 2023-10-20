// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_boilerplate/config/palette.dart';
import 'package:mobile_app_boilerplate/pages/landing_page/view/view.dart';
import 'package:mobile_app_boilerplate/pages/login/view/login_page.dart';
import 'package:mobile_app_boilerplate/widgets/button/button.dart';
import 'package:mobile_app_boilerplate/widgets/textfield/textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  void initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  void createUserWithEmailAndPassword(
    email,
    password,
    first_name,
    last_name,
    address,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        final user = <String, dynamic>{
          "first_name": first_name,
          "last_name": last_name,
          "email": email,
          "address": address,
          "user_level": 2,
          "status": 0
        };

        db
            .collection("users")
            .doc(value.user?.uid.toString())
            .set(user)
            .onError((e, _) => print("Error writing document: $e"))
            .then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
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
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: Palette.lightColor),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Textfield(
                                    controller: firstNameController,
                                    hintText: 'First name',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Textfield(
                                    controller: lastNameController,
                                    hintText: 'Last name',
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
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    backgroundColor: Palette.secondaryColor,
                                    buttonText: 'Register',
                                    onPressed: () {
                                      createUserWithEmailAndPassword(
                                          emailController.text,
                                          passwordController.text,
                                          firstNameController.text,
                                          lastNameController.text,
                                          addressController.text);
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => LandingView(
                                      //             pageName: "landing_page",
                                      //           )),
                                      // );
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Button(
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    backgroundColor: Palette.secondaryColor,
                                    buttonText:
                                        'Already have an account ? Login',
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                  ),
                                ],
                              )),
                            )))))));
  }
}
