import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signup extends StatefulWidget {
  @override
  __signupState createState() => __signupState();
}

class __signupState extends State<signup> {
  final auth = FirebaseAuth.instance;
  final firestore = Firestore.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              onPressed: () {
                auth
                    .createUserWithEmailAndPassword(
                        email: email, password: password)
                    .then((signedInUser) {
                  firestore.collection('users').add(
                      {'email': email, 'password': password}).then((value) {
                    if (signedInUser != null) {
                      Navigator.pushNamed(context, '/homepahe');
                    }
                  }).catchError((e) {
                    print(e);
                  });
                }).catchError((e) {
                  print(e);
                });
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
