// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobile_app_boilerplate/pages/admin/dashboard/dashboard.dart';
import 'package:mobile_app_boilerplate/pages/admin/list-of-record/list_of_record.dart';
import 'package:mobile_app_boilerplate/pages/admin/medical-tutorial/medical_tutorial.dart';
import 'package:mobile_app_boilerplate/pages/admin/users/user_page.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int selectedIndex = 0;
  List<Widget> pageList = [
    AdminDashboard(),
    UserPage(),
    ListOfRecord(),
    MedicalTutorial()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: pageList[selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: selectedIndex,
          onTap: (value) {
            // Respond to item press.
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Dashboard',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Users',
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              label: 'Records',
              icon: Icon(Icons.receipt),
            ),
            BottomNavigationBarItem(
              label: 'Tutorials',
              icon: Icon(Icons.book),
            ),
          ],
        ));
  }
}
