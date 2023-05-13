import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
// import 'package:toast/toast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final _formKey = GlobalKey<FormState>();
  final _pHController = TextEditingController();
  final _rainController = TextEditingController();
  final _altitudeController = TextEditingController();
  final _tempratureController = TextEditingController();

  String add = '0';
  String crop = ' ';
  bool isSelect = false;

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
    _pHController;
    _rainController;
    _altitudeController;
    _tempratureController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget okButton = TextButton(
      child: Text(
        "ok",
        style: TextStyle(color: Colors.cyan, fontSize: 17),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: TextStyle(color: Colors.cyan, fontSize: 17),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              // title: const Text('Tabs Demo'),
              pinned: true,
              floating: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/crop.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                      child: Text(
                    'Recommend',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),
                  Tab(
                      child: Text(
                    'Bokolo',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),
                  Tab(
                      child: Text(
                    'Teff',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),
                  Tab(
                      child: Text(
                    'Sinde',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),
                  Tab(
                      child: Text(
                    'Gebs',
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
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Fill input values',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _pHController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        labelText: 'Ph'.tr(),
                        hintText: 'Enter pH value(0-14)',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please Enter correct pH value';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _rainController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        labelText: 'rain'.tr(),
                        hintText: 'Enter Rain fall value',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please Enter Rain fall value';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _tempratureController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        labelText: 'temp'.tr(),
                        hintText: 'Enter Temprature value',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please Enter Temprature value';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _altitudeController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        labelText: 'altitude'.tr(),
                        hintText: 'Enter altitude value in metre',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please Enter altitude ';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // TextFormField(
                    //   controller: _emailController,
                    //   keyboardType: TextInputType.emailAddress,
                    //   decoration: const InputDecoration(
                    //     prefixIcon: Icon(Icons.person),
                    //     border: OutlineInputBorder(
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(40))),
                    //     labelText: 'Email',
                    //     hintText: 'Enter your email',
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter your email';
                    //     }
                    //     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    //         .hasMatch(value)) {
                    //       return 'Please enter a valid email';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // TextFormField(
                    //   controller: _passwordController,
                    //   obscureText: true,
                    //   decoration: const InputDecoration(
                    //     prefixIcon: Icon(Icons.person),
                    //     border: OutlineInputBorder(
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(40))),
                    //     labelText: 'Password',
                    //     hintText: 'Enter your password',
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter your password';
                    //     }
                    //     if (value.length < 6) {
                    //       return 'Password must be at least 6 characters long';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // TextFormField(
                    //   controller: _departmentController,
                    //   decoration: const InputDecoration(
                    //     prefixIcon: Icon(Icons.person),
                    //     border: OutlineInputBorder(
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(40))),
                    //     labelText: 'Department',
                    //     hintText: 'Enter your department',
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter your department';
                    //     }
                    //     return null;
                    //   },
                    // ),

                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () async {
                    //     if (_formKey.currentState!.validate()) {
                    //       print('getting url.....');
                    //       final response = await http.post(
                    //           Uri.parse(
                    //               'https://smart-agri-kawo.onrender.com/add'),
                    //           headers: {"Content-Type": "application/json"},
                    //           body: jsonEncode(
                    //             <String, dynamic>{
                    //               'Pregnancies': int.parse(_pHController.text),
                    //               'Glucose': int.parse(_rainController.text),
                    //               'BloodPressure':
                    //                   int.parse(_altitudeController.text),
                    //               'SkinThickness':
                    //                   int.parse(_tempratureController.text),
                    //             },
                    //           ));

                    //       if (response.statusCode == 200) {
                    //         // Parse the predicted class from the JSON response
                    //         // final results = jsonDecode(response.body)['result'];
                    //         setState(() {
                    //           add = jsonDecode(response.body)['add'].toString();
                    //         });
                    //       } else {
                    //         // Handle errors
                    //         print(
                    //             'Request failed with status: ${response.statusCode}.');
                    //       }
                    //       print('predicted value:${add}');
                    //     }
                    //   },
                    //   child: const Text(
                    //     'Add',
                    //     style: TextStyle(
                    //         fontSize: 25, fontWeight: FontWeight.bold),
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //       backgroundColor: Colors.white,
                    //       foregroundColor: Colors.black),
                    // ),

                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Text('Add Result:${add}'),

                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          print('getting url.....');
                          final response = await http.post(
                              Uri.parse(
                                  'https://smart-agri-kawo.onrender.com/predict'),
                              headers: {"Content-Type": "application/json"},
                              body: jsonEncode(
                                <String, dynamic>{
                                  'ph': double.parse(_pHController.text),
                                  'rain fall':
                                      double.parse(_rainController.text),
                                  'temprature':
                                      double.parse(_tempratureController.text),
                                  'altitude':
                                      double.parse(_altitudeController.text),
                                },
                              ));

                          if (response.statusCode == 200) {
                            // Parse the predicted class from the JSON response
                            // final results = jsonDecode(response.body)['result'];
                            setState(() {
                              crop = jsonDecode(response.body)['predict']
                                  .toString();
                            });
                          } else {
                            // Handle errors
                            print(
                                'Request failed with status: ${response.statusCode}.');
                          }
                          print('predicted value:${crop}');
                        }
                      },
                      child: const Text(
                        'Recommend ',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black),
                    ),

                    SizedBox(
                      height: 20,
                    ),

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
                            // 'gender': 'male',
                          });
                          // await flutterTts.setLanguage('am-ET');

                          await flutterTts.speak(
                              "${crop} is suitable crop for your farmland");
                        },
                        icon: const Icon(
                          Icons.volume_up,
                          size: 25,
                        )),

                    Text(
                      '${crop} ',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                    Text(
                      'recommendResult'.tr(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                            await flutterTts
                                .speak("info about maize is comming soon".tr());
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
                    padding: EdgeInsets.fromLTRB(12, 30, 3, 0),
                    child: Text("info about maize is comming soon".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                            await flutterTts
                                .speak("info about teff is comming soon".tr());
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
                    padding: EdgeInsets.fromLTRB(12, 30, 3, 0),
                    child: Text("nfo about teff is comming soon".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                            await flutterTts
                                .speak("info about wheat is comming soon".tr());
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
                    padding: EdgeInsets.fromLTRB(12, 30, 3, 0),
                    child: Text("info about maize is wheat soon".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                            await flutterTts
                                .speak("info about barly is comming soon".tr());
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
                    padding: EdgeInsets.fromLTRB(12, 30, 3, 0),
                    child: Text("info about barly is comming soon".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
