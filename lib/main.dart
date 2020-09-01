import 'package:flutter/material.dart';
import 'package:weather_app_intern/provider/weather_provider.dart';
import 'package:weather_app_intern/screens/weather_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider.value(
      value: WeatherDays(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: WeatherScreen(),
      ),
    );
  }
}
