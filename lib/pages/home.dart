import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import '../Contacts/drawer.dart';
import '../wheather/wheather-page.dart';
import 'crops.dart';
import 'fruit-crop.dart';
import 'landing page.dart';
import 'upload.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Language {
  Locale locale;
  String langName;
  Language({
    required this.locale,
    required this.langName,
  });
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;

  static const List<Widget> _widgetOptions = <Widget>[
    landingPage(),
    UploadImage(),
    Tabs(),
    CropFruit(),
    wheatherApi()

    // Languages(),
  ];

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

  @override
  Widget build(BuildContext context) {
    if (languageList.isNotEmpty) {
      selectedLang =
          languageList.singleWhere((e) => e.locale == context.locale);
    } else {
      print('list is empty');
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: Text(
          'mdp'.tr(),
          style: const TextStyle(fontSize: 19),
        ),
        // centerTitle: true,
        actions: [
          //language button
          DropdownButton<Language>(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            iconSize: 35,
            elevation: 25,
            value: selectedLang,
            underline: Container(
              padding: const EdgeInsets.only(left: 1, right: 4),
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
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent),
                ),
              );
            }).toList(),
          ),

          //logout icon
          IconButton(
            icon: Icon(Icons.logout_outlined),
            iconSize: 20,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('${user.email}'),
                      content: Text('Are you sure you want to log out?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Yes'),
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.pop(context);
                            ;
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: MyHeaderDrawer(),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        onTap: _setIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home'.tr(),
            //  backgroundColor: Colors.grey[100],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.health_and_safety),
            label: 'Diseases'.tr(),
            //  backgroundColor: Colors.grey[100],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.perm_device_information_outlined),
            label: 'Crops'.tr(),
          ),
          // BottomNavigationBarItem(
          //   icon: const Icon(Icons.list),
          //   label: 'info on disease'.tr(),
          // ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.info),
            label: 'Resource'.tr(),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.sunny),
            label: 'Wheather'.tr(),
          ),
        ],
      ),
    );
  }

  void _setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
