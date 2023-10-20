// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MedicalTutorial extends StatefulWidget {
  const MedicalTutorial({super.key});

  @override
  State<MedicalTutorial> createState() => _MedicalTutorialState();
}

class _MedicalTutorialState extends State<MedicalTutorial> {
  List<Widget> tabList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: const [
            ListTile(
              title: Text('Primary text'),
              leading: Icon(Icons.person),
              trailing: IconButton(onPressed: null, icon: Icon(Icons.edit)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define the action to be performed when the FAB is pressed.
          // For example, you can navigate to a different screen or perform some other action.
        },
        child: Icon(Icons.add), // Icon for the FAB
        // You can customize the FAB with additional properties like backgroundColor, tooltip, heroTag, etc.
      ),
    );
  }
}
