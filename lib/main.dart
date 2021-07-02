import 'package:first_flutter_app/pursing_json/json_parsing_map.dart';
import 'package:first_flutter_app/pursing_json/json_pursing.dart';
import 'package:first_flutter_app/weather_forecast/weather_forecast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'board_firestore/board_app.dart';
import 'ui/home.dart';

/*void main() {
  runApp(ScaffoldExample());
}*/

//final ThemeData _appTheme = _buildAppTheme();

/*ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.amber,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.red,
    backgroundColor: Colors.amber,
    textTheme: _appTextTheme(base.textTheme)
  );
}

TextTheme _appTextTheme(TextTheme base) {

  return base.copyWith(
    headline6: base.headline6!.copyWith(
      fontSize: 18.0,
    ),

    headline4: base.headline4!.copyWith(
      fontWeight: FontWeight.w500
    ),
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0
    ),

    button: base.button!.copyWith(
      //fontSize: 23.9,
      //backgroundColor: Colors.red,
      //letterSpacing: 3.0,
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontSize: 16.9,
      fontFamily: "Lobster",
      color: Colors.white,
    )
  ).apply(
    fontFamily: "Lobster",
    displayColor: Colors.amber,
  );
}*/

void main() => runApp( new MaterialApp(
  //theme: _appTheme,
/*
  theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[800],

    textTheme: TextTheme(
      headline4: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        fontSize: 16.9,
        color: Colors.white
      )

    )
*/

  //),
  home: BoardApp(),
));


