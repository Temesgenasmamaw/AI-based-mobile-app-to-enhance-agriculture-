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
                  hintText: '0952614852',
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
                  auth.verifyPhoneNumber(
                      phoneNumber: _phoneController.text,
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {
                        await auth.signInWithCredential(credential);
                      },
                      verificationFailed: (FirebaseAuthException e) {
                        if (e.code == 'invalid-phone-number') {
                          print('The provided phone number is not valid.');
                        }
                      },
                      codeSent:
                          (String verificationId, int? resendToken) async {
                        // Update the UI - wait for the user to enter the SMS code

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => verifyPhone(
                                      verificationId: verificationId,
                                    )));

                        // String smsCode = 'xxxx';

                        // // Create a PhoneAuthCredential with the code
                        // PhoneAuthCredential credential =
                        //     PhoneAuthProvider.credential(
                        //         verificationId: verificationId,
                        //         smsCode: smsCode);

                        // // Sign the user in (or link) with the credential
                        // await auth.signInWithCredential(credential);
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        print(verificationId.toString());
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
