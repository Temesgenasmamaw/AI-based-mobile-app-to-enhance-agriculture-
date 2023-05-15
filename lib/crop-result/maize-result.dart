import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class maizeResult extends StatefulWidget {
  final String res;
  maizeResult({required this.res});
  //  maizeResult(this.res, {Key key}):super(key: key);

  @override
  State<maizeResult> createState() => _maizeResultState();
}

class _maizeResultState extends State<maizeResult> {
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
        title: Text('Recomended Maize Result'),
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
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Container(
                    //height: 100,
                    // width: 200,
                    height: MediaQuery.of(context).size.height / 2.5,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'plough the land 3 times \n\n add in-organic fertilizer ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.visible,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('teff detial')
                            ],
                          ),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Container(
                    // height: 100,
                    // width: 200,
                    height: MediaQuery.of(context).size.height / 2.5,
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
                  // Container(
                  //   height: 200,
                  //   width: 200,
                  //   padding: EdgeInsets.all(15.0),
                  //   alignment: Alignment.bottomCenter,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: NetworkImage(
                  //             "https://th.bing.com/th/id/OIP.R2wzdAV5WlW2kU6pAcBqHAHaFj?pid=ImgDet&rs=1") //NetworkImage
                  //         ), //DecorationImage
                  //   ), //BoxDecoration
                  //   child: Text(
                  //     "GeeksforGeeks",
                  //     style: TextStyle(color: Colors.white, fontSize: 20.0),
                  //   ), //Text
                  // ),

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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ethiopian Teff Stack widget is a built-in widget in flutter SDK which allows us to make a layer of widgets by putting them on top of each other.Many of the times a simple row and column layout is not enough, we need a way to overlay one widget on top of the other, for example, we might want to show some text over an image, so to tackle such',
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
                height: 30,
              ),
              Stack(
                children: [
                  Container(
                    // height: 100,
                    // width: 200,
                    height: MediaQuery.of(context).size.height / 2.5,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ethiopian Teff Stack widget is a built-in widget in flutter SDK which allows us to make a layer of widgets by putting them on top of each other.Many of the times a simple row and column layout is not enough, we need a way to overlay one widget on top of the other, for example, we might want to show some text over an image, so to tackle such',
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
                height: 30,
              ),
              Stack(
                children: [
                  Container(
                    // height: 100,
                    // width: 200,
                    height: MediaQuery.of(context).size.height / 2.5,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ethiopian Teff Stack widget is a built-in widget in flutter SDK which allows us to make a layer of widgets by putting them on top of each other.Many of the times a simple row and column layout is not enough, we need a way to overlay one widget on top of the other, for example, we might want to show some text over an image, so to tackle such',
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
                height: 30,
              ),
              Stack(
                children: [
                  Container(
                    // height: 100,
                    // width: 200,
                    height: MediaQuery.of(context).size.height / 2.5,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ethiopian Teff Stack widget is a built-in widget in flutter SDK which allows us to make a layer of widgets by putting them on top of each other.Many of the times a simple row and column layout is not enough, we need a way to overlay one widget on top of the other, for example, we might want to show some text over an image, so to tackle such',
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
          ),
        ),
      ),
    );
  }
}
