import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:mango_app/Authentication/phone.dart';
import 'package:marquee/marquee.dart';
// import 'package:provider/provider.dart';
import '../common/theme_helper.dart';
// import '../theme/theme-model.dart';
import 'forgot_password_page.dart';
import 'registration_page.dart';
import 'widgets/header_widget.dart';

class Language {
  Locale locale;
  String langName;
  Language({
    required this.locale,
    required this.langName,
  });
}

class LoginPage extends StatefulWidget {
  // final Function()? onTap;
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 100;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _passwordInVisible = true; //a boolean value

  List<Language> languageList = [
    Language(
      langName: 'En',
      locale: const Locale('en'),
    ),
    Language(
      langName: 'አማ',
      locale: const Locale('am'),
    ),
  ];
  Language? selectedLang;

  void signIn() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
//sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      //pop the leading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the leading circle
      Navigator.pop(context);
      showErorMessage(e.code);
    }
  }

  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Wrong email"),
            content: const Text("You have entered wrong email address"),
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

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Wrong password"),
            content: const Text("You have entered wrong password"),
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

//show error message
  void showErorMessage(String message) {
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    if (languageList.isNotEmpty) {
      selectedLang =
          languageList.singleWhere((e) => e.locale == context.locale);
    } else {
      print('list is empty');
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          //language button
          DropdownButton<Language>(
            iconSize: 35,
            elevation: 25,
            value: selectedLang,
            underline: Container(
              padding: const EdgeInsets.only(left: 4, right: 4),
            ),
            onChanged: (newValue) {
              setState(() {
                selectedLang = newValue!;
              });
              if (newValue!.langName == 'En') {
                context.setLocale(const Locale('en'));
              } else if (newValue.langName == 'አማ') {
                context.setLocale(const Locale('am'));
              } else {
                print('please select language');
              }
              // setState(() {});
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => Home()),
              // );
            },
            items:
                languageList.map<DropdownMenuItem<Language>>((Language value) {
              return DropdownMenuItem<Language>(
                value: value,
                child: Text(
                  value.langName,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),

          // ListTileSwitch(
          //   value: themeChange.darkTheme,
          //   leading: const Icon(Icons.dark_mode),
          //   onChanged: (value) {
          //     setState(() {
          //       themeChange.darkTheme = value;
          //     });
          //   },
          //   visualDensity: VisualDensity.comfortable,
          //   switchType: SwitchType.cupertino,
          //   switchActiveColor: Color(0xFFA10299),
          //   title: Text('DarkTheme'.tr()),
          //   subtitle: Text(
          //     "EnableDark".tr(),
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      Container(
                        height: 25.0, // provide a fixed height
                        width: MediaQuery.of(context).size.width,
                        child: Marquee(
                          text: 'Enhance Crop Productivity by AI',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          scrollAxis: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          blankSpace: 20.0,
                          velocity: 50.0,
                          pauseAfterRound: Duration(seconds: 1),
                          startPadding: 10.0,
                          accelerationDuration: Duration(seconds: 1),
                          accelerationCurve: Curves.linear,
                          decelerationDuration: Duration(milliseconds: 500),
                          decelerationCurve: Curves.easeOut,
                        ),
                      ),
                      Text(
                        'signinToAccount'.tr(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // email
                              Container(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  textInputAction: TextInputAction.next,
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: ThemeHelper().textInputDecoration(
                                      "UserName".tr(), "EnterUserName".tr()),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'pleaseEnterEmail'.tr();
                                    }
                                    return null;
                                  },
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              //password
                              Container(
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: _passwordInVisible,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: 'EnterPassword'.tr(),
                                    labelStyle: TextStyle(color: Colors.black),
                                    label: Text('password').tr(),
                                    // filled: true,
                                    hintStyle: TextStyle(color: Colors.black),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: BorderSide(
                                            // color: Colors.grey.shade400
                                            )),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0)),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _passwordInVisible
                                            ? Icons.visibility_off
                                            : Icons
                                                .visibility, //change icon based on boolean value
                                        color:
                                            Theme.of(context).primaryColorDark,
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
                              SizedBox(height: 15.0),

                              //forgot password
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordPage()),
                                    );
                                  },
                                  child: Text(
                                    "forgotPassword".tr(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              //sign in button
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                    // onPressed: () {
                                    //   if()
                                    // },
                                    style: ThemeHelper().buttonStyle(),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 10, 40, 10),
                                      child: Text(
                                        'signin'.tr().toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        try {
                                          signIn();
                                        } catch (e) {
                                          print(e.toString());
                                        }
                                      }
                                    }),
                              ),
                              const SizedBox(height: 20),

                              // or continue with
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        // color: Colors.grey[400],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        'continueWith'.tr(),
                                        style:
                                            TextStyle(color: Colors.grey[700]),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 20),

                              // google +phone number sign in buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child: FaIcon(
                                      FontAwesomeIcons.googlePlus,
                                      size: 35,
                                      color: HexColor("#EC2D2F"),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        signInWithGoogle();
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 50.0,
                                  ),

                                  //phone number
                                  GestureDetector(
                                    child: FaIcon(
                                      FontAwesomeIcons.phone,
                                      size: 35,
                                      color: HexColor("#3E529C"),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  phoneSignIn()));
                                    },
                                  ),
                                ],
                              ),

                              const SizedBox(height: 30),
                              //Don\'t have an account?
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: "dontHaveAccount".tr(),
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'createNewAccount'.tr(),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationPage()));

                                        // widget.onTap;
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);

   
  }
  
}
