import 'package:flutter/material.dart';

class RejectedRecordTab extends StatefulWidget {
  const RejectedRecordTab({super.key});

  @override
  State<RejectedRecordTab> createState() => _RejectedRecordTabState();
}

class _RejectedRecordTabState extends State<RejectedRecordTab> {
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
