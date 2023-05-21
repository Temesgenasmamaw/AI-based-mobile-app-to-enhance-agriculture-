import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;

import '../crop-result/barly-result.dart';
import '../crop-result/maize-result.dart';
import '../crop-result/teff-result.dart';
import '../crop-result/wheat-result.dart';

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
  FlutterTts flutterTts = FlutterTts();

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
                    'Maize',
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
                    'Wheat',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),
                  Tab(
                      child: Text(
                    'Barly',
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
                        if (value!.isEmpty ||
                            double.parse(value) > 14 ||
                            double.parse(value) < 0) {
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
                        hintText: 'Enter Rain fall in mm',
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
                        hintText: 'Enter Temprature in Celsius',
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
                        hintText: 'Enter altitude in metre',
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

                            if (crop == "Sinde") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          wheatResult(res: 'Wheat/' + crop)));
                            } else if (crop == "Teff") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          teffResult(res: crop)));
                            } else if (crop == 'Gebs') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          barlyResult(res: 'Barley/' + crop)));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          maizeResult(res: 'Maize/' + crop)));
                            }
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
