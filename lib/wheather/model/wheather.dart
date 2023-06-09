class Weather {
  final double temperatureC;
  final double forcastC;
  final String condition;
  final String placeName;
  final String country;
  final String futureDate;
  final String futureCondition;
  String alert;
  // final String conditionIcon;

  Weather({
    this.temperatureC = 0,
    this.forcastC = 0,
    this.condition = "",
    this.placeName = '',
    this.country = '',
    this.futureDate = '',
    this.futureCondition = '',
    this.alert = 'good',

    // this.conditionIcon = "",
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      placeName: json['location']['name'],
      country: json['location']['country'],
      temperatureC: json['current']['temp_c'],
      forcastC: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      futureDate: json['forecast']['forecastday'][0]['date'],
      futureCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      condition: json['current']['condition']['text'],
      // alert: json['forecast']['alerts']['alert'],
    );
  }
}
