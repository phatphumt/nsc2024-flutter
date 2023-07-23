import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nsc2024/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? errorMsg = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword =
      TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    if (_controllerPassword.text != _controllerConfirmPassword.text) {
      setState(() => errorMsg = 'Password doesn\'t match');
      return;
    } else {
      try {
        await Auth().createUserWithEmailAndPassword(
            email: _controllerEmail.text, password: _controllerPassword.text);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        setState(() {
          errorMsg = e.message;
        });
      }
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
        onPressed: createUserWithEmailAndPassword,
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: _inputField(
                  'Confrim Password',
                  _controllerConfirmPassword,
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
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Login",
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
