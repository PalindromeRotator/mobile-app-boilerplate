// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_app_boilerplate/config/palette.dart';
import 'package:mobile_app_boilerplate/pages/home/view/view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF176B87),
        selectedItemColor: Palette.lightColor,
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return HomeView(pageName: "home_page");
      case 1:
        return HomeView(pageName: "favorite_contact_page");
      case 2:
        return HomeView(pageName: "user_page");
      default:
        return Center(child: Text('Error: Unknown Page'));
    }
  }
}
