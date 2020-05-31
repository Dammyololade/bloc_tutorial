import 'package:flutter/cupertino.dart';
import 'package:flutterbloctutorial/onboarding/login/login_screen.dart';
import 'package:flutterbloctutorial/ui/HomeScreen.dart';

/// description:
/// project: flutter_bloc_tutorial
/// @package: 
/// @author: dammyololade
/// created on: 30/05/2020
class RouteManager {

  static const String login = "/login";
  static const String home = "/home";

  static Map<String, Widget Function(BuildContext context)> get routes => {
    login: (context) => LoginScreen(),
    home: (context) => HomeScreen(),
  };
}