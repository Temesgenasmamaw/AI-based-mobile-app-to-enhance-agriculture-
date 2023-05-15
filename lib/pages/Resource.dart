import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Resource extends StatefulWidget {
  const Resource({Key? key}) : super(key: key);

  @override
  State<Resource> createState() => _ResourceState();
}

class _ResourceState extends State<Resource> {
  FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String text, String languageCode) async {
    await flutterTts.setLanguage(languageCode.tr());
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(text);
  }

  static TextStyle optionStyle1 = TextStyle(
      fontSize: 19, fontWeight: FontWeight.bold, color: Colors.grey[600]);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(
              5.0,
              5.0,
            ),
            color: Color(0xFF575555),
            blurRadius: 10.0,
            spreadRadius: 5, //New
          ),
        ],
      ),
      width: double.maxFinite,
      height: h,
      //padding: EdgeInsets.all(5),
      child: Card(
        elevation: 80,
        child: Scaffold(
            body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/mango2.png",
                fit: BoxFit.fitWidth,
                height: 100,
                width: 600,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        print(flutterTts.getVoices);
                        await flutterTts.setSpeechRate(0.5);
                        await flutterTts.setPitch(1.0);
                        await flutterTts.setVolume(1.0);
                        await flutterTts.speak("WhatIsMango".tr());
                      },
                      icon: const Icon(
                        Icons.volume_up,
                        size: 25,
                      )),
                  //ElevatedButton(onPressed: (){}, child:const Text('speak')),

                  IconButton(
                      onPressed: () async {
                        await flutterTts.stop();
                      },
                      icon: const Icon(
                        Icons.volume_off,
                        size: 25,
                      )),
                ],
              ),
              Center(
                child: Text("Mango".tr(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
              ),
              Divider(
                color: Color.fromARGB(255, 18, 17, 17),
                indent: 150,
                endIndent: 151,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "WhatIsMango".tr(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text("Taxonomy".tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 21)),
              ),
              const Divider(
                color: Color.fromARGB(255, 18, 17, 17),
                indent: 150,
                endIndent: 151,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Taxo".tr(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text("Toxicities".tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 21)),
              ),
              const Divider(
                color: Color.fromARGB(255, 18, 17, 17),
                indent: 150,
                endIndent: 151,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [Expanded(child: Text("Toxicity".tr()))],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text("Use".tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 21)),
              ),
              const Divider(
                color: Color.fromARGB(255, 18, 17, 17),
                indent: 150,
                endIndent: 151,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Uses".tr(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Advantages".tr(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'PreventsAnemia'.tr(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(children: [
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                    child: Text(
                  'DefOfPreventsAnemia'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'ImprovesDigestion'.tr(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(children: [
                Expanded(
                    child: Text(
                  'DefOfImprovesDigestion'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'HelpsGainWeight'.tr(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(children: [
                Expanded(
                    child: Text(
                  'DefOfHelpsGainWeight'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'BoostsImmunity'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(children: [
                Expanded(
                    child: Text(
                  'DefOfBoostsImmunity'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'ImprovesEyesight'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(children: [
                Expanded(
                    child: Text(
                  'DefOfImprovesEyesight'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'HeartHealthy'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(children: [
                Expanded(
                    child: Text(
                  'DefOfHeartHealthy'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'LeaveUse'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'DecreaseBloodPressure'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(children: [
                Expanded(
                    child: Text(
                  'DefOfdecbloodP'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'ControllDiabet'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(children: [
                Expanded(
                    child: Text(
                  'DefOfControllDiabet'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'EliminateRadical'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(children: [
                Expanded(
                    child: Text(
                  'DefEliminateRadical'.tr(),
                  textAlign: TextAlign.justify,
                ))
              ], crossAxisAlignment: CrossAxisAlignment.start),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
