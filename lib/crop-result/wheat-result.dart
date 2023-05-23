import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class wheatResult extends StatefulWidget {
  final String res;
  wheatResult({required this.res});
  //  wheatResult(this.res, {Key key}):super(key: key);

  @override
  State<wheatResult> createState() => _wheatResultState();
}

class _wheatResultState extends State<wheatResult> {
  FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String text, String languageCode) async {
    await flutterTts.setLanguage(languageCode.tr());
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const _style = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 19,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Recomend wheatResult'),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 30)),
              IconButton(
                  padding: EdgeInsets.only(right: 0),
                  onPressed: () async {
                    print(flutterTts.getVoices);
                    await flutterTts.setSpeechRate(0.3);
                    await flutterTts.setPitch(1.0);
                    await flutterTts.setVolume(1.0);
                    await flutterTts.setVoice({
                      'language': 'am-ET',
                      'variant': 'en-in-x-ene-network',
                    });
                    await flutterTts.speak(
                        "${widget.res} is suitable crop for your farmland");
                  },
                  icon: const Icon(
                    Icons.volume_up,
                    size: 29,
                  )),
              Text(
                '${widget.res}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text('is suitable crop for your farmland', style: _style),
              Stack(
                children: [
                  Container(
                    // height: 100,
                    // width: 200,
                    height: MediaQuery.of(context).size.height / 3,
                    padding: EdgeInsets.all(15.0),
                    alignment: Alignment.bottomCenter,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(1.0, 1.0),
                          blurRadius: 10.0,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/wheat.jpg"),
                        fit: BoxFit.cover,
                      ), //DecorationImage
                    ), //BoxDecoration
                    //Text
                  ),
                  Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 36,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 10, 8, 8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Wheat',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
