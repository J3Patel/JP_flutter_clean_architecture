import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:JP_flutter_clean_architecture/common/error/error_constants.dart';
import 'package:JP_flutter_clean_architecture/core/error/failures.dart';
import 'package:JP_flutter_clean_architecture/features/login/data/service/login_endpoint.dart';
import 'package:JP_flutter_clean_architecture/features/login/domain/entities/login.dart';
import 'package:JP_flutter_clean_architecture/features/login/domain/usecases/login_with_email.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginWithEmail) : super(LoginInitial());

  final LoginWithEmail loginWithEmail;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginWithEmailEvent) {
      // Validation and error handling will be handled here
          yield Loading();
          var endpoint = LoginWithEmailEndpoint(
              email:event.email ,
              password: event.password);


          final failureOrLogin = await loginWithEmail(endpoint);
          yield* _eitherLoadedOrErrorState(failureOrLogin);
    }
  }

  Stream<LoginState> _eitherLoadedOrErrorState(
      Either<Failure, Login> failureOrLogin,
      ) async* {
    yield failureOrLogin.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (login) => Loaded(login),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return ErrorMessage.SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return ErrorMessage.INVALID_EMAIL_PASSWORD_MESSAGE;
      default:
        return ErrorMessage.UNKNOWN;
    }
  }

}
