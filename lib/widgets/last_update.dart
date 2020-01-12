import 'package:flutter/material.dart';



class LastUpdated extends StatelessWidget {

  final DateTime datetime;



  LastUpdated({ Key key, @required this.datetime }): assert(datetime != null), super(key: key);



  @override
  Widget build(BuildContext context) {
    return Text(
      'LastUpdated: ${TimeOfDay.fromDateTime(datetime).format(context)}',
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w200,
          color: Colors.white),
    );
  }

}