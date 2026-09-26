import 'package:chat_app_final/screens/LogingScreen.dart';
import 'package:chat_app_final/screens/chat_screen.dart';
import 'package:chat_app_final/screens/regestretion_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SholarApp());
}

class SholarApp extends StatelessWidget {
  const SholarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'LogingPage': (context) =>
            Logingscreen(), // here we have to methode to acces to the pages
        'Sign Up': (context) => RegestretionPage(),
        ChatScreen.id: (context) => ChatScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'LogingPage', //bidaya hiya saf7a hadi
    );
  }
}
