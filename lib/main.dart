import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/blocs/weather_bloc.dart';
import 'package:flutter_weather/repositories/repository.dart';
import 'package:flutter_weather/repositories/weather_api_client.dart';
import 'package:http/http.dart' as http;



void main() {
  final WeatherRepository weatherRepository = WeatherRepository(weatherApiClient: WeatherApiClient(httpClient: http.Client()));
  runApp(App(weatherRepository: weatherRepository));
}



class App extends StatelessWidget {

  final WeatherRepository weatherRepository;



  App({Key key, @required this.weatherRepository })
    : assert(weatherRepository != null), 
      super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather',
      home: BlocProvider(create: (context) {
        return WeatherBloc(weatherRepository: weatherRepository);
      }, 
      child: ,),
    );
  }
}