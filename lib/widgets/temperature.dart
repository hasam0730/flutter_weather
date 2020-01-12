import 'package:flutter/material.dart';



class Temperature extends StatelessWidget {

  final double temperature;
  final double max;
  final double min;



  Temperature({ Key key, this.temperature, this.max, this.min }): super(key: key);



  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(20.0), child: Text(
          '${_formattedTemperature(temperature)}',
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),),
        Column(
          children: <Widget>[
            Text(
              '$_formattedTemperature(max)',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.white),),
            Text(
              '$_formattedTemperature(min)',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.white),),
        ],)
    ],);
  }



  int _formattedTemperature(double t) => t.round();
}