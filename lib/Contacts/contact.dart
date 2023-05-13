import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  static TextStyle optionStyle1 = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.bold,
  );
  final String _phone1 = '+251952614852';
  final String _phone2 = '+251941257867';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Contact'.tr())),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                'Temesgen Asmamaw',
                style: optionStyle1,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.sta,
                children: [
                  Icon(Icons.phone),
                  TextButton(
                      onPressed: () async {
                        final _call = 'tel:+251952614852';
                        if (await canLaunch(_call)) {
                          launch(_call);
                        } else {
                          //dailer is not opened
                        }
                      },
                      child: Text("0952614852"))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message),
                  TextButton(
                      onPressed: () async {
                        final _call = 'sms:+251952614852';
                        if (await canLaunch(_call)) {
                          launch(_call);
                        } else {
                          //dailer is not opened
                        }
                      },
                      child: Text("0952614852"))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email),
                  TextButton(
                      onPressed: () async {
                        final _call = 'mailto:asmamawtemesgen16@gmail.com';
                        if (await canLaunch(_call)) {
                          launch(_call);
                        } else {
                          //dailer is not opened
                        }
                      },
                      child: Text("asmamawtemesgen16@gmail.com"))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                  TextButton(
                      onPressed: () async {
                        final _url =
                            'https://www.facebook.com/Temesgen.asmamaw.921';
                        if (await canLaunch(_url)) {
                          launch(_url);
                        } else {
                          //dailer is not opened
                        }
                      },
                      child: Text("facebook"))
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/linkedin.png',
                    width: 25,
                    height: 25,
                  ),
                  TextButton(
                    onPressed: () async {
                      final _url =
                          'https://www.linkedin.com/in/temesgen-asmamaw21';
                      if (await canLaunch(_url)) {
                        launch(_url);
                      } else {
                        //dailer is not opened
                      }
                    },
                    child: Text("linked In"),
                  )
                ],
              ),
              Text(
                'Mastewal Tesfa',
                style: optionStyle1,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.sta,
                children: [
                  Icon(Icons.phone),
                  TextButton(
                      onPressed: () async {
                        final _call = 'tel:+251941257867';
                        if (await canLaunch(_call)) {
                          launch(_call);
                        } else {
                          //dailer is not opened
                        }
                      },
                      child: const Text("0941257867"))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message),
                  TextButton(
                      onPressed: () async {
                        final _call = 'sms:+251941257867';
                        if (await canLaunch(_call)) {
                          launch(_call);
                        } else {
                          //dailer is not opened
                        }
                      },
                      child: const Text("0941257867"))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email),
                  TextButton(
                      onPressed: () async {
                        final _call = 'mailto.mastitesfa444@gmail.com';
                        if (await canLaunch(_call)) {
                          launch(_call);
                        } else {
                          //dailer is not opened
                        }
                      },
                      child: Text("mastitesfa444@gmail.com"))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                  TextButton(
                      onPressed: () async {
                        final _url =
                            'https://www.facebook.com/Temesgen.asmamaw.921';
                        if (await canLaunch(_url)) {
                          launch(_url);
                        } else {
                          //dailer is not opened
                        }
                      },
                      child: Text("facebook"))
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/linkedin.png',
                    width: 25,
                    height: 25,
                  ),
                  TextButton(
                    onPressed: () async {
                      final _url =
                          'https://www.linkedin.com/in/temesgen-asmamaw21';
                      if (await canLaunch(_url)) {
                        launch(_url);
                      } else {
                        //dailer is not opened
                      }
                    },
                    child: Text("linked In"),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
