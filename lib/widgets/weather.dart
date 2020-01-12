import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/blocs/blocs.dart';
import 'package:flutter_weather/widgets/city_selection.dart';
import 'package:flutter_weather/widgets/location.dart';



class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Weather'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String city = await Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => CitySelection(),
                ),
              );
              if (city != null) {
                BlocProvider.of<WeatherBloc>(context)
                    .add(FetchWeather(city: city));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState> (
          builder: (context, state) {
            if (state is WeatherEmpty) {
              return Center(child: Text('Please select a location'));
            }

            if (state is WeatherLoading) {
              return Center(child: CircularProgressIndicator(),);
            }

            if  (state is WeatherLoaded) {
              final weather = state.weather;
              return ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Location(location: weather.location),)
                ],
              );
            }

            if (state is WeatherError) {
              return Center(child: Text(
                'Something went wrong',
                style: TextStyle(color: Colors.red),),);
            }

            return Center(child: Text('Please select a location'));
          },
        ),
      ),
      
    );
  }
}