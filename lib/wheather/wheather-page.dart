import 'package:flutter/material.dart';
import 'model/wheather.dart';
import 'services/wheather_service.dart';

class wheatherApi extends StatefulWidget {
  const wheatherApi({Key? key}) : super(key: key);

  @override
  State<wheatherApi> createState() => _wheatherApiState();
}

class _wheatherApiState extends State<wheatherApi> {
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();

  String currentPlace = "";
  String currentCountry = "";
  String currentWeather = "";
  String futureDate = '';
  String futureCondition = '';
  String alert = '';
  double tempC = 0;
  double forcastTempC = 0;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  void getWeather() async {
    weather = await weatherService.getWeatherData("Bahir Dar");

    setState(() {
      currentPlace = weather.placeName;
      currentCountry = weather.country;
      currentWeather = weather.condition;
      tempC = weather.temperatureC;
      forcastTempC = weather.forcastC;
      futureDate = weather.futureDate;
      futureCondition = weather.futureCondition;
      alert = weather.alert;
    });
    print(weather.placeName);
    print(weather.country);
    print(weather.temperatureC);
    print(weather.condition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          // padding: EdgeInsets.all(25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 1000,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/wheather.jfif'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
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
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current place: ${currentPlace}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Current country:${currentCountry}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Current weather: ${currentWeather}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 15,
                    ),
                    Text('future weather: ${futureCondition}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Currnent temp(0c):${tempC.toString()}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Avarage T(0c):${forcastTempC.toString()} in ${futureDate}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    // Text('Alert T(0c):${alert} in ${futureDate}',
                    //     style: TextStyle(
                    //         fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                )),

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
                                "https://th.bing.com/th/id/R.feeeba7aafcc3b7cfa34e29e85e8c731?rik=pGl47741v5M6gw&pid=ImgRaw&r=0"),
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
                                    'Mango',
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

                // Text(tempF.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
