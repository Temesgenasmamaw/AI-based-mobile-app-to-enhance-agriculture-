import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class KHigh extends StatefulWidget {
   final String? name;
  final double n, p, k;
  const KHigh(
      {super.key,
      required this.n,
      required this.p,
      required this.k,
      required this.name});

  @override
  State<KHigh> createState() => _KHighState();
}

class _KHighState extends State<KHigh> {
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
        title: Text('High potassium recommendations'),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                          await flutterTts.speak("What Is Mango".tr());
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
                child: Text('''The K value of your soil is high\n\n 
                    Take Suggestions\n\n1. Use NPK fertilizers with low K levels and organic fertilizers since they have low NPK values\n\n2. Mix crushed eggshells, crushed seashells, wood ash or soft rock phosphate to the soil to add calcium. Mix in up to 10 percent of organic compost to help amend and balance the soil.\n\n3. Stop applying potassium-rich commercial fertilizer. Apply only commercial fertilizer that has a '0' in the final number field. Commercial fertilizers use a three number system for measuring levels of nitrogen, phosphorous and potassium. The last number stands for potassium. Another option is to stop using commercial fertilizers all together and to begin using only organic matter to enrich the soil\n\n4. Allow the soil to fully dry, and repeat digging and watering the soil two or three more times.\n\n5. <i>Loosen the soil</i> deeply with a shovel, and water thoroughly to dissolve water-soluble potassium. Allow the soil to fully dry, and repeat digging and watering the soil two or three more times.\n\n6. '''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
