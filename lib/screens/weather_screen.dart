import 'package:flutter/material.dart';
import 'package:weather_app_intern/screens/next_days.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
      actions: [
        IconButton(
          icon: Icon(
              Icons.calendar_view_day
          ),
          onPressed:() => Navigator.push(context , MaterialPageRoute(builder: (context) => NextDays() )),
        )
      ],
      ),

      body: Container(),
    );
  }
}
