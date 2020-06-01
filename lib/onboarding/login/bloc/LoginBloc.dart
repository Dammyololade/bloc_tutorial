import 'package:code_brew/code_brew.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctutorial/RouteManager.dart';
import 'package:flutterbloctutorial/onboarding/login/bloc/login_state.dart';
import 'package:flutterbloctutorial/onboarding/login/bloc/login_event.dart';
import 'package:flutterbloctutorial/repositories/OnboardingRepository.dart';

/// description:
/// project: flutter_bloc_tutorial
/// @package: onboarding.login.bloc
/// @author: dammyololade
/// created on: 30/05/2020
class LoginBloc extends Bloc<LoginEvent, LoginState> {

  OnBoardingRepository repository = OnBoardingRepository();
  BuildContext context;

  LoginBloc(this.context);

  @override
  LoginState get initialState => LoginState.initial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async*{
    yield* event.when(
        loginUser: (event) => mapToLoginUser(event.email, event.password)
    );
  }

  Stream<LoginState> mapToLoginUser(String email, String password) async*{
    yield LoginState.processing();
    try {
      var response = await repository.loginUser(email, password);
      //Navigator.of(context).pushReplacementNamed(RouteManager.home);
      yield LoginState.success(model: response);
    } catch(error) {
      if(error is ApiError) {
        yield LoginState.loginError(errorMessage: error.errorDescription);
      }
      yield LoginState.loginError(errorMessage: error.toString());
    }
  }
}