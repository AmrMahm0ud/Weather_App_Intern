import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_intern/provider/weather_provider.dart';
import 'package:weather_app_intern/screens/next_days.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather App"),
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_view_day),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NextDays())),
            )
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<WeatherDays>(context, listen: false)
              .fetchWeatherData(),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Container(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : Consumer<WeatherDays>(
                      builder: (ctx, weather, _) => Column(
                        children: [
                          Text('${weather.items[0].temp}'),
                          Text('${weather.items[0].date}'),
                          Text('${weather.items[0].state}'),
                        ],
                      ),
                    ),
        ));
  }
}
