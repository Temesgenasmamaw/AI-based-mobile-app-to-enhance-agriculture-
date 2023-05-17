import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/SignUp.dart';
import '../main.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailReset = TextEditingController();
  @override
  void dispose() {
    _emailReset.dispose();
    // _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Enter your email\nto reset password',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailReset,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.red, width: 30),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'E-mail',
                    hintText: 'Enter Your E-mail',
                  ),
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter valid email'
                          : null,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)),
                  onPressed: resetPassword,
                  icon: const Icon(
                    Icons.email_outlined,
                    size: 20,
                  ),
                  label: const Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Future resetPassword() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return; //if not valid
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailReset.text.trim(),
      );
      showSnackBar('Password Reset Email Sent');
    } on FirebaseAuthException catch (e) {
      print(e);
      showSnackBar(e.message);
      Navigator.of(context).pop();
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
