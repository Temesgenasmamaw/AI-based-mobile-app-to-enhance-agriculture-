import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../disease info/anth.dart';
import '../disease info/black.dart';
import '../disease info/powdery.dart';
import '../disease info/white.dart';
import '../dl_model/processing_model.dart';
import '../utils/description.dart';
import 'select_screen.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  void initState() {
    super.initState();
  }

  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
      final outputs = await classifier.classifyImage(_image);
      //print("Final output $outputs ......................");
      setState(() {
        mangoDisease = outputs![0]['label'].toString();
      });
    } catch (a) {
      // print(e);
      Navigator.of(context).pop();
    }
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  List<DisInfo> disease = [
    DisInfo(ManDisease: 'ANTH'.tr(), pic: 'anth.png'),
    DisInfo(ManDisease: 'BLAC'.tr(), pic: 'black.png'),
    DisInfo(ManDisease: 'WHITE'.tr(), pic: 'heal.png'),
    DisInfo(ManDisease: 'HEAL'.tr(), pic: 'heal.png')
  ];

  solutionOne(m) {
    switch (m) {
      case 'Anthracnose Disease':
        DisInfo instance = disease[0];
        Navigator.pushNamed(context, '/Prediction', arguments: instance);
        break;
      case 'Powdery Mildew Disease':
        DisInfo instance = disease[1];
        Navigator.pushNamed(context, '/Prediction', arguments: instance);
        break;
      case 'White Scale Disease':
        DisInfo instance = disease[2];
        Navigator.pushNamed(context, '/Prediction', arguments: instance);
        break;
    }
  }

  final Classifier classifier = Classifier();

  String mangoDisease = "";
  String confidence = "";
  late int index;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    // DisInfo? instance = ModalRoute.of(context)!.settings.arguments as DisInfo?;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                // title: const Text('Tabs Demo'),
                pinned: true,
                floating: true,
                expandedHeight: 150.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/bottom.jfif',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Color.fromARGB(255, 255, 196, 68),
                  indicatorWeight: 10,
                  indicatorPadding: EdgeInsets.all(5),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                        child: Text(
                      'Disease ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )),
                    Tab(
                        child: Text(
                      'Diagnosis',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(children: <Widget>[
            Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  // top: ,
                  width: w,
                  height: h * 0.4,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      margin: EdgeInsets.all(w * 0.05),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: mangoDisease == ""
                              ? const AssetImage(
                                  'assets/select.jpg',
                                ) as ImageProvider
                              : FileImage(
                                  File(_image!.path),
                                ),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: Colors.red,
                          width: 2,
                        ),
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF7A6E6E).withOpacity(0.5),
                            spreadRadius: 8,
                            blurRadius: 5,
                            offset:
                                Offset(-10, -10), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: h * 0.44,
                  width: w,
                  // bottom: h * 0.0005,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * 0.05,
                        ),
                        Card(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10, bottom: 15),
                                child: Text(
                                  mangoDisease == ""
                                      ? ""
                                      : " $mangoDisease", //$confidence%
                                  style: const TextStyle(
                                    fontSize: 21.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              if (mangoDisease != 'Healthy Mango' &&
                                  mangoDisease != 'Not Mango' &&
                                  mangoDisease != "")
                                GestureDetector(
                                  onTap: () {
                                    solutionOne(mangoDisease);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFF7A6E6E)
                                              .withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    width: 300,
                                    height: 60,
                                    child: Card(
                                      elevation: 10,
                                      shadowColor: Color(0xFF0B0468),
                                      child: Center(
                                        child: Text(
                                          "Solution".tr(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * 0.045,
                        ),
                        SizedBox(
                          width: w * 0.97,
                          child: ElevatedButton(
                            onPressed: () async {
                              _showSelectPhotoOptions(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                  "TakePhoto".tr(),
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GridView(
              // scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
              ),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnthMangoDisease()));
                  },
                  child: Stack(
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
                            image: AssetImage('assets/leafimages/anth.png'),
                            fit: BoxFit.cover,
                          ), //DecorationImage
                        ), //BoxDecoration
                        //Text
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 10, 8, 8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Anthracnose',
                                    style: TextStyle(
                                      fontSize: 14,
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
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WhiteMangoDisease()));
                  },
                  child: Stack(
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
                            image: AssetImage('assets/leafimages/white.jpg'),
                            fit: BoxFit.cover,
                          ), //DecorationImage
                        ), //BoxDecoration
                        //Text
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 10, 8, 8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'white scale',
                                    style: TextStyle(
                                      fontSize: 16,
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
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlackMangoDisease()));
                  },
                  child: Stack(
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
                            image: AssetImage('assets/leafimages/black.png'),
                            fit: BoxFit.cover,
                          ), //DecorationImage
                        ), //BoxDecoration
                        //Text
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 10, 8, 8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Black suit',
                                    style: TextStyle(
                                      fontSize: 16,
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
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PowderyMangoDisease()));
                  },
                  child: Stack(
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
                            image: AssetImage('assets/leafimages/powdery.jpg'),
                            fit: BoxFit.cover,
                          ), //DecorationImage
                        ), //BoxDecoration
                        //Text
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 10, 8, 8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Powdery',
                                    style: TextStyle(
                                      fontSize: 16,
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
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => barlyResult(
                    //               res: 'Barley',
                    //             )));
                  },
                  child: Stack(
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
                                "https://th.bing.com/th/id/OIP.6iaLrjvK1xo_KuSAyN6jMgHaEo?pid=ImgDet&rs=1"),
                            fit: BoxFit.cover,
                          ), //DecorationImage
                        ), //BoxDecoration
                        //Text
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 10, 8, 8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'wheate disease',
                                    style: TextStyle(
                                      fontSize: 16,
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
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
