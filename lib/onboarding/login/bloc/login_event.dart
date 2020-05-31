import 'package:super_enum/super_enum.dart';

part 'login_event.g.dart';

/// description:
/// project: flutter_bloc_tutorial
/// @package: onboarding.login.bloc
/// @author: dammyololade
/// created on: 30/05/2020
@superEnum
enum _LoginEvent {

  @Data(fields: [DataField<String>("email"), DataField<String>("password")])
  LoginUser
}