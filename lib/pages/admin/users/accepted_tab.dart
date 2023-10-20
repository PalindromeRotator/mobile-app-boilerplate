import 'package:flutter/material.dart';

class AccpetedTab extends StatefulWidget {
  const AccpetedTab({super.key});

  @override
  State<AccpetedTab> createState() => _AccpetedTabState();
}

class _AccpetedTabState extends State<AccpetedTab> {
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
