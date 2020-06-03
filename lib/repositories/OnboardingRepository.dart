import 'package:code_brew/code_brew.dart';
import 'package:flutterbloctutorial/AppConfig.dart';
import 'package:flutterbloctutorial/onboarding/login/LoginModel.dart';
import 'package:flutterbloctutorial/onboarding/register/RegisterModel.dart';

/// description: 
/// project: flutter_bloc_tutorial
/// @package: repositories
/// @author: dammyololade
/// created on: 30/05/2020
class OnBoardingRepository {
  
  NetworkUtil networkUtil = NetworkUtil();
  
  Future<LoginModel> loginUser(String email, String password) async{
    Map<String, dynamic> params = {
      "email": email,
      "password": password
    };
    try {
      var response = await networkUtil.connectApi(AppConfig.LOGIN, RequestMethod.post,
        data: params);
      return LoginModel.fromJson(response.data);
    } on ApiError catch(error) {
      return Future.error(error);
    }
  }

  Future<RegisterModel> registerUser(String email, String password, String firstName, String lastName) async {
    Map<String, dynamic> params = {
      "email": email,
      "password": password,
      "firstname" : firstName,
      "lastName" : lastName
    };
    try {
      var response = await networkUtil.connectApi(AppConfig.REGISTER, RequestMethod.post,
          data: params);
      return RegisterModel.fromJson(response.data);
    } on ApiError catch(error) {
      return Future.error(error);
    }
  }
}