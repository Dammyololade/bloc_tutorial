import 'package:code_brew/code_brew.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctutorial/RouteManager.dart';
import 'package:flutterbloctutorial/onboarding/login/bloc/LoginBloc.dart';
import 'package:flutterbloctutorial/onboarding/login/login_screen.dart';
import 'package:flutterbloctutorial/onboarding/register/bloc/RegisterBloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CBSessionManager().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ct) => LoginBloc(context)),
        BlocProvider(create: (ct) => RegisterBloc(context)),
      ],
      child: MaterialApp(
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
        routes: RouteManager.routes,
        initialRoute: RouteManager.dashboard,
      ),
    );
  }
}
