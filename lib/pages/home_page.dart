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
    const String mainFont = 'VarelaRound';
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_add),
            label: 'Trips',
          )
        ],
        currentIndex: 0,
        elevation: 0,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        backgroundColor: const Color.fromARGB(255, 83, 66, 76),
        unselectedItemColor: Color.fromARGB(255, 206, 205, 205),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Welcome!',
          style: TextStyle(fontFamily: mainFont, fontSize: 28),
        ),
        backgroundColor: const Color.fromARGB(255, 83, 66, 76),
      ),
      body: Container(
        color: Color.fromARGB(106, 255, 255, 255),
        child: const Padding(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CardExplore(
                mainFont: mainFont,
                icon: Icon(
                  Icons.assignment_add,
                  size: 40,
                ),
                text: 'Create a Trip',
              ),
              CardExplore(
                mainFont: mainFont,
                icon: Icon(
                  Icons.assignment_add,
                  size: 40,
                ),
                text: 'My Diaries',
              )
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

class CardExplore extends StatelessWidget {
  const CardExplore(
      {super.key,
      required this.mainFont,
      required this.icon,
      required this.text});

  final String mainFont;
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: const Color.fromARGB(60, 55, 71, 79),
        onTap: () => debugPrint('Card $text tapped'),
        child: SizedBox(
          width: 130,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(fontFamily: mainFont, fontSize: 17),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
