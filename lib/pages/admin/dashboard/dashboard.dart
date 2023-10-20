// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobile_app_boilerplate/pages/login/view/login_page.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});
  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String name_holder = "Admin";
  FirebaseFirestore db = FirebaseFirestore.instance;
  final LocalStorage storage = new LocalStorage('user');

  void initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  void getCredential() {
    final docRef = db.collection("users").doc(storage.getItem('uid'));
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data['first_name']);
        setState(() {
          name_holder = '${data['first_name']} ${data['last_name']}';
        });
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    initializeApp();
    getCredential();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Hello, $name_holder!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const Card(
                  elevation: 5,
                  child: Column(children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Users'),
                      subtitle: Text('24'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(Icons.receipt),
                      title: Text('Users'),
                      subtitle: Text('24'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text('Users'),
                      subtitle: Text('24'),
                    ),
                  ]),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance
                          .signOut()
                          .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              ));
                    },
                    child: Text('Logout'))
              ],
            ),
          )),
    );
  }
}
