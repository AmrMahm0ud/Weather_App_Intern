import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app_intern/model/weather_model.dart';

class WeatherDays extends ChangeNotifier {
  var temp ;
  List<Weather> _weatherDay = [];

  List<Weather> get items {
    return [..._weatherDay];
  }


  Future<void> fetchWeatherData() async {
    try {
      const url = "https://samples.openweathermap.org/data/2.5/forecast/daily?q=M%C3%BCnchen,DE&appid=b6907d289e10d714a6e88b30761fae22";
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String ,dynamic>;

    } catch (error) {
      throw (error);
    }
  }
}
