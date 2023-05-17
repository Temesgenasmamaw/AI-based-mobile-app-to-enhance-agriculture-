import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mango_app/Authentication/profile_page.dart';

class verifyPhone extends StatefulWidget {
  final String verificationId;
  const verifyPhone({Key? key, required this.verificationId}) : super(key: key);

  @override
  _verifyPhoneState createState() => _verifyPhoneState();
}

class _verifyPhoneState extends State<verifyPhone> {
  var _formKey = GlobalKey<FormState>();
  final _verifyPhoneCodeController = TextEditingController();
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
        title: Text("verify code"),
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
                "Enter verify code ",
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
                controller: _verifyPhoneCodeController,
                decoration: InputDecoration(
                  labelText: 'enter 6 digits',
                  hintText: '+251 952614852',
                ),
                keyboardType: TextInputType.phone,
                onFieldSubmitted: (value) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid code!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              ElevatedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () async {
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: _verifyPhoneCodeController.text.toString());

                  try {
                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  } catch (e) {
                    print(e.toString());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
