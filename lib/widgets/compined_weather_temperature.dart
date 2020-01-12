import 'package:flutter/material.dart';
import 'package:flutter_weather/models/models.dart';



class CombinedWeatherTemperature extends StatelessWidget {

  final Weather weather;



  CombinedWeatherTemperature({ Key key, @required this.weather })
      : assert(weather != null),
        super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: WeatherConditions,
            ),
          ],
        )
    ],);
  }

}