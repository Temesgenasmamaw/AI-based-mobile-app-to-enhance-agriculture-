import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/wheather.dart';
import 'services/wheather_service.dart';

class wheatherApi extends StatefulWidget {
  const wheatherApi({Key? key}) : super(key: key);

  @override
  State<wheatherApi> createState() => _wheatherApiState();
}

class _wheatherApiState extends State<wheatherApi> {
  final _formKey = GlobalKey<FormState>();
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();
  final placeController = TextEditingController();

  String currentPlace = "";
  String currentCountry = "";
  String currentWeather = "";
  String futureDate = '';
  String futureCondition = '';
  String alert = '';
  double tempC = 0;
  double tempF = 0;
  double forcastTempC = 0;
  double forcastTempF = 0;
  String wheatherIcon = '';
  double avghumidity = 0;
  String p = 'Bahir Dar';

  @override
  void initState() {
    super.initState();
    getWeather(p);
  }

  void getWeather(String place) async {
    weather = await weatherService.getWeatherData(place);

    setState(() {
      currentPlace = weather.placeName;
      currentCountry = weather.country;
      currentWeather = weather.condition;
      tempC = weather.temperatureC;
      tempF = weather.temperatureF;
      forcastTempC = weather.avgtemp_c;
      avghumidity = weather.avghumidity;
      futureDate = weather.futureDate;
      futureCondition = weather.futureCondition;
      alert = weather.alert;
      wheatherIcon = weather.icon;
    });
    print(weather.placeName);
    print(weather.country);
    print(weather.temperatureC);
    print(weather.condition);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          // padding: EdgeInsets.all(25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 1000,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/wheather.jfif'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Form(
                  // child: TextFormField(
                  //   controller: placeController,
                  //   // The validator receives the text that the user has entered.
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter some text';
                  //     }
                  //     return null;
                  //   },
                  //   onChanged: (onChangedValue) {
                  //     '${onChangedValue}';
                  //   },
                  // ),
                  key: _formKey,
                  child: Container(
                    child: TextFormField(
                      controller: placeController,
                      // style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Bahir Dar'.tr(),
                        // labelStyle: TextStyle(color: Colors.white),
                        label: Text('Enter Place Name').tr(),
                        prefixIcon: Icon(
                          Icons.search,
                          // color: Colors.blueAccent,
                        ),
                        // filled: true,
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: BorderSide(
                                // color: Colors.grey.shade400
                                )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0)),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter Place Name'.tr();
                        }
                        return null;
                      },
                    ),

                    // decoration:
                    //     ThemeHelper().inputBoxDecorationShaddow(),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      try {
                        getWeather(placeController.text);
                      } catch (e) {
                        print(e.toString());
                      }
                    }
                  },
                  child: Text('Submit'),
                ),

                SizedBox(
                  height: 15,
                ),
                Text(
                  'Today\'s wheather condition',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 15,
                ),
                // Container(
                //     child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'Current place: ${currentPlace}',
                //       style:
                //           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                //     ),
                //     SizedBox(
                //       height: 15,
                //     ),
                //     Text('Current country:${currentCountry}',
                //         style: TextStyle(
                //             fontSize: 16, fontWeight: FontWeight.bold)),
                //     SizedBox(
                //       height: 15,
                //     ),
                //     Text('Current weather: ${currentWeather}',
                //         style: TextStyle(
                //             fontSize: 16, fontWeight: FontWeight.bold)),
                //     SizedBox(
                //       height: 15,
                //     ),
                //     Text('future weather: ${futureCondition}',
                //         style: TextStyle(
                //             fontSize: 16, fontWeight: FontWeight.bold)),
                //     SizedBox(
                //       height: 15,
                //     ),
                //     Text('Currnent temp(0c):${tempC.toString()}',
                //         style: TextStyle(
                //             fontSize: 16, fontWeight: FontWeight.bold)),
                //     SizedBox(
                //       height: 15,
                //     ),
                //     Text(
                //         'Avarage T(0c):${forcastTempC.toString()} in ${futureDate}',
                //         style: TextStyle(
                //             fontSize: 16, fontWeight: FontWeight.bold)),
                //     // Text('Alert T(0c):${alert} in ${futureDate}',
                //     //     style: TextStyle(
                //     //         fontSize: 16, fontWeight: FontWeight.bold)),
                //   ],
                // )),

                GestureDetector(
                  // onTap: () {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => Resource()));
                  // },
                  child: Stack(
                    children: [
                      Container(
                        //height: 100,
                        // width: 200,
                        height: MediaQuery.of(context).size.height / 4.5,
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.bottomCenter,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                            ),
                          ],
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
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(15),
                              //     color: Color.fromARGB(255, 10, 8, 8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    'It is ${currentWeather} today,   Humidity:${avghumidity}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                        child: Text(
                          'Weather',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        top: 3,
                        left: 10,
                      ),
                      Positioned(
                        child: Text(
                          //{DateFormat('dd MMMM yyyy hh:mm:ss a').format(DateTime.now()
                          '${currentPlace},${currentCountry} ${DateFormat('dd MMMM yyyy ').format(DateTime.now())}',
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        top: 40,
                        left: 21,
                      ),
                      Positioned(
                        child: Text(
                          '${DateFormat('hh:mm a').format(DateTime.now())}',
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        top: 125,
                        left: 21,
                      ),
                      Positioned(
                        child: Text(
                          '${tempC}°C/${tempF}°F',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                        ),
                        top: 80,
                        left: 21,
                      ),
                      Positioned(
                        // child: Image.network(
                        //   wheatherIcon,
                        //   height: 100,
                        //   width: 100,
                        // ),

                        child: Icon(
                          Icons.sunny,
                          color: Colors.amber,
                          size: 40,
                        ),
                        top: 90,
                        right: 70,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Next 7 day wheather condition',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 15,
                ),
                //
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 6,
                            width: 100,
                            padding: EdgeInsets.all(15.0),
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            child: Text(
                              'Mon',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            left: 30,
                            bottom: 0,
                          ),
                          Positioned(
                            child: Icon(
                              Icons.cloud,
                              size: 30,
                            ),
                            left: 30,
                            bottom: 50,
                          ),
                          Positioned(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hum:${avghumidity.toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Temp:${tempC.toString()}°C',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            top: 20,
                            left: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 6,
                            width: 100,
                            padding: EdgeInsets.all(15.0),
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            child: Text(
                              'Tue',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            left: 30,
                            bottom: 0,
                          ),
                          Positioned(
                            child: Icon(
                              Icons.cloud,
                              size: 30,
                            ),
                            left: 30,
                            bottom: 50,
                          ),
                          Positioned(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hum:${avghumidity.toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Temp:${tempC.toString()}°C',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            top: 20,
                            left: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 6,
                            width: 100,
                            padding: EdgeInsets.all(15.0),
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            child: Text(
                              'Wed',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            left: 30,
                            bottom: 0,
                          ),
                          Positioned(
                            child: Icon(
                              Icons.cloud,
                              size: 30,
                            ),
                            left: 30,
                            bottom: 50,
                          ),
                          Positioned(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hum:${avghumidity.toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Temp:${tempC.toString()}°C',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            top: 20,
                            left: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 6,
                            width: 100,
                            padding: EdgeInsets.all(15.0),
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            child: Text(
                              'The',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            left: 30,
                            bottom: 0,
                          ),
                          Positioned(
                            child: Icon(
                              Icons.cloud,
                              size: 30,
                            ),
                            left: 30,
                            bottom: 50,
                          ),
                          Positioned(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hum:${avghumidity.toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Temp:${tempC.toString()}°C',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            top: 20,
                            left: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 6,
                            width: 100,
                            padding: EdgeInsets.all(15.0),
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            child: Text(
                              'Fri',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            left: 30,
                            bottom: 0,
                          ),
                          Positioned(
                            child: Icon(
                              Icons.cloud,
                              size: 30,
                            ),
                            left: 30,
                            bottom: 50,
                          ),
                          Positioned(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hum:${avghumidity.toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Temp:${tempC.toString()}°C',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            top: 20,
                            left: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 6,
                            width: 100,
                            padding: EdgeInsets.all(15.0),
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            child: Text(
                              'Sat',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            left: 30,
                            bottom: 0,
                          ),
                          Positioned(
                            child: Icon(
                              Icons.cloud,
                              size: 30,
                            ),
                            left: 30,
                            bottom: 50,
                          ),
                          Positioned(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hum:${avghumidity.toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Temp:${tempC.toString()}°C',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            top: 20,
                            left: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 6,
                            width: 100,
                            padding: EdgeInsets.all(15.0),
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            child: Text(
                              'Sun',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            left: 30,
                            bottom: 0,
                          ),
                          Positioned(
                            child: Icon(
                              Icons.cloud,
                              size: 30,
                            ),
                            left: 30,
                            bottom: 50,
                          ),
                          Positioned(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hum:${avghumidity.toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Temp:${tempC.toString()}°C',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            top: 20,
                            left: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      // Stack(
                      //   children: [
                      //     Container(
                      //       height: 100,
                      //       width: 140,
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(20)),
                      //       child: Positioned(
                      //         child: Text(
                      //           'Monday',
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //         top: 100,
                      //         right: 10,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // Stack(
                      //   children: [
                      //     Container(
                      //       height: 100,
                      //       width: 140,
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(20)),
                      //       child: Positioned(
                      //         child: Text(
                      //           'Monday',
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //         top: 100,
                      //         right: 10,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // Stack(
                      //   children: [
                      //     Container(
                      //       height: 100,
                      //       width: 140,
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(20)),
                      //       child: Positioned(
                      //         child: Text(
                      //           'Monday',
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //         top: 100,
                      //         right: 10,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // Stack(
                      //   children: [
                      //     Container(
                      //       height: 100,
                      //       width: 140,
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(20)),
                      //       child: Positioned(
                      //         child: Text(
                      //           'Monday',
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //         top: 100,
                      //         right: 10,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // Stack(
                      //   children: [
                      //     Container(
                      //       height: 100,
                      //       width: 140,
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(20)),
                      //       child: Positioned(
                      //         child: Text(
                      //           'Monday',
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //         top: 100,
                      //         right: 10,
                      //       ),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                ),

//next day weather prediction
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Next 3 month wheather condition',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 15,
                ),
                //

                GestureDetector(
                  // onTap: () {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => Resource()));
                  // },
                  child: Stack(
                    children: [
                      Container(
                        //height: 100,
                        // width: 200,
                        height: MediaQuery.of(context).size.height / 4.5,
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.bottomCenter,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              // offset: Offset(1.0, 1.0),
                              // blurRadius: 10.0,
                            ),
                          ],
                          // image: DecorationImage(
                          //   image: NetworkImage(
                          //       "https://th.bing.com/th/id/R.feeeba7aafcc3b7cfa34e29e85e8c731?rik=pGl47741v5M6gw&pid=ImgRaw&r=0"),
                          //   fit: BoxFit.cover,
                          // ), //DecorationImage
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
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(15),
                              //     color: Color.fromARGB(255, 10, 8, 8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    'It is ${currentWeather} today',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                        child: Text(
                          'Weather',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        top: 3,
                        left: 10,
                      ),
                      Positioned(
                        child: Text(
                          //{DateFormat('dd MMMM yyyy hh:mm:ss a').format(DateTime.now()
                          '${currentPlace},${currentCountry} ${DateFormat('dd MMMM yyyy ').format(DateTime.now())}',
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        top: 40,
                        left: 21,
                      ),
                      Positioned(
                        child: Text(
                          '${DateFormat('hh:mm a').format(DateTime.now())}',
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        top: 125,
                        left: 21,
                      ),
                      Positioned(
                        child: Text(
                          'Temprature:Comming Soon',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        top: 80,
                        left: 21,
                      ),
                      Positioned(
                        // child: Image.network(
                        //   wheatherIcon,
                        //   height: 100,
                        //   width: 100,
                        // ),

                        child: Icon(
                          Icons.sunny,
                          color: Colors.amber,
                          size: 40,
                        ),
                        top: 90,
                        right: 70,
                      ),
                    ],
                  ),
                ),

                // Text(tempF.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
