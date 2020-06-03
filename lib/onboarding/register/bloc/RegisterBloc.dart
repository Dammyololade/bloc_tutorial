import 'package:code_brew/code_brew.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctutorial/onboarding/register/bloc/register_state.dart';
import 'package:flutterbloctutorial/onboarding/register/bloc/register_event.dart';
import 'package:flutterbloctutorial/repositories/OnboardingRepository.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  OnBoardingRepository repository = OnBoardingRepository();
  BuildContext context;

  RegisterBloc(this.context);

  @override
  RegisterState get initialState => RegisterState.initial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async*{
    yield* event.when(
        registerUser: (event) => mapToRegisterUser(event.email, event.password, event.firstName, event.lastName )
    );
  }

  Stream<RegisterState> mapToRegisterUser(String email, String password, String firstName, String lastName) async*{
    yield RegisterState.processing();
    try {
      var response = await repository.registerUser(email, password, firstName, lastName);
      //Navigator.of(context).pushReplacementNamed(RouteManager.home);
      yield RegisterState.success(model: response);
    } catch(error) {
      if(error is ApiError) {
        yield RegisterState.registerError(errorMessage: error.errorDescription);
      }
      yield RegisterState.registerError(errorMessage: error.toString());
    }
  }
}