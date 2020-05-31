// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent(this._type);

  factory LoginEvent.loginUser(
      {@required String email, @required String password}) = LoginUser;

  final _LoginEvent _type;

//ignore: missing_return
  R when<R>({@required FutureOr<R> Function(LoginUser) loginUser}) {
    assert(() {
      if (loginUser == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginEvent.LoginUser:
        return loginUser(this as LoginUser);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(LoginUser) loginUser,
      @required FutureOr<R> Function(LoginEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginEvent.LoginUser:
        if (loginUser == null) break;
        return loginUser(this as LoginUser);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial({FutureOr<void> Function(LoginUser) loginUser}) {
    assert(() {
      if (loginUser == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginEvent.LoginUser:
        if (loginUser == null) break;
        return loginUser(this as LoginUser);
    }
  }

  @override
  List get props => const [];
}

@immutable
class LoginUser extends LoginEvent {
  const LoginUser({@required this.email, @required this.password})
      : super(_LoginEvent.LoginUser);

  final String email;

  final String password;

  @override
  String toString() =>
      'LoginUser(email:${this.email},password:${this.password})';
  @override
  List get props => [email, password];
}
