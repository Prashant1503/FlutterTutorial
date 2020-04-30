import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class country extends StatefulWidget {
  @override
  _countryState createState() => _countryState();
}

class _countryState extends State<country> {

  List _countryData;

  List getCountryData() => _countryData;

  fetchCountryData() async {
    http.Response response = await http.get(
        'https://corona.lmao.ninja/v2/countries');

    setState(() {
      _countryData = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

