import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Plow extends StatefulWidget {
  final String? name;
  final double n, p, k;
  const Plow(
      {super.key,
      required this.n,
      required this.p,
      required this.k,
      required this.name});

  @override
  State<Plow> createState() => _PlowState();
}

class _PlowState extends State<Plow> {
  FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String text, String languageCode) async {
    await flutterTts.setLanguage(languageCode.tr());
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('low phosphoreus recommendations'),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
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
            Container(
              padding: EdgeInsets.fromLTRB(60, 15, 0, 10),
              child: Text(
                'Your Input values are:\n\nNitrogen=${widget.n}\nPhosphorus=${widget.p}\nPotassium=${widget.k}\ncrop name=${widget.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                    'The phosphoreus value of your soil is low\n\nTake suggestions\n\n1. Bone meal -a fast acting source that is made from ground animal bones which is rich in phosphorous.\n\n2. applying a fertilizer with a high phosphorous content in the NPK ratio (example: 10-20-10, 20 being phosphorous percentage).\n\n3. adding quality organic compost to your soil will help increase phosphorous content.\n\n4. as with compost, manure can be an excellent source of phosphorous for your plants\n\n5. introducing clay particles into your soil can help retain & fix phosphorus deficiencies\n\n6. Ensure proper soil pH -having a pH in the 6.0 to 7.0 range has been scientifically proven to have the optimal phosphorus uptake in plants.\n\n7. If soil pH is low, add lime or potassium carbonate to the soil as fertilizers. Pure calcium carbonate is very effective in increasing the pH value of the soil.\n\n8. If pH is high, addition of appreciable amount of organic matter will help acidify the soil. Application of acidifying fertilizers, such as ammonium sulfate, can help lower soil pH')),
          ],
        ),
      )),
    );
  }
}
