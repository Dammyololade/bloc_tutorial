import 'package:flutter/material.dart';
import 'package:code_brew/code_brew.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctutorial/onboarding/login/bloc/LoginBloc.dart';
import 'package:flutterbloctutorial/onboarding/login/bloc/login_state.dart';
import 'package:flutterbloctutorial/onboarding/login/bloc/login_event.dart';

/// description:
/// project: flutter_bloc_tutorial
/// @package: onboarding
/// @author: dammyololade
/// created on: 30/05/2020

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with UiKits {
  LoginBloc loginBloc;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    loginBloc.context = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state is LoginError) {
            scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Text("${state.errorMessage}")));
          }
          if(state is Success) {
            scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Text("Logged in successfully")));
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "B",
                      style: TextStyle(
                          fontSize: 100,
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "BLOC TUTORIAL",
                      style: TextStyle(
                          fontSize: 20,
                          //color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Height(50),
              Text(
                "ACCOUNT LOGIN",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Height(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: UITextFormField(
                        controller: _emailController,
                        hint: "Email",
                        hintColor: Colors.white,
                        border: Border(),
                      ),
                    ),
                    Height(20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: UITextFormField(
                        controller: _passwordController,
                        hint: "Password",
                        hintColor: Colors.white,
                        border: Border(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white54),
                          )
                        ],
                      ),
                    ),
                    Height(15),
                    BlocBuilder<LoginBloc, LoginState>(
                      bloc: loginBloc,
                      builder: (BuildContext context, LoginState state) {
                        if (state is LoginError) {
                          return SizedBox();
                        }
                        if (state is Processing) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return RaisedButton(
                          onPressed: () {
                            loginBloc.add(LoginEvent.loginUser(
                                email: _emailController.text,
                                password: _passwordController.text));
                          },
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 70),
                          child: Text("LOGIN",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColorDark)),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text("New User? Register",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white70)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
