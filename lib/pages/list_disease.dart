import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../utils/description.dart';

class ListDisease extends StatefulWidget {
  const ListDisease({Key? key}) : super(key: key);

  @override
  State<ListDisease> createState() => _ListDiseaseState();
}

class _ListDiseaseState extends State<ListDisease> {
  List<DisInfo> diseases = [
    DisInfo(ManDisease: 'ANTH'.tr(), pic: 'anth.png'),
    DisInfo(ManDisease: 'BLAC'.tr(), pic: 'black.png'),
    DisInfo(ManDisease: 'WHITE'.tr(), pic: 'heal.png'),
    DisInfo(ManDisease: 'HEAL'.tr(), pic: 'heal.png')
  ];
  void showInfo(index) {
    DisInfo instance = diseases[index];
    Navigator.pushNamed(context, '/info', arguments: instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: diseases.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          // print(diseases.length);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
            child: Card(
              elevation: 20,
              shadowColor: Colors.blue,
              child: ListTile(
                contentPadding: EdgeInsets.only(right: 30, top: 20, bottom: 30),
                onTap: () {
                  showInfo(index);
                },
                title: Text(
                  diseases[index].ManDisease.tr(),
                  style: const TextStyle(fontSize: 19),
                ),
                leading: CircleAvatar(
                  radius: 60,
                  foregroundImage: AssetImage(
                    'assets/leafimages/${diseases[index].pic}',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
