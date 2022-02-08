import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.blueGrey,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
      scaffoldBackgroundColor: const Color.fromRGBO(33, 54, 62,0.4),
      // accentColor: Colors.white,
      splashColor: Colors.transparent,
      primarySwatch: Colors.blue,
      // fontFamily: 'NotoSans',
      primaryColor: Colors.black,
    );
  }
}
