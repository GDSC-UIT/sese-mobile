import 'package:flutter/material.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/modules/login/login_controller.dart';

class LoginButton extends StatelessWidget {
  String textMethod;
  Widget icon;
  Function onPress;
  LoginButton(
      {Key? key,
      required this.loginController,
      required this.authService,
      required this.icon,
      required this.textMethod,
      required this.onPress})
      : super(key: key);

  final LoginController loginController;
  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        onPress();
      },
      icon: icon,
      label: Text(
        'Login with $textMethod',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
