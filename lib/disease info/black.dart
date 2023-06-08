import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BlackMangoDisease extends StatefulWidget {
  const BlackMangoDisease({super.key});

  @override
  State<BlackMangoDisease> createState() => _BlackMangoDiseaseState();
}

class _BlackMangoDiseaseState extends State<BlackMangoDisease> {
  static TextStyle optionStyle1 = TextStyle(
      fontSize: 21, fontWeight: FontWeight.bold, color: Colors.grey[600]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF61A1D5),
        title: Text('More'.tr()),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container( margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  SizedBox(
                  height: 20,
                ),
               Image(
                    height: 200,
                    width: 400,
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/leafimages/black.png'),
                  ),
                    SizedBox(
                  height: 20,
                ),
              Text(
                "DefinitionOfBlack".tr(),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text("Symptoms".tr(), style: optionStyle1),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('One'.tr()),
                  Expanded(
                      child: Text(
                    "SymptomOfBlackOne".tr(),
                    textAlign: TextAlign.justify,
                  ))
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text("Prevention".tr(), style: optionStyle1),
              const SizedBox(
                height: 10.0,
              ),
              Row(children: [
                Text('One'.tr()),
                Expanded(
                    child: Text(
                  'ManagmentOfBlackOne'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
              Row(children: [
                Text('Two'.tr()),
                Expanded(
                    child: Text(
                  'ManagmentOfBlackTwo'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
              Row(children: [
                Text('Three'.tr()),
                Expanded(
                    child: Text(
                  'ManagmentOfBlackThree'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
              Row(children: [
                Text('Four'.tr()),
                Expanded(
                    child: Text(
                  'ManagmentOfBlackFour'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                Text('Five'.tr()),
                Expanded(
                    child: Text(
                  'ManagmentOfBlackFive'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
            ],
          ),
        ),
      ),
    );
  }
}
