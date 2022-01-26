part of 'login_bloc.dart';

@immutable
abstract class LoginState<T> extends Equatable {
  @override
  List<T> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class Loading extends LoginState {}

class Loaded extends LoginState {
  Loaded(this.login);

  final Login login;

  @override
  List get props => [login];
}

class Error extends LoginState {
  Error({@required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
