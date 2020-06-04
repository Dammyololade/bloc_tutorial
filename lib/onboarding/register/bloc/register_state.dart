import 'package:flutterbloctutorial/onboarding/register/RegisterModel.dart';
import 'package:super_enum/super_enum.dart';

part 'register_state.g.dart';

@superEnum
enum _RegisterState {
 @object
 Initial,
 @object
 Processing,

 @Data(fields: [DataField<RegisterModel>("model")])
 Success,

 @Data(fields: [DataField<String>("errorMessage")])
 RegisterError
}