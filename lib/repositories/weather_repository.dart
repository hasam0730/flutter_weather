import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_weather/models/models.dart';
import 'weather_api_client.dart';



class WeatherRepository {

  final WeatherApiClient weatherApiClient;



  WeatherRepository({ @required this.weatherApiClient });



  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return await weatherApiClient.fetchWeather(locationId);
  }
}