import 'package:firebase_test_api/pages/home_screen.dart';
import 'package:firebase_test_api/pages/login.dart';
import 'package:firebase_test_api/pages/wrapper_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      initialRoute: '/',
      routes: {
        '/':(_)=> const WrapperScreen(),
        '/home':(_)=> const HomeScreen(),
        '/login':(_)=> const Login(),
      },
    );
  }
}

