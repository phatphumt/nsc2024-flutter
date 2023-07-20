import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.arrow_forward),
      ),
      body: Container(
        color: const Color.fromARGB(106, 255, 255, 255),
        child: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'VarelaRound',
                      color: Color.fromARGB(255, 61, 66, 103)),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: SizedBox(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 44, 19, 64),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 44, 19, 64),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        size: 20,
                        color: Color.fromARGB(255, 44, 19, 64),
                      ),
                    ),
                    style: TextStyle(fontFamily: 'VarelaRound'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: SizedBox(
                  width: 250,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 44, 19, 64),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 44, 19, 64),
                      ),
                      prefixIcon: Icon(
                        Icons.password,
                        size: 20,
                        color: Color.fromARGB(255, 44, 19, 64),
                      ),
                    ),
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
