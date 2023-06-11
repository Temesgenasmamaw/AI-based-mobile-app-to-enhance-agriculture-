import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Klow extends StatefulWidget {
   final String? name;
  final double n, p, k;
  const Klow(
      {super.key,
      required this.n,
      required this.p,
      required this.k,
      required this.name});

  @override
  State<Klow> createState() => _KlowState();
}

class _KlowState extends State<Klow> {
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
    return    Scaffold(
      appBar: AppBar(
        title: Text('Low potassium recommendations'),
      ),
      body: SingleChildScrollView(child: Center( child: Column(
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
            
          Container(padding: EdgeInsets.all(20), child: Text('The K value of your soil is low\n\nTake suggestions\n\n1.  Use Potash fertilizers since they contain high values potassium.\n\n2.  Mix in muricate of potash or sulphate of potash\n\n 3.  Bury banana peels an inch below the soils surface.\n\n4. Try kelp meal or seaweed')),
        ],
      )),),
    );
  }
}