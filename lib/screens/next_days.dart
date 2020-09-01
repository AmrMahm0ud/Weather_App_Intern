import 'package:flutter/material.dart';
import 'package:weather_app_intern/model/weather_model.dart';
import 'package:weather_app_intern/provider/weather_provider.dart';
import 'package:provider/provider.dart';
class NextDays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  //  List<Weather> _weatherday = Provider.of<WeatherDays>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Saven Days Weather"),
      ),
    //  body: ListView.builder(itemBuilder: (ctx , index) =>),
    );
  }
}
