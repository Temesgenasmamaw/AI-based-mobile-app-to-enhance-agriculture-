import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'package:mango_app/fertilizer/fertilizerResul.dart';

import '../crop-result/barly-result.dart';
import '../crop-result/maize-result.dart';
import '../crop-result/teff-result.dart';
import '../crop-result/wheat-result.dart';
import '../fertilizer/KHigh.dart';
import '../fertilizer/Klow.dart';
import '../fertilizer/NHigh.dart';
import '../fertilizer/Nlow.dart';
import '../fertilizer/PHigh.dart';
import '../fertilizer/Plow.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final _cropKey = GlobalKey<FormState>();
  final _fertilizerKey = GlobalKey<FormState>();

  String? selectedValue = null;
  //crop recommendation
  final _pHController = TextEditingController();
  final _rainController = TextEditingController();
  final _altitudeController = TextEditingController();
  final _tempratureController = TextEditingController();

  //fertilizer recommendation
  final _nitrogenController = TextEditingController();
  final _phosphorusController = TextEditingController();
  final _potassiumeController = TextEditingController();
  final _cropNameController = TextEditingController();

  String add = '0';
  String crop = ' ';
  String fertilizer = ' ';
  FlutterTts flutterTts = FlutterTts();

  //dropdownItems
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Teff"), value: "Teff"),
      DropdownMenuItem(child: Text("Wheat"), value: "Wheat"),
      DropdownMenuItem(child: Text("maize"), value: "maize"),
      DropdownMenuItem(child: Text("Barley"), value: "Barley"),
    ];
    return menuItems;
  }

  @override
  void dispose() {
    _pHController;
    _rainController;
    _altitudeController;
    _tempratureController;
    _nitrogenController;
    _phosphorusController;
    _potassiumeController;
    _cropNameController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
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
                    'Fertilizer',
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
                key: _cropKey,
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
                        if (_cropKey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              });
                          print('getting url.....');
                          final response = await http.post(
                              Uri.parse(
                                  'https://ai-based-agri-app.onrender.com/predict'),
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
                          Navigator.of(context);
                          if (response.statusCode == 200) {
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
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: _fertilizerKey,
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
                      controller: _nitrogenController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        labelText: 'nitrogen'.tr(),
                        hintText: 'Enter nitrogen',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please Enter  nitrogen';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _phosphorusController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        labelText: 'phosphorus'.tr(),
                        hintText: 'Enter phosphorus',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please Enter phosphorus';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _potassiumeController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        labelText: 'potassium'.tr(),
                        hintText: 'Enter potassium',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please Enter potassium';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //drop down crop names

                    DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          // fillColor: Colors.blueAccent,
                        ),
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "can't empty";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        hint: Text('choose one crop'),
                        isExpanded: true,
                        dropdownColor: Colors.greenAccent,
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            });

                        if (_fertilizerKey.currentState!.validate()) {
                          print('getting url.....');
                          final response = await http.post(
                              Uri.parse(
                                  'https://ai-based-agri-app.onrender.com/fertilizer'),
                              headers: {"Content-Type": "application/json"},
                              body: jsonEncode(
                                <String, dynamic>{
                                  'nitrogen':
                                      double.parse(_nitrogenController.text),
                                  'phosphorus':
                                      double.parse(_phosphorusController.text),
                                  'potassium':
                                      double.parse(_potassiumeController.text),
                                  'cropname': selectedValue!,
                                },
                              ));
                          Navigator.pop(context);
                          if (response.statusCode == 200) {
                            setState(() {
                              fertilizer =
                                  jsonDecode(response.body)['fertilizer']
                                      .toString();
                            });

                            if (fertilizer == "Nlow") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Nlow(
                                          n: double.parse(
                                              _nitrogenController.text),
                                          p: double.parse(
                                              _phosphorusController.text),
                                          k: double.parse(
                                              _potassiumeController.text),
                                          name: selectedValue!)));
                            } else if (fertilizer == "NHigh") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NHigh(
                                          n: double.parse(
                                              _nitrogenController.text),
                                          p: double.parse(
                                              _phosphorusController.text),
                                          k: double.parse(
                                              _potassiumeController.text),
                                          name: selectedValue!)));
                            } else if (fertilizer == "Plow") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Plow(
                                          n: double.parse(
                                              _nitrogenController.text),
                                          p: double.parse(
                                              _phosphorusController.text),
                                          k: double.parse(
                                              _potassiumeController.text),
                                          name: selectedValue!)));
                            } else if (fertilizer == "PHigh") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PHigh(
                                          n: double.parse(
                                              _nitrogenController.text),
                                          p: double.parse(
                                              _phosphorusController.text),
                                          k: double.parse(
                                              _potassiumeController.text),
                                          name: selectedValue!)));
                            } else if (fertilizer == "Klow") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Klow(
                                          n: double.parse(
                                              _nitrogenController.text),
                                          p: double.parse(
                                              _phosphorusController.text),
                                          k: double.parse(
                                              _potassiumeController.text),
                                          name: selectedValue!)));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => KHigh(
                                          n: double.parse(
                                              _nitrogenController.text),
                                          p: double.parse(
                                              _phosphorusController.text),
                                          k: double.parse(
                                              _potassiumeController.text),
                                          name: selectedValue!)));
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
                            await flutterTts.speak("maizeDesc".tr());
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
                    child: Text("maizeDesc".tr(),
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
                            await flutterTts.speak("teffDesc".tr());
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
                    child: Text("teffDesc".tr(),
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
                            await flutterTts.speak("wheatDesc".tr());
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
                    child: Text("wheatDesc".tr(),
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
                            await flutterTts.speak("barleyDesc".tr());
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
                    child: Text("barleyDesc".tr(),
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
