import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PrivacyPolicy".tr()),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Text(
              "PrivacyPolicy".tr(),
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 2,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Text(
            'Policy'.tr(),
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ))
        ]),
      ),
    );
  }
}
