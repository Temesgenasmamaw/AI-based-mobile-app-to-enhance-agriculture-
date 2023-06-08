import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AnthMangoDisease extends StatefulWidget {
  const AnthMangoDisease({super.key});

  @override
  State<AnthMangoDisease> createState() => _AnthMangoDiseaseState();
}

class _AnthMangoDiseaseState extends State<AnthMangoDisease> {
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
        child: Container(
          margin: EdgeInsets.all(20),
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
                  image: AssetImage('assets/leafimages/anth.png'),
                ),
              
              const SizedBox(
                height: 30.0,
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
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
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
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
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
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
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
        ),
      ),
    );
  }
}
