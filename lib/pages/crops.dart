import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'package:text_to_speech/text_to_speech.dart';

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
  TextToSpeech tts = TextToSpeech();

  //dropdownItems
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Barley"), value: "Barley"),
      DropdownMenuItem(child: Text("Maize"), value: "Maize"),
      DropdownMenuItem(child: Text("Teff"), value: "Teff"),
      DropdownMenuItem(child: Text("Wheat"), value: "Wheat"),
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
      length: 2,
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
                  'assets/bottom.jfif',
                  fit: BoxFit.fitWidth,
                ),
              ),
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Color.fromARGB(255, 255, 196, 68),
                indicatorWeight: 10,
                indicatorPadding: EdgeInsets.all(5),
                // indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                      child: Text(
                    'Crop recommendation',
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
                      controller: _pHController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      autocorrect: true,
                      decoration: InputDecoration(
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
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.person),
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
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.person),
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
                      // textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.person),
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

                          final response = await http.post(
                              Uri.parse(
                                  'https://smart-agriculture.up.railway.app/predict'),
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
                          Navigator.pop(context);
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
                            // Navigator.of(context);
                          } else {
                            // Handle errors
                            print(
                                'Request failed with status: ${response.statusCode}.');
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // title: Text(" ${message}"),
                                    content: Text("${response.statusCode}"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("okay"),
                                        ),
                                      ),
                                    ],
                                  );
                                });
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
                    ElevatedButton(
                        onPressed: () async {
                          await listVoicesAndLanguages();
                        },
                        child: Text('language'))
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
                      'Fill input values in kg/ha',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _nitrogenController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            gapPadding: 10,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        labelText: 'nitrogen'.tr(),
                        hintText: 'Enter nitrogen in kg/ha',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please Enter  nitrogen in kg/ha';
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
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        labelText: 'phosphorus'.tr(),
                        hintText: 'Enter phosphorus in kg/ha',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please Enter phosphorus in kg/ha';
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
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        labelText: 'potassium'.tr(),
                        hintText: 'Enter potassium in kg/ha',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please Enter potassium in kg/ha';
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
                        // controller:_cropNameController,
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
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                        hint: Text('choose a crop'),
                        isExpanded: true,
                        dropdownColor: Colors.greenAccent,
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                            _cropNameController.text = newValue;
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
                                  'https://smart-agriculture.up.railway.app/fertilizer'),
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
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // title: Text(" ${message}"),
                                    content: Text("${response.statusCode}"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("okay"),
                                        ),
                                      ),
                                    ],
                                  );
                                });
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
          ],
        ),
      )),
    );
  }

  Future<void> listVoicesAndLanguages() async {
    // Create an instance of FlutterTts
    final FlutterTts flutterTts = FlutterTts();

    // Initialize FlutterTts
    await flutterTts.setSharedInstance(true);
    // await flutterTts.init();

    // Retrieve available voices and languages
    List<dynamic> voices = await flutterTts.getVoices;
    List<dynamic> languages = await flutterTts.getLanguages;
    // Print available voices and languages
    print('Voices:');
    // for (dynamic voice in voices) {
    //   print(voice.toString());
    // }
    print(voices.toList());

    print('Languages:');
    print(languages.toList());
    print('is am-ET LanguageAvailable');
    await flutterTts.setLanguage("am-ET");
    await flutterTts.setVoice({'am-ET': "am-ET-x-etv-local"});
    await flutterTts.speak("ሰላም እንዴት ነህ።");

    var isAvailable = await flutterTts.isLanguageAvailable("am-ET");
    print(isAvailable);
    print('getEngines:');
    print(await flutterTts.getEngines);
    print('getDefaultVoice:');
    print(await flutterTts.getDefaultVoice);
    print('is am-ET LanguageInstalled:');
    print(await flutterTts.isLanguageInstalled("en-IN"));
    // await flutterTts.speak('EnterPassword'.tr());
    // await tts.speak('welcome ');
    // print(await tts.getVoice());
  }
}
