import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nsc2024/firebase_options.dart';
import 'package:nsc2024/pages/login_page.dart';
import 'package:nsc2024/pages/register_page.dart';
import 'widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const WidgetTree(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage()
      },
    );
  }
}
