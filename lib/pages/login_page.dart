import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nsc2024/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMsg = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMsg = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMsg = e.message;
      });
    }
  }

  Widget _inputField(String title, TextEditingController controller,
      bool hideText, Icon icon) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        obscureText: hideText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 44, 19, 64),
              ),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            labelText: title,
            labelStyle: const TextStyle(
              color: Color.fromARGB(255, 44, 19, 64),
            ),
            prefixIcon: icon),
        style: const TextStyle(fontFamily: 'VarelaRound'),
      ),
    );
  }

  Widget _errorMsg() {
    return Text(
      errorMsg == '' ? '' : "$errorMsg",
      style: TextStyle(
          fontFamily: 'VarelaRound', color: Colors.red[900], fontSize: 10),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: signInWithEmailAndPassword,
        child: const Icon(Icons.arrow_forward),
      ),
      body: Container(
        color: const Color.fromARGB(106, 255, 255, 255),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Welcome!",
                style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'VarelaRound',
                    color: Color.fromARGB(255, 61, 66, 103)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: _errorMsg(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: _inputField(
                  'Email',
                  _controllerEmail,
                  false,
                  const Icon(
                    Icons.email,
                    size: 20,
                    color: Color.fromARGB(255, 44, 19, 64),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: _inputField(
                  'Password',
                  _controllerPassword,
                  true,
                  const Icon(
                    Icons.password,
                    size: 20,
                    color: Color.fromARGB(255, 44, 19, 64),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: createUserWithEmailAndPassword,
                  child: const Text(
                    "Register",
                    style: TextStyle(fontFamily: 'VarelaRound'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
