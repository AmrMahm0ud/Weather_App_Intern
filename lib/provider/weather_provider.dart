import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherDays extends ChangeNotifier {
  List<WeatherDays> _weatherDay= [];

  Future<void> fetchWeatherData() async {
    try{
      const url = "https://samples.openweathermap.org/data/2.5/forecast/daily?q=M%C3%BCnchen,DE&appid=b6907d289e10d714a6e88b30761fae22";
      final response =  await http.get(url);
    }catch(error){
      throw(error);
    }
  }
}
