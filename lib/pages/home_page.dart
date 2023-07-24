import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nsc2024/auth.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        unselectedItemColor: const Color.fromARGB(255, 206, 205, 205),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Welcome!',
          style: TextStyle(fontFamily: mainFont, fontSize: 28),
        ),
        backgroundColor: const Color.fromARGB(255, 83, 66, 76),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: Container(
        color: const Color.fromRGBO(229, 225, 255, 1),
        child: const Padding(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BigText(mainFont: mainFont, text: 'Get Started'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CardExplore(
                    mainFont: mainFont,
                    icon: Icon(
                      Icons.assignment_add,
                      size: 40,
                      color: Colors.white,
                    ),
                    text: 'Create a Trip',
                  ),
                  CardExplore(
                    mainFont: mainFont,
                    icon: Icon(
                      Icons.book_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                    text: 'My Diaries',
                  )
                ],
              ),
              BigText(mainFont: mainFont, text: 'Featured Trips'),
              CardFeatured(
                mainFont: mainFont,
                icon: Icon(
                  Icons.assignment,
                  size: 50,
                  color: Colors.white,
                ),
                text: 'My Trip',
                altText: '3 days',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BigText extends StatelessWidget {
  const BigText({super.key, required this.mainFont, required this.text});

  final String mainFont;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: mainFont,
          fontSize: 25,
          color: const Color.fromRGBO(64, 19, 51, 1),
        ),
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
        child: Container(
          color: const Color.fromARGB(255, 83, 66, 76),
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
                    style: TextStyle(
                        fontFamily: mainFont,
                        fontSize: 17,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardFeatured extends StatelessWidget {
  const CardFeatured(
      {super.key,
      required this.mainFont,
      required this.icon,
      required this.text,
      required this.altText});

  final String mainFont;
  final Icon icon;
  final String text;
  final String altText;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.white,
        onTap: () => debugPrint('Card $text tapped'),
        child: Container(
          color: const Color.fromARGB(255, 83, 66, 76),
          child: SizedBox(
            width: 200,
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              text,
                              style: TextStyle(
                                  fontFamily: mainFont,
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                altText,
                                style: TextStyle(
                                    fontFamily: mainFont,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
