// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class PendingTab extends StatefulWidget {
  const PendingTab({super.key});

  @override
  State<PendingTab> createState() => _PendingTabState();
}

class _PendingTabState extends State<PendingTab> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final LocalStorage storage = LocalStorage('user');
  List<Map<String, dynamic>> userList = [];
  void initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  void getUserList() async {
    db.collection("users").where("status", isEqualTo: 0).get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          setState(() {
            userList.add(docSnapshot.data());
          });
          // print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    initializeApp();
    getUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Center(
      child: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
                '${userList[index]['first_name']} ${userList[index]['last_name']}'),
            subtitle: Text(userList[index]['email']),
            leading: Icon(Icons.person),
            trailing: IconButton(
                onPressed: null, icon: Icon(Icons.arrow_circle_right)),
          );
        },
        // children: const [
        //   ListTile(
        //     title: Text('Primary text'),
        //     leading: Icon(Icons.person),
        //     trailing: IconButton(
        //         onPressed: null, icon: Icon(Icons.arrow_circle_right)),
        //   ),
        //   // ListTile(
        //   //   title: Text('Primary text'),
        //   //   leading: Icon(Icons.person),
        //   //   trailing: IconButton(
        //   //       onPressed: null, icon: Icon(Icons.arrow_circle_right)),
        //   // ),
        //   // ListTile(
        //   //   title: Text('Primary text'),
        //   //   leading: Icon(Icons.person),
        //   //   trailing: IconButton(
        //   //       onPressed: null, icon: Icon(Icons.arrow_circle_right)),
        //   // ),
        //   // ListTile(
        //   //   title: Text('Primary text'),
        //   //   leading: Icon(Icons.person),
        //   //   trailing: IconButton(
        //   //       onPressed: null, icon: Icon(Icons.arrow_circle_right)),
        //   // ),
        // ],
      ),
    ));
  }
}
