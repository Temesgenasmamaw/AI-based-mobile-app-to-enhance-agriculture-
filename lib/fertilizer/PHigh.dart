import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PHigh extends StatefulWidget {
   final String? name;
  final double n, p, k;
  const PHigh(
      {super.key,
      required this.n,
      required this.p,
      required this.k,
      required this.name});

  @override
  State<PHigh> createState() => _PHighState();
}

class _PHighState extends State<PHigh> {
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
        title: Text('High phosphorus recommendations'),
      ),
     body: Center(child: SingleChildScrollView(child: Column(
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
            
         Container(padding: EdgeInsets.all(20), child: Text('Your phosphorus is high and take following suggesions.\n\n1. Avoid adding manure- manure contains many key nutrients for your soil but typically including high levels of phosphorous. Limiting the addition of manure will help reduce phosphorus being added.\n\n2. Use only phosphorus-free fertilizer - if you can limit the amount of phosphorous added to your soil, you can let the plants use the existing phosphorus while still providing other key nutrients such as Nitrogen and Potassium. Find a fertilizer with numbers such as 10-0-10, where the zero represents no phosphorous.\n\n3. Water your soil - soaking your soil liberally will aid in driving phosphorous out of the soil. This is recommended as a last ditch effort.\n\n4. Plant nitrogen fixing vegetables to increase nitrogen without increasing phosphorous like beans and peas.\n\n5. Use crop rotations to decrease high phosphorous levels'),),
       ],
     ),)),
    );
  }
}