import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Result extends StatefulWidget {
  final String res;
  Result({required this.res});
  //  Result(this.res, {Key key}):super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
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
    const _style = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 19,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Recomend result'),
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
                    height: 300,
                    width: 200,
                    padding: EdgeInsets.all(15.0),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://th.bing.com/th/id/OIP.R2wzdAV5WlW2kU6pAcBqHAHaFj?pid=ImgDet&rs=1") //NetworkImage
                          ), //DecorationImage
                    ), //BoxDecoration
                    child: Text(
                      "GeeksforGeeks",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ), //Text
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    padding: EdgeInsets.all(15.0),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://th.bing.com/th/id/OIP.R2wzdAV5WlW2kU6pAcBqHAHaFj?pid=ImgDet&rs=1") //NetworkImage
                          ), //DecorationImage
                    ), //BoxDecoration
                    child: Text(
                      "GeeksforGeeks",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ), //Text
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
