import 'package:super_enum/super_enum.dart';

part 'register_event.g.dart';


@superEnum
enum _RegisterEvent {

@Data(fields: [DataField<String>("firstName"), DataField<String>("lastName"),
  DataField<String>("email"), DataField("password")
])
RegisterUser
}