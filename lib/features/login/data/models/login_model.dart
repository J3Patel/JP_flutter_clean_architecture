
import 'package:JP_flutter_clean_architecture/core/model/jp_model.dart';
import 'package:JP_flutter_clean_architecture/features/login/domain/entities/login.dart';
import 'package:flutter/cupertino.dart';

class LoginModel extends Login implements JPDataModel<LoginModel> {
  LoginModel({
    userID,
    token,
    this.isVerified,
    this.userEvent,
  }): super(userID: userID, token: token);

  final int isVerified;
  final String userEvent;

  @override
  Map<String, dynamic> toJson() => {
    'user_id': userID,
    'is_verified': isVerified,
    'token': token,
    'user_event': userEvent,
  };

  @override
  LoginModel fromJson(Map<String, dynamic> json) {
    return
      LoginModel(
        userID: json['user_id'],
        isVerified: json['is_verified'],
        token: json['token'],
        userEvent: json['user_event'],
      );
  }
}
