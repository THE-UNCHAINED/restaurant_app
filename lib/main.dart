import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/auth_wrapper.dart';
import 'package:restaurant_app/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant_app/firebase_options.dart';
import 'package:restaurant_app/screens/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AuthWrapper());
  }
}
