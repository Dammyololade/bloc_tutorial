// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class LoginState extends Equatable {
  const LoginState(this._type);

  factory LoginState.initial() = Initial;

  factory LoginState.processing() = Processing;

  factory LoginState.success({@required LoginModel model}) = Success;

  factory LoginState.loginError({@required String errorMessage}) = LoginError;

  final _LoginState _type;

//ignore: missing_return
  R when<R>(
      {@required FutureOr<R> Function(Initial) initial,
      @required FutureOr<R> Function(Processing) processing,
      @required FutureOr<R> Function(Success) success,
      @required FutureOr<R> Function(LoginError) loginError}) {
    assert(() {
      if (initial == null ||
          processing == null ||
          success == null ||
          loginError == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginState.Initial:
        return initial(this as Initial);
      case _LoginState.Processing:
        return processing(this as Processing);
      case _LoginState.Success:
        return success(this as Success);
      case _LoginState.LoginError:
        return loginError(this as LoginError);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(Initial) initial,
      FutureOr<R> Function(Processing) processing,
      FutureOr<R> Function(Success) success,
      FutureOr<R> Function(LoginError) loginError,
      @required FutureOr<R> Function(LoginState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginState.Initial:
        if (initial == null) break;
        return initial(this as Initial);
      case _LoginState.Processing:
        if (processing == null) break;
        return processing(this as Processing);
      case _LoginState.Success:
        if (success == null) break;
        return success(this as Success);
      case _LoginState.LoginError:
        if (loginError == null) break;
        return loginError(this as LoginError);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(Initial) initial,
      FutureOr<void> Function(Processing) processing,
      FutureOr<void> Function(Success) success,
      FutureOr<void> Function(LoginError) loginError}) {
    assert(() {
      if (initial == null &&
          processing == null &&
          success == null &&
          loginError == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginState.Initial:
        if (initial == null) break;
        return initial(this as Initial);
      case _LoginState.Processing:
        if (processing == null) break;
        return processing(this as Processing);
      case _LoginState.Success:
        if (success == null) break;
        return success(this as Success);
      case _LoginState.LoginError:
        if (loginError == null) break;
        return loginError(this as LoginError);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Initial extends LoginState {
  const Initial._() : super(_LoginState.Initial);

  factory Initial() {
    _instance ??= Initial._();
    return _instance;
  }

  static Initial _instance;
}

@immutable
class Processing extends LoginState {
  const Processing._() : super(_LoginState.Processing);

  factory Processing() {
    _instance ??= Processing._();
    return _instance;
  }

  static Processing _instance;
}

@immutable
class Success extends LoginState {
  const Success({@required this.model}) : super(_LoginState.Success);

  final LoginModel model;

  @override
  String toString() => 'Success(model:${this.model})';
  @override
  List get props => [model];
}

@immutable
class LoginError extends LoginState {
  const LoginError({@required this.errorMessage})
      : super(_LoginState.LoginError);

  final String errorMessage;

  @override
  String toString() => 'LoginError(errorMessage:${this.errorMessage})';
  @override
  List get props => [errorMessage];
}
