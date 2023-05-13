import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About".tr()),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Text(
            'AboutInfo'.tr(),
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ))
        ]),
      ),
    );
  }
}
