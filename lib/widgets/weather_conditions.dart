import 'package:flutter/material.dart';
import 'package:flutter_weather/models/models.dart';



class WeatherConditions extends StatelessWidget {

  final WeatherCondition weatherCondition;



  WeatherConditions({ Key key, @required this.weatherCondition })
      : assert(weatherCondition != null),
        super(key: key);



  @override
  Widget build(BuildContext context) {
    return _mapConditionToImage(weatherCondition);
  }



  Image _mapConditionToImage(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        return Image.asset('assets/clear.png');
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        return Image.asset('assets/snow.png');
        break;
      case WeatherCondition.heavyCloud:
        return Image.asset('assets/cloudy.png');
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        return Image.asset('assets/rainy');
        break;
      case WeatherCondition.thunderstorm:
        return Image.asset('assets/thunderstorm.png');
        break;
      case WeatherCondition.unknown:
        return Image.asset('assets/clear.png');
        break;
    }
    return Image.asset('assets/clear.png');
  }
}