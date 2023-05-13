import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
    return Scaffold(
      body: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
            // top: ,
            width: w,
            height: h * 0.5,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                margin: EdgeInsets.all(w * 0.05),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: mangoDisease == ""
                        ? const AssetImage(
                            'assets/crop.png',
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
                      offset: Offset(-10, -10), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: h * 0.44,
            width: w,
            bottom: h * 0.0005,
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
                                    color: Color(0xFF7A6E6E).withOpacity(0.5),
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
    );
  }
}
