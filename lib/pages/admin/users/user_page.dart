// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile_app_boilerplate/pages/admin/users/accepted_tab.dart';
import 'package:mobile_app_boilerplate/pages/admin/users/pending_tab.dart';
import 'package:mobile_app_boilerplate/pages/admin/users/rejected_tab.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<Widget> tabList = [PendingTab(), AccpetedTab(), RejectedTab()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Users',
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Color(0xff5808e5),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Pending'),
                Tab(text: 'Accepted'),
                Tab(text: 'Rejected'),
              ],
            ),
          ),
          body: TabBarView(
            children: tabList,
          ),
        ),
      ),
    );
  }
}
