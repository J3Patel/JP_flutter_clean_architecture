

import 'package:JP_flutter_clean_architecture/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginControls extends StatefulWidget {
  const LoginControls({
    Key key,
  }) : super(key: key);

  @override
  _LoginControlsState createState() => _LoginControlsState();
}

class _LoginControlsState extends State<LoginControls> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Email',
          ),
          onChanged: (value) {
            email = value;
          },
        ),
        TextField(
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Password',
          ),
          onChanged: (value) {
            password = value;
          },
          onSubmitted: (_) {
            loginWithEmail();
          },
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: loginWithEmail,
                child: Text('Search'),
              ),
            ),
          ],
        )
      ],
    );
  }

  void loginWithEmail() {
    emailController.clear();
    passwordController.clear();
    BlocProvider.of<LoginBloc>(context)
        .add(LoginWithEmailEvent(email, password));
  }
}