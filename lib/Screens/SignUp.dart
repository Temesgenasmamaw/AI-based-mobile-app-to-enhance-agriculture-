import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//import '../Auth/Utils.dart';
import '../main.dart';

class SignUp extends StatefulWidget {
  final Function() onClickedSignIn;

  SignUp({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
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
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const SizedBox(
                height: 15,
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter valid email'
                        : null,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? 'Min char is 6'
                      : null),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                onPressed: SignUp,
                icon: const Icon(
                  Icons.lock_open,
                  size: 15,
                ),
                label: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                          color: Color.fromARGB(255, 47, 45, 45), fontSize: 20),
                      text: "Already have an account?",
                      children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      text: 'Log in',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary),
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }

  Future SignUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return; //if not valid
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      showSnackBar(e.message);
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



//flutter firebase authentication?