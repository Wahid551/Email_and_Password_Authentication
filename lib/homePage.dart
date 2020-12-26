import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            FirebaseAuth.instance
                .signOut()
                .then((value) => {
                      Navigator.pop(context),
                    })
                .catchError((e) {
              print(e);
            });
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
