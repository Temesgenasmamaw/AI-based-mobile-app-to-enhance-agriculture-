import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../Auth/ForgotPasswordPage.dart';
import '../main.dart';

class Login extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  Login({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            CircleAvatar(
              radius: 40.0,
              child: ClipRRect(
                child: Image.network(
                    'https://cdn2.iconfinder.com/data/icons/perfect-flat-icons-2/512/User_login_man_profile_account.png'),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    // borderSide: BorderSide(color: Colors.red, width: 30),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                labelText: 'E-mail',
                hintText: 'Enter Your E-mail',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      // borderSide: BorderSide(color: Colors.red, width: 30),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'Password',
                  hintText: 'Enter Password'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              onPressed: SignIn,
              icon: const Icon(
                Icons.lock_open,
                size: 25,
              ),
              label: const Text(
                'Sign In',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                child: Text(
                  'Forgot password',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage()))),
            SizedBox(
              height: 15,
            ),
            RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Color.fromARGB(255, 47, 45, 45), fontSize: 16),
                    text: "No account?",
                    children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    text: 'Sign Up',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.green),
                  )
                ]))
          ],
        ),
      ),
    );
  }

  Future SignIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
