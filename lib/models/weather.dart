import 'package:equatable/equatable.dart';



enum WeatherCondition {

  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}



class Weather extends Equatable {

  final WeatherCondition condition;
  final String formattedCondition;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String location;



  Weather({
    this.condition, 
    this.formattedCondition, 
    this.minTemp, 
    this.temp, 
    this.maxTemp, 
    this.locationId, 
    this.created, 
    this.lastUpdated, 
    this.location
  });



  @override
  List<Object> get props => [
    condition, 
    formattedCondition, 
    minTemp, 
    temp, 
    maxTemp, 
    locationId, 
    created, 
    locationId, 
    created, 
    lastUpdated, 
    location
  ];



  Weather fromJson(dynamic json) {
    final consolidateWeather = json["consolidated_weather"][0];
    return Weather(condition: _mapStringToWeatherCondition(consolidateWeather["weather_state_abbr"]),
                  formattedCondition: consolidateWeather["weather_state_name"],
                  minTemp: consolidateWeather["min_temp"],
                  temp: consolidateWeather["the_temp"],
                  maxTemp: consolidateWeather["max_temp"],
                  locationId: json["woeid"] as int,
                  created: consolidateWeather["created"],
                  lastUpdated: DateTime.now(),
                  location: consolidateWeather["title"],
                );
  }



  WeatherCondition _mapStringToWeatherCondition(String input) {
    switch (input) {
      case "sn": return WeatherCondition.snow; break;
      case 'sl': return WeatherCondition.sleet; break;
      case 'h': return WeatherCondition.hail; break;
      case 't': return WeatherCondition.thunderstorm; break;
      case 'hr': return WeatherCondition.heavyRain; break;
      case 'lr': return WeatherCondition.lightRain; break;
      case 's': return WeatherCondition.showers; break;
      case 'hc': return WeatherCondition.heavyCloud; break;
      case 'lc': return WeatherCondition.lightCloud; break;
      case 'c': return WeatherCondition.clear; break;
      default: return WeatherCondition.unknown; break;
    }
  }
}