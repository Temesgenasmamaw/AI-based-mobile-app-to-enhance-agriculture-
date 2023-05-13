import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import '../Contacts/drawer.dart';
import 'Resource.dart';
import 'crops.dart';
import 'language.dart';
import 'list_disease.dart';
import 'upload.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    UploadImage(),
    ListDisease(),
    Resource(),
    Tabs(),
    Language(),
  ];

  dynamic a;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 20,
          title: Text(
            'mdp'.tr(),
            style: const TextStyle(fontSize: 19),
          ),
          centerTitle: true),
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
            icon: const Icon(Icons.list),
            label: 'Diseases'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.info),
            label: 'Resource'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.info),
            label: 'Crops'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.language),
            label: 'Language'.tr(),
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