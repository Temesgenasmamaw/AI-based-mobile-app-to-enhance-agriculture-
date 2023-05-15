import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mango_app/pages/home.dart';

class Language {
  Locale locale;
  String langName;
  Language({
    required this.locale,
    required this.langName,
  });
}

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  List<Language> languageList = [
    Language(
      langName: 'English',
      locale: const Locale('en'),
    ),
    Language(
      langName: 'አማርኛ',
      locale: const Locale('fr'),
    ),
  ];
  Language? selectedLang;
  @override
  Widget build(BuildContext context) {
    selectedLang = languageList.singleWhere((e) => e.locale == context.locale);
    double width = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
      
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            tooltip: 'select language',
            onPressed: () {
              // handle the press
            },
          ),

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
                      if (newValue!.langName == 'English') {
                        context.setLocale(const Locale('en'));
                      } else if (newValue.langName == 'አማርኛ') {
                        context.setLocale(const Locale('fr'));
                      } else {
                        print('please select language');
                      }
                      setState(() {});
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    items: languageList
                        .map<DropdownMenuItem<Language>>((Language value) {
                      return DropdownMenuItem<Language>(
                        value: value,
                        child: Text(
                          value.langName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
        ],
     
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              child: Text(
                "ChangeLanguage".tr(),
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // Container(
            //   width: width,
            //   height: h * 0.4,
            //   padding: const EdgeInsets.only(left: 4, right: 4),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     mainAxisSize: MainAxisSize.min,
            //     children: <Widget>[
            //       DropdownButton<Language>(
            //         iconSize: 35,
            //         elevation: 25,
            //         value: selectedLang,
            //         underline: Container(
            //           padding: const EdgeInsets.only(left: 4, right: 4),
            //         ),
            //         onChanged: (newValue) {
            //           setState(() {
            //             selectedLang = newValue!;
            //           });
            //           if (newValue!.langName == 'English') {
            //             context.setLocale(const Locale('en'));
            //           } else if (newValue.langName == 'አማርኛ') {
            //             context.setLocale(const Locale('fr'));
            //           } else {
            //             print('please select language');
            //           }
            //           setState(() {});
            //           Navigator.of(context).push(
            //             MaterialPageRoute(builder: (context) => Home()),
            //           );
            //         },
            //         items: languageList
            //             .map<DropdownMenuItem<Language>>((Language value) {
            //           return DropdownMenuItem<Language>(
            //             value: value,
            //             child: Text(
            //               value.langName,
            //               style: const TextStyle(
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.w600,
            //               ),
            //             ),
            //           );
            //         }).toList(),
            //       ),
            //     ],
            //   ),
            // ),
          
          ],
        ),
      ),
    );
  }
}
