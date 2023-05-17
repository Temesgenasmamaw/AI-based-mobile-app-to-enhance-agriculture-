import 'package:flutter/material.dart';

import '../Screens/Login.dart';
import '../Screens/SignUp.dart';

class Auth extends StatefulWidget {
  Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? Login(onClickedSignUp: toggle)
      : SignUp(onClickedSignIn: toggle);
  void toggle() => setState(() => isLogin = !isLogin);
}
