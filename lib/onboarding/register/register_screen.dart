import 'package:flutter/material.dart';
import 'package:code_brew/code_brew.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctutorial/onboarding/register/bloc/RegisterBloc.dart';
import 'package:flutterbloctutorial/onboarding/register/bloc/register_event.dart';
import 'package:flutterbloctutorial/onboarding/register/bloc/register_state.dart';

class registerScreen extends StatefulWidget {
  @override
  _registerScreenState createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  RegisterBloc registerBloc;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var _email = TextEditingController();
  var _password = TextEditingController();
  var _firstName = TextEditingController();
  var _lastName = TextEditingController();

  @override
  void initState() {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    registerBloc.context = context;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (BuildContext context, RegisterState state) {
          if (state is RegisterError) {
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
              SizedBox(height: 50,),
              Text(
                "REGISTRATION DETAILS",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50,),
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
                        controller: _firstName,
                        hint: "First Name",
                        hintColor: Colors.white,
                        border: Border(),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: UITextFormField(
                        controller: _lastName,
                        hint: "Last name",
                        hintColor: Colors.white,
                        border: Border(),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: UITextFormField(
                        controller: _email,
                        hint: "Email",
                        hintColor: Colors.white,
                        border: Border(),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: UITextFormField(
                        controller: _password,
                        hint: "Password",
                        hintColor: Colors.white,
                        border: Border(),
                      ),
                    ),
                    SizedBox(height: 15,),
                    BlocBuilder<RegisterBloc, RegisterState>(
                      bloc: registerBloc,
                      builder: (BuildContext context, RegisterState state) {
                        if (state is RegisterError) {
                          return SizedBox();
                        }
                        if (state is Processing) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return RaisedButton(
                          onPressed: () {
                            registerBloc.add(RegisterEvent.registerUser(
                                firstName: _firstName.text,
                                lastName: _lastName.text,
                                email: _email.text,
                                password: _password.text));
                          },
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 70),
                          child: Text("REGISTER",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColorDark)),
                        );
                      },
                    ),
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

