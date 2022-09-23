import 'package:flutter/material.dart';
import 'package:my_mob_proj/schedulePage.dart';
import 'homePage.dart';
import 'loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      title: 'Home Task 1',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>  LoginScreen(),
        '/home': (context) =>  HomePage(),
        '/schedule': (context) =>  schedulePage(),
      },
    );
  }
}