import 'package:flutter/material.dart';

class RejectedTab extends StatefulWidget {
  const RejectedTab({super.key});

  @override
  State<RejectedTab> createState() => _RejectedTabState();
}

class _RejectedTabState extends State<RejectedTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Center(
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
    ));
  }
}
