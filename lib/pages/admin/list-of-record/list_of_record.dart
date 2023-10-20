// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile_app_boilerplate/pages/admin/list-of-record/accepted_record_tab.dart';
import 'package:mobile_app_boilerplate/pages/admin/list-of-record/rejected_record_tab.dart';

class ListOfRecord extends StatefulWidget {
  const ListOfRecord({super.key});

  @override
  State<ListOfRecord> createState() => _ListOfRecordState();
}

class _ListOfRecordState extends State<ListOfRecord> {
  List<Widget> tabList = [AcceptedRecordTab(), RejectedRecordTab()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'List of Records',
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Color(0xff5808e5),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
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
