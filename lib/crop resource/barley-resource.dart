import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class barlyResource extends StatefulWidget {
  // barlyResource({required this.res});
  barlyResource({Key? key}) : super(key: key);

  @override
  State<barlyResource> createState() => _barlyResourceState();
}

class _barlyResourceState extends State<barlyResource> {
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

  String _resourceBarley = '_resourceBarley'.tr();

  @override
  Widget build(BuildContext context) {
    const _style = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 19,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Recomend barlyResource'),
        actions: [],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
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
                        await flutterTts.speak("${_resourceBarley}");
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
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Stack(
                      //   children: [
                      //     Container(
                      //       // height: 100,
                      //       width: 200,
                      //       height: MediaQuery.of(context).size.height / 5,
                      //       padding: EdgeInsets.all(15.0),
                      //       alignment: Alignment.bottomCenter,

                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(20),
                      //         boxShadow: [
                      //           BoxShadow(
                      //             color: Colors.black54,
                      //             offset: Offset(1.0, 1.0),
                      //             blurRadius: 10.0,
                      //           ),
                      //         ],
                      //         image: DecorationImage(
                      //           image: AssetImage("assets/wheat.jpg"),
                      //           fit: BoxFit.cover,
                      //         ), //DecorationImage
                      //       ), //BoxDecoration
                      //       //Text
                      //     ),
                      //     Positioned(
                      //         bottom: 0,
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Container(
                      //             width: MediaQuery.of(context).size.width - 36,
                      //             padding: EdgeInsets.all(10),
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(15),
                      //                 color: Color.fromARGB(255, 10, 8, 8)),
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   'Wheat',
                      //                   style: TextStyle(
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.bold,
                      //                   ),
                      //                   overflow: TextOverflow.visible,
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ))
                      //   ],
                      // ),

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
                                        'fertilizer and Barley ',
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
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/R.7212d590e5ecd0bee60df2437b73f3d8?rik=9PJkkFyO2smMUA&pid=ImgRaw&r=0"),
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
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/R.7435ab81d8ce0b28c01b1697e5bbc74f?rik=Ob8ZWeehk2G%2bEQ&pid=ImgRaw&r=0"),
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
              SizedBox(
                height: 15,
              ),
              Text(
                '${_resourceBarley}',
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
