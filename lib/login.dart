import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class create extends StatefulWidget {
  @override
  _createState createState() => _createState();
}

class _createState extends State<create> {
  @override
  final auth = FirebaseAuth.instance;
  final firestore = Firestore.instance;
  String email;
  String password;
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
                    .signInWithEmailAndPassword(
                        email: email, password: password)
                    .then((value) => {
                          Navigator.pushNamed(context, '/homepahe'),
                        })
                    .catchError((e) {
                  print(e);
                });
              },
              child: Text('Login'),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('SignUp'),
            ),
          ],
        ),
      ),
    );
  }
}
