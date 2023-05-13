import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              await context.setLocale(Locale('en'));
            
              Navigator.pushNamed(context, '/home');
            },
            child: Container(
              width: double.maxFinite,
              height: h / 5,
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              //margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: Card(
                  elevation: 60,
                  borderOnForeground: true,
                  shadowColor: Color(0xFF0B0468),
                  child: Center(
                      child: Text("English", style: TextStyle(fontSize: 30)))),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await context.setLocale(const Locale('am'));
                await flutterTts.setVoice({
                'language': 'am-ET',
                'variant': 'en-in-x-ene-network',
                'gender': 'male',
              });
              Navigator.pushNamed(context, '/home');
            },
            child: Container(
              width: double.maxFinite,
              height: h / 5,
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              //margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: Card(
                  elevation: 60,
                  borderOnForeground: true,
                  shadowColor: Colors.blueGrey,
                  child: Center(
                      child: Text("አማርኛ", style: TextStyle(fontSize: 30)))),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await context.setLocale(const Locale('fr'));
              Navigator.pushNamed(context, '/home');
            },
            child: Container(
              width: double.maxFinite,
              height: h / 5,
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              //margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: Card(
                  elevation: 60,
                  shadowColor: Color(0xFF0B0468),
                  child: Center(
                      child: Text("ትግርኛ", style: TextStyle(fontSize: 30)))),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await context.setLocale(const Locale('es'));
              Navigator.pushNamed(context, '/home');
            },
            child: Container(
              width: double.maxFinite,
              height: h / 5,
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              //margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: Card(
                  elevation: 60,
                  borderOnForeground: true,
                  shadowColor: Colors.blueGrey,
                  child: Center(
                      child:
                          Text("Afann Oromo", style: TextStyle(fontSize: 30)))),
            ),
          ),
        ],
      ),
    );
  }
}
