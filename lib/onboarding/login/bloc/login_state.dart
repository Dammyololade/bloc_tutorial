import 'package:flutterbloctutorial/onboarding/login/LoginModel.dart';
import 'package:super_enum/super_enum.dart';

part 'login_state.g.dart';

/// description:
/// project: flutter_bloc_tutorial
/// @package: onboarding.login.bloc
/// @author: dammyololade
/// created on: 30/05/2020
@superEnum
enum _LoginState {
  @object
  Initial,
  @object
  Processing,

  @Data(fields: [DataField<LoginModel>("model")])
  Success,

  @Data(fields: [DataField<String>("errorMessage")])
  LoginError
}