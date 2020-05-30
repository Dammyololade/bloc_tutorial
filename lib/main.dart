import 'package:flutter/material.dart';
import 'package:flutterbloctutorial/onboarding/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color(0xff14990A),
        secondaryHeaderColor: Color(0xff107b09),
        accentColor: Color(0xff6cb969),
        primaryColorDark: Color(0xff107b09),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: Colors.white30,
            fontSize: 14,
            fontWeight: FontWeight.w500
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
