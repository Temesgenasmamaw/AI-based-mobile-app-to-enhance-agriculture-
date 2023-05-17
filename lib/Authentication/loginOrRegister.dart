// import 'package:flutter/material.dart';
// import 'package:mango_app/Authentication/login_page.dart';

// import 'registration_page.dart';

// class loginOrRegister extends StatefulWidget {
//   const loginOrRegister({super.key});

//   @override
//   State<loginOrRegister> createState() => _loginOrRegisterState();
// }

// class _loginOrRegisterState extends State<loginOrRegister> {
//   //initially login
//   bool showLoginPage = true;

// //toggle b/n login and register page
//   void togglePages() {
//     if (showLoginPage) {
//       showLoginPage = !showLoginPage;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginPage) {
//       return LoginPage(
//         onTap: togglePages
//       );
//     } else {
//      return RegistrationPage(onTap:togglePages);
//     }
//   }
// }
