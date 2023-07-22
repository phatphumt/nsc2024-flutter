import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nsc2024/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          user?.email ?? 'email',
          style: const TextStyle(fontFamily: 'VarelaRound'),
        ),
        backgroundColor: const Color.fromARGB(255, 83, 66, 76),
      ),
      body: Container(
        color: const Color.fromARGB(106, 255, 255, 255),
        child: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "hi, user",
                style: TextStyle(fontFamily: 'VarelaRound', fontSize: 30),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: signOut,
        child: const Icon(Icons.arrow_back_rounded),
      ),
    );
  }
}
