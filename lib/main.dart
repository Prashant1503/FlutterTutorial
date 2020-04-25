import 'package:flutter/material.dart';
import 'datasource.dart';

import 'HomePage.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor: primaryBlack,

    ),
    home: new HomePage(),

  ));
}