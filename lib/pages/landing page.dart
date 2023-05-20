import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../chatBot2/chat2.dart';

class landingPage extends StatefulWidget {
  const landingPage({super.key});

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/icons.png'), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [Colors.black12, Colors.black54],
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(32),
            child: Container(
              margin: EdgeInsets.only(top: 60),
              child: ListView(
                children: [
                  // Marquee(
                  //   text: 'AI based Mobile App to Enhance Crop Productivity',
                  //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  //   scrollAxis: Axis.horizontal,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   blankSpace: 20.0,
                  //   velocity: 100.0,
                  //   pauseAfterRound: Duration(seconds: 1),
                  //   startPadding: 10.0,
                  //   accelerationDuration: Duration(seconds: 1),
                  //   accelerationCurve: Curves.linear,
                  //   decelerationDuration: Duration(milliseconds: 500),
                  //   decelerationCurve: Curves.easeOut,
                  // ),

                  //Carousel start
                  CarouselSlider(
                    // carouselController: CarouselController.,
                    items: [
                      //1st-->soil analysis content
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
                                image: NetworkImage(
                                    "https://sabiagrik.com/wp-content/uploads/2019/07/Soil-analy.jpg"),
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
                                        'analyse soil content ',
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
                      //2nd-->Planting horizontally
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
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/R.fd9ae2afe2d4b65788ec77d210c5789c?rik=dMFDvMI5aDwqxg&pid=ImgRaw&r=0"),
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
                                        'Planting horizontally ',
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
                      //3rd--detect plant disease
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
                                image: NetworkImage(
                                    "https://www.rtb.cgiar.org/wp-content/uploads/2018/06/Phone-App-2-630x421.png"),
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
                                        'detect disease ',
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
                      //4th-->spray pesticides
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
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/R.d851518fee6fb96448ea21deb6795864?rik=38lKiBVnfDNVmg&pid=ImgRaw&r=0"),
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
                                        'Spray insecticide & pesticide ',
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
                      //5th-->final result
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
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/OIP.kbr-QB-x8J6TE74JymSwxQHaLH?pid=ImgDet&rs=1"),
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
                                        'Get best result ',
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

                    //Slider Container properties
                    options: CarouselOptions(
                      height: 130.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      viewportFraction: 0.8,
                    ),
                  ),

                  //Carousel end
                  const SizedBox(height: 30),
                  Container(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' Boost Agricultural productivity',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.camera),
                            label: Text(
                              'Capture or upload photo',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                            )),
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.analytics),
                            label: Text(
                              'Analyse result',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                            )),
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.input),
                            label: Text(
                              'know suitable crops for farm land',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                            )),
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.info),
                            label: Text(
                              'Get info for type of disese',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                            )),
                        TextButton.icon(
                            onPressed: () {
                             
                            },
                            icon: Icon(Icons.info),
                            label: Text(
                              'know info for crops and fruits',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
