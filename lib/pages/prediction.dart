import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_tts/flutter_tts.dart';
import '../utils/description.dart';

class Prediction extends StatefulWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  State<Prediction> createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  static TextStyle optionStyle1 = TextStyle(
      fontSize: 21, fontWeight: FontWeight.bold, color: Colors.grey[600]);
  // final _flutterTts = FlutterTts();
  bool isSpeaking = false;

  static final List<Widget> _widgetList = <Widget>[
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Prevention".tr(), style: optionStyle1),
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
        Text("Prevention".tr(), style: optionStyle1).tr(),
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
        Text("Prevention".tr(), style: optionStyle1).tr(),
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
        Row(children: [
          Text('Four'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfWhiteFour'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Five'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfWhiteFive'.tr(),
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
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("NotMangoDefinition".tr(), style: optionStyle1),
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
    'NOT'.tr(): _widgetList[4],
  };

  @override
  Widget build(BuildContext context) {
    DisInfo instance = ModalRoute.of(context)!.settings.arguments as DisInfo;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 97, 161, 213),
        title: const Text('Prevention').tr(),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ElevatedButton(
              //     onPressed: () {
              //       isSpeaking ? stop() : speak();
              //     },
              //     child: Text(isSpeaking ? "stop" : "speak")),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                height: 200,
                width: 900,
                // AssetImage('assets/leafimages/${instance.pic}'),
                child: Image.asset('assets/leafimages/${instance.pic}'),
              ),
              const Divider(
                height: 30.0,
                color: Colors.amber,
              ),
              Text('Name'.tr(),
                  style: TextStyle(
                      color: Colors.grey[600],
                      letterSpacing: 2.0,
                      fontSize: 21,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 10.0),
              Text(instance.ManDisease.tr(),
                  style: TextStyle(
                      color: Colors.orange[700],
                      letterSpacing: 2.0,
                      fontSize: 21.0,
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
