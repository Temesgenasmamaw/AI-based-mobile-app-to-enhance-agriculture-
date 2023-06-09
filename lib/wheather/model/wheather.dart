class Weather {
  final double temperatureC;
  final double temperatureF;
  final double avgtemp_c;
  final String condition;
  final String placeName;
  final String country;
  final String futureDate;
  final String futureCondition;
  final String icon;
  String alert;
  final double avghumidity;
  // final String conditionIcon;

  Weather({
    this.temperatureC = 0,
    this.avghumidity = 0,
    this.avgtemp_c = 0,
    this.condition = "",
    this.placeName = '',
    this.country = '',
    this.futureDate = '',
    this.futureCondition = '',
    this.alert = 'good',
    this.icon = '',
    this.temperatureF = 0,

    // this.conditionIcon = "",
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      placeName: json['location']['name'],
      country: json['location']['country'],
      temperatureC: json['current']['temp_c'],
      temperatureF: json['current']['temp_f'],

      avgtemp_c: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      avghumidity: json['forecast']['forecastday'][0]['day']['avghumidity'],
      futureDate: json['forecast']['forecastday'][0]['date'],
      futureCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      condition: json['current']['condition']['text'],
      icon: json['current']['condition']['icon'],
      // alert: json['forecast']['alerts']['alert'],temp_f
    );
  }
}
