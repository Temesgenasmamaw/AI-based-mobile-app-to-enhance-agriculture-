import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Nlow extends StatefulWidget {
  final String? name;
  final double n, p, k;
  const Nlow(
      {super.key,
      required this.n,
      required this.p,
      required this.k,
      required this.name});

  @override
  State<Nlow> createState() => _NlowState();
}

class _NlowState extends State<Nlow> {
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
        title: Text('Low Nitrogen Recommendations'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              // padding: EdgeInsets.all(20),
              child: Text(
                '\nAccording to the input value, Nitrogen level of the soil is low. \n\n\t\t\t\t\t\tTake the following suggesions.\n\n1.Plant Nitrogen fixing plants like peas or beans..\n\n2. Plant heavy nitrogen feeding plants- tomatoes, corn, broccoli, cabbage and spinach are examples of plants that thrive off nitrogen and will suck the nitrogen dry.\n\n3. soaking your soil with water will help leach the nitrogen deeper into your soil, effectively leaving less for your plants to use.\n\n4. Add composted manure to the soil.\n\n5. adding manure is one of the simplest ways to amend your soil with nitrogen. Be careful as there are various types of manures with varying degrees of nitrogen.\n\n6. Use NPK fertilizers with high N value.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
