// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile_app_boilerplate/domain/pages/pages.dart';
import 'package:mobile_app_boilerplate/pages/login/view/login_page.dart';

List<Pages> dataList = [Pages('login_page', LoginPage())];

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.pageName});
  final String pageName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: searchWidgetByName(pageName));
  }

  Widget searchWidgetByName(String searchName) {
    List<Pages> searchResults =
        dataList.where((person) => person.name == searchName).toList();

    if (searchResults.isNotEmpty) {
      // The search found matching person(s)
      return searchResults[0].widget;
    } else {
      // No matching person found
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('No Result for that widget'),
          ],
        ),
      );
    }
  }
}
