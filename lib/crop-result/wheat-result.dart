import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class wheatResult extends StatefulWidget {
  final String res;
  wheatResult({required this.res});

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

  String _resourceWheat = '_resourceWheat'.tr();
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
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 30)),
              Row(
                children: [
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
                        await flutterTts.speak("${_resourceWheat}");
                      },
                      icon: const Icon(
                        Icons.volume_up,
                        size: 29,
                      )),
                  IconButton(
                      onPressed: () => flutterTts.stop(),
                      icon: const Icon(
                        Icons.volume_off,
                        size: 29,
                      ))
                ],
              ),
              Row(
                children: [
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
                        await flutterTts
                            .speak("wheatResult".tr() + _resourceWheat);
                      },
                      icon: const Icon(
                        Icons.volume_up,
                        size: 29,
                      )),
                  IconButton(
                      onPressed: () => flutterTts.stop(),
                      icon: const Icon(
                        Icons.volume_off,
                        size: 29,
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${widget.res}'.tr(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text('recommendResult'.tr(), style: _style),
              SizedBox(
                height: 35,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Container(
                            // height: 100,
                            width: 200,
                            height: MediaQuery.of(context).size.height / 5,
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
                                image: AssetImage("assets/wheat.jpg"),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                      SizedBox(
                        width: 50,
                      ),
                      Stack(
                        children: [
                          Container(
                            //height: 100,
                            width: 200,
                            height: MediaQuery.of(context).size.height / 5,
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
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/OIP.6fedq9nlGdtwEU8Rj7g_AgHaFj?pid=ImgDet&rs=1"),
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
                                  width: MediaQuery.of(context).size.width - 20,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromARGB(255, 10, 8, 8)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'plow the land 3 times ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.visible,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Stack(
                        children: [
                          Container(
                            // height: 100,
                            width: 200,
                            height: MediaQuery.of(context).size.height / 5,
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
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/OIP.ztKl1kpaCcji27Qf56SphwHaFj?pid=ImgDet&rs=1"),
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
                                  width: MediaQuery.of(context).size.width - 30,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromARGB(255, 10, 8, 8)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'prepare organic fertilizer',
                                        style: TextStyle(
                                          // fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Stack(
                        children: [
                          Container(
                            // height: 100,
                            width: 200,
                            height: MediaQuery.of(context).size.height / 5,
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
                                image: NetworkImage(
                                    "https://pbs.twimg.com/media/ChmQN4qXEAAL_zS.jpg"),
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
                                  width: MediaQuery.of(context).size.width - 30,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromARGB(255, 10, 8, 8)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'planting fertilizer and wheat ',
                                        style: TextStyle(
                                          // fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        // overflow: TextOverflow.visible,
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Stack(
                        children: [
                          Container(
                            // height: 100,
                            width: 200,
                            height: MediaQuery.of(context).size.height / 5,
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
                                image: AssetImage("assets/teffWedding.jfif"),
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
                                  width: MediaQuery.of(context).size.width - 30,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromARGB(255, 10, 8, 8)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'spary chemicals ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        // overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Stack(
                        children: [
                          Container(
                            // height: 100,
                            width: 200,
                            height: MediaQuery.of(context).size.height / 5,
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
                                image: AssetImage("assets/wheatHarvest.jfif"),
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
                                  width: MediaQuery.of(context).size.width - 30,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromARGB(255, 10, 8, 8)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'harvesting ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        // overflow: TextOverflow.visible,
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ],
                  )),
              Text(
                '${_resourceWheat}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
