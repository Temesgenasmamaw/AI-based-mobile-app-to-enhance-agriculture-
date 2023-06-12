import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'verifyPhone.dart';

class phoneSignIn extends StatefulWidget {
  @override
  _phoneSignInState createState() => _phoneSignInState();
}

class _phoneSignInState extends State<phoneSignIn> {
  var _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  var isLoading = false;
  bool loading = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
        // leading: Icon(Icons.filter_vintage),
      ),
      //body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //form
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                "enter phone number ",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              //styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),

              //box styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              //phone number
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'phone number',
                  hintText: '+251952614852',
                ),
                keyboardType: TextInputType.phone,
                onFieldSubmitted: (value) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid phone number!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              ElevatedButton(
                child: Text(
                  "login",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () {
                  verifyPhoneCode();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void verifyPhoneCode() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    auth.verifyPhoneNumber(
        phoneNumber: _phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          //pop the leading circle
          Navigator.pop(context);
          showErrormessage(e.toString());
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Update the UI - wait for the user to enter the SMS code

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => verifyPhone(
                        verificationId: verificationId,
                      )));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print(verificationId.toString());
        });
  }

  void showErrormessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // title: Text(" ${message}"),
            content: Text("${message}"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  child: const Text("okay"),
                ),
              ),
            ],
          );
        });
  }
}
