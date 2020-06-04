// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class RegisterEvent extends Equatable {
  const RegisterEvent(this._type);

  factory RegisterEvent.registerUser(
      {@required String firstName,
      @required String lastName,
      @required String email,
      @required dynamic password}) = RegisterUser;

  final _RegisterEvent _type;

//ignore: missing_return
  R when<R>({@required FutureOr<R> Function(RegisterUser) registerUser}) {
    assert(() {
      if (registerUser == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _RegisterEvent.RegisterUser:
        return registerUser(this as RegisterUser);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(RegisterUser) registerUser,
      @required FutureOr<R> Function(RegisterEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _RegisterEvent.RegisterUser:
        if (registerUser == null) break;
        return registerUser(this as RegisterUser);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(RegisterUser) registerUser}) {
    assert(() {
      if (registerUser == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _RegisterEvent.RegisterUser:
        if (registerUser == null) break;
        return registerUser(this as RegisterUser);
    }
  }

  @override
  List get props => const [];
}

@immutable
class RegisterUser extends RegisterEvent {
  const RegisterUser(
      {@required this.firstName,
      @required this.lastName,
      @required this.email,
      @required this.password})
      : super(_RegisterEvent.RegisterUser);

  final String firstName;

  final String lastName;

  final String email;

  final dynamic password;

  @override
  String toString() =>
      'RegisterUser(firstName:${this.firstName},lastName:${this.lastName},email:${this.email},password:${this.password})';
  @override
  List get props => [firstName, lastName, email, password];
}
