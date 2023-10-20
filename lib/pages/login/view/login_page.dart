// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, non_constant_identifier_names

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobile_app_boilerplate/config/palette.dart';
import 'package:mobile_app_boilerplate/pages/admin/home.dart';
import 'package:mobile_app_boilerplate/pages/home/home.dart';
import 'package:mobile_app_boilerplate/pages/landing_page/view/view.dart';
import 'package:mobile_app_boilerplate/pages/sign_up/view/sign_up_page.dart';
import 'package:mobile_app_boilerplate/widgets/button/button.dart';
import 'package:mobile_app_boilerplate/widgets/textfield/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final LocalStorage storage = LocalStorage('user');
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool pendingFlag = false;
  void initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  void loginUsingEmailAndPassword(email, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        storage.setItem('uid', value.user?.uid);
        final docRef = db.collection("users").doc(value.user?.uid);
        docRef.get().then(
          (DocumentSnapshot doc) {
            final data = doc.data() as Map<String, dynamic>;
            if (data['user_level'] == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminHomePage()),
              );
            } else if (data['user_level'] == 2) {
              if (data['status'] == 0) {
                setState(() {
                  pendingFlag = true;
                });

                FirebaseAuth.instance.signOut();
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }
            }
            // ...
          },
          onError: (e) => print("Error getting document: $e"),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
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
                        // color: Palette.secondaryColor,
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
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: Palette.lightColor),
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
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    backgroundColor: Palette.primaryColor,
                                    buttonText: 'Login',
                                    onPressed: () {
                                      loginUsingEmailAndPassword(
                                          emailController.text,
                                          passwordController.text);
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Button(
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    backgroundColor: Palette.primaryColor,
                                    buttonText:
                                        'Don\'t have an account? Register',
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpPage()),
                                    ),
                                  ),
                                  Visibility(
                                    child: AlertDialog(
                                      title: Text(''),
                                      content: Text(
                                          'Registration Submitted. Wait for 1 to 3 consecutive days for you account approval.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              pendingFlag = false;
                                            });
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    ),
                                    visible: pendingFlag,
                                  )
                                ],
                              )),
                            )))))));
  }
}
