
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Login extends Equatable {

  Login({
    @required this.token,
    @required this.userID,
  });

  final String token;
  final String userID;

  @override
  List<Object> get props => [token, userID];
}