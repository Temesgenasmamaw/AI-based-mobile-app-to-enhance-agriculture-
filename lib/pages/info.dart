import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';
import '../utils/description.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  static TextStyle optionStyle1 = TextStyle(
      fontSize: 21, fontWeight: FontWeight.bold, color: Colors.grey[600]);
  static final List<Widget> _widgetList = <Widget>[
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Causes".tr(),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          "DefinitionOfAnth".tr(),
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
          children: [Expanded(child: Text("Symptom".tr()))],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text("LifeCycle".tr(), style: optionStyle1),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          'Perennation'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
              child: Text(
            'DefOfA'.tr(),
            textAlign: TextAlign.justify,
          ))
        ]),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          'PrimaryInfection'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(children: [
          Expanded(
              child: Text(
            'DefOfB'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          'SecondaryInfection'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(children: [
          Expanded(
              child: Text(
            'DefOfC'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
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
            'ManagmentOfAnthOne'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Two'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfAnthTwo'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Three'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfAnthThree'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Four'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfAnthFour'.tr(),
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
            'ManagmentOfAnthFive'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "DefinitionOfWhite".tr(),
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
              "SymptomOfWhite".tr(),
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
            'ManagmentOfWhiteOne'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Two'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfWhiteTwo'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Three'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfWhiteThree'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("HealthyDefinition".tr(), style: optionStyle1),
        const SizedBox(
          height: 10.0,
        ),
      ],
    ),
  ];
  Map desc = {
    'ANTH'.tr(): _widgetList[0],
    'BLAC'.tr(): _widgetList[1],
    'WHITE'.tr(): _widgetList[2],
    'HEAL'.tr(): _widgetList[3],
  };

  @override
  Widget build(BuildContext context) {
    DisInfo instance = ModalRoute.of(context)!.settings.arguments as DisInfo;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF61A1D5),
        title: Text('More'.tr()),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/leafimages/${instance.pic}'),
                  radius: 60,
                ),
              ),
              const Divider(
                height: 60.0,
                color: Colors.amber,
              ),
              Text('Name'.tr(),
                  style: TextStyle(
                      color: Colors.grey[600],
                      letterSpacing: 2.0,
                      fontSize: 24,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 10.0),
              Text(instance.ManDisease.tr(),
                  style: TextStyle(
                      color: Colors.orange[700],
                      letterSpacing: 2.0,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 30.0),
              desc[instance.ManDisease.tr()],
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
