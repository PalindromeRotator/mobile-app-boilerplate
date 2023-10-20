import 'package:flutter/material.dart';

class AcceptedRecordTab extends StatefulWidget {
  const AcceptedRecordTab({super.key});

  @override
  State<AcceptedRecordTab> createState() => _AcceptedRecordTabState();
}

class _AcceptedRecordTabState extends State<AcceptedRecordTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: const [
          ListTile(
            title: Text('Primary text'),
            leading: Icon(Icons.person),
            trailing: IconButton(
                onPressed: null, icon: Icon(Icons.arrow_circle_right)),
          ),
        ],
      ),
    );
  }
}
