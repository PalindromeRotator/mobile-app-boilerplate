// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_app_boilerplate/app.dart';
import 'package:mobile_app_boilerplate/pages/landing_page/view/view.dart';

void main() {
  runApp(const MyApp());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LandingView(pageName: 'landing_page'),
    );
  }
}
