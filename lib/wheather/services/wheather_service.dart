import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/wheather.dart';

class WeatherService {
  Future<Weather> getWeatherData(String place) async {
    try {
      final queryParameters = {
        'key': '5b29c56d7a5b47c69f1193752230404',
        'q': place,
      };
      final uri =
          Uri.http('api.weatherapi.com', '/v1/forecast.json', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Can not get weather");
      }
    } catch (e) {
      rethrow;
    }
  }
}
