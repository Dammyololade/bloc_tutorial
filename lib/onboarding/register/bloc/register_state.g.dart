// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class RegisterState extends Equatable {
  const RegisterState(this._type);

  factory RegisterState.initial() = Initial;

  factory RegisterState.processing() = Processing;

  factory RegisterState.success({@required RegisterModel model}) = Success;

  factory RegisterState.registerError({@required String errorMessage}) =
      RegisterError;

  final _RegisterState _type;

//ignore: missing_return
  R when<R>(
      {@required FutureOr<R> Function(Initial) initial,
      @required FutureOr<R> Function(Processing) processing,
      @required FutureOr<R> Function(Success) success,
      @required FutureOr<R> Function(RegisterError) registerError}) {
    assert(() {
      if (initial == null ||
          processing == null ||
          success == null ||
          registerError == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _RegisterState.Initial:
        return initial(this as Initial);
      case _RegisterState.Processing:
        return processing(this as Processing);
      case _RegisterState.Success:
        return success(this as Success);
      case _RegisterState.RegisterError:
        return registerError(this as RegisterError);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(Initial) initial,
      FutureOr<R> Function(Processing) processing,
      FutureOr<R> Function(Success) success,
      FutureOr<R> Function(RegisterError) registerError,
      @required FutureOr<R> Function(RegisterState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _RegisterState.Initial:
        if (initial == null) break;
        return initial(this as Initial);
      case _RegisterState.Processing:
        if (processing == null) break;
        return processing(this as Processing);
      case _RegisterState.Success:
        if (success == null) break;
        return success(this as Success);
      case _RegisterState.RegisterError:
        if (registerError == null) break;
        return registerError(this as RegisterError);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(Initial) initial,
      FutureOr<void> Function(Processing) processing,
      FutureOr<void> Function(Success) success,
      FutureOr<void> Function(RegisterError) registerError}) {
    assert(() {
      if (initial == null &&
          processing == null &&
          success == null &&
          registerError == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _RegisterState.Initial:
        if (initial == null) break;
        return initial(this as Initial);
      case _RegisterState.Processing:
        if (processing == null) break;
        return processing(this as Processing);
      case _RegisterState.Success:
        if (success == null) break;
        return success(this as Success);
      case _RegisterState.RegisterError:
        if (registerError == null) break;
        return registerError(this as RegisterError);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Initial extends RegisterState {
  const Initial._() : super(_RegisterState.Initial);

  factory Initial() {
    _instance ??= Initial._();
    return _instance;
  }

  static Initial _instance;
}

@immutable
class Processing extends RegisterState {
  const Processing._() : super(_RegisterState.Processing);

  factory Processing() {
    _instance ??= Processing._();
    return _instance;
  }

  static Processing _instance;
}

@immutable
class Success extends RegisterState {
  const Success({@required this.model}) : super(_RegisterState.Success);

  final RegisterModel model;

  @override
  String toString() => 'Success(model:${this.model})';
  @override
  List get props => [model];
}

@immutable
class RegisterError extends RegisterState {
  const RegisterError({@required this.errorMessage})
      : super(_RegisterState.RegisterError);

  final String errorMessage;

  @override
  String toString() => 'RegisterError(errorMessage:${this.errorMessage})';
  @override
  List get props => [errorMessage];
}
