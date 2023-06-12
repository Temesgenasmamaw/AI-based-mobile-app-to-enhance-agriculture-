import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:agri_app/Authentication/login_page.dart';

import '../common/theme_helper.dart';
import 'widgets/header_widget.dart';

class RegistrationPage extends StatefulWidget {
  // final Function()? onTap;
  const RegistrationPage({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  bool _passwordInVisible = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // bool _isObscure = true;

  //sign up user
  void signUp() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (_passwordController.text.trim() ==
          _confirmPasswordController.text.trim()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        //pop the leading circle
        Navigator.pop(context);
        showSuccessMessage('Successfully created!');
        // Navigator.pop(context);
      } else {
        print('password don\'t match');
        //pop the leading circle
        Navigator.pop(context);
        showErorMessage('Password don\'t match');
        // Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      //pop the leading circle
      Navigator.pop(context);
      showErorMessage(e.code);
    } catch (e) {
      print(e);
    }
  }

//show error message
  void showErorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("${message}",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent)),
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

//show Success message
  void showSuccessMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("${message}",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(height: 20.0),
                        //email address
                        Container(
                          child: TextFormField(
                            controller: _emailController,
                            decoration: ThemeHelper().textInputDecoration(
                                "UserName".tr(), "EnterUserName".tr()),
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.black),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "pleaseEnterEmail".tr();
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                  .hasMatch(val)) {
                                return "enterValidEmail".tr();
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        // Container(
                        //   child: TextFormField(
                        //     decoration: ThemeHelper().textInputDecoration(
                        //         "Mobile Number", "Enter your mobile number"),
                        //     keyboardType: TextInputType.phone,
                        //     validator: (val) {
                        //       if (!(val!.isEmpty) &&
                        //           !RegExp(r"^(\d+)*$").hasMatch(val)) {
                        //         return "Enter a valid phone number";
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        //   decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        // ),

                        //password
                        // Container(
                        //   child: TextFormField(
                        //     style: TextStyle(color: Colors.black),
                        //     controller: passwordController,
                        //     obscureText: true,
                        //     decoration: ThemeHelper().textInputDecoration(
                        //       "password".tr(),
                        //       "EnterPassword".tr(),
                        //     ),
                        //     validator: (val) {
                        //       if (val!.isEmpty) {
                        //         return "pleaseEnterPassword".tr();
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        //   decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),

                        // //confirm password
                        // Container(
                        //   child: TextFormField(
                        //     style: TextStyle(color: Colors.black),
                        //     obscureText: true,
                        //     controller: confirmController,
                        //     decoration: ThemeHelper().textInputDecoration(
                        //       "confirmPassword".tr(),
                        //       "confirmPassword".tr(),
                        //     ),
                        //     validator: (val) {
                        //       if (val!.isEmpty) {
                        //         return "pleaseConfirm".tr();
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        //   decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        // ),
                        // SizedBox(height: 15.0),

                        //new password
                        Container(
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: _passwordInVisible,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'EnterPassword'.tr(),
                              labelStyle: TextStyle(color: Colors.black),
                              label: Text('password').tr(),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.blueAccent,
                              ),
                              // filled: true,
                              hintStyle: TextStyle(color: Colors.black),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide: BorderSide(
                                      // color: Colors.grey.shade400
                                      )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordInVisible
                                      ? Icons.visibility_off
                                      : Icons
                                          .visibility, //change icon based on boolean value
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordInVisible =
                                        !_passwordInVisible; //change boolean value
                                  });
                                },
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'pleaseEnterPassword'.tr();
                              }
                              return null;
                            },
                          ),

                          // decoration:
                          //     ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),

                        //new confirm password
                        Container(
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: _passwordInVisible,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'confirmPassword'.tr(),
                              labelStyle: TextStyle(color: Colors.black),
                              label: Text('confirmPassword').tr(),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.blueAccent,
                              ),
                              // filled: true,
                              hintStyle: TextStyle(color: Colors.black),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide: BorderSide(
                                      // color: Colors.grey.shade400
                                      )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordInVisible
                                      ? Icons.visibility_off
                                      : Icons
                                          .visibility, //change icon based on boolean value
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordInVisible =
                                        !_passwordInVisible; //change boolean value
                                  });
                                },
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'pleaseConfirm'.tr();
                              }
                              return null;
                            },
                          ),

                          // decoration:
                          //     ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        //check box
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        hoverColor: Colors.black,
                                        checkColor: Colors.red,
                                        focusColor: Colors.green,
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text(
                                      "acceptPrivacy".tr(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'youNeedToAccept'.tr();
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "SignUp".tr().toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                signUp();
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                  text: "haveAccount".tr(),
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'signin'.tr(),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));

                                      // widget.onTap;
                                    },
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.blueAccent),
                                ),
                              ])),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
