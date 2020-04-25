import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/datasource.dart';
import 'package:todo/datasource.dart';
import 'package:todo/pages/countrypage.dart';
import 'package:todo/panels/MostAffectedCountries.dart';
import 'package:todo/panels/infoPanel.dart';
import 'package:todo/panels/worldwidepanel.dart';
import 'package:http/http.dart' as http;

import 'datasource.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;

  fetchWordWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
      print(worldData);

    });

  }
  // Country data.
  List countryData;

  fetchCountryData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {

      countryData = json.decode(response.body);

    });

  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchWordWideData();
    fetchCountryData();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: new Text('COVID-19 TRACKER'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              color: Colors.orange[100],
              child: new Text(dataSource.quote,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                  fontSize: 16,
              ),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Worldwide',style: new TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),
                  GestureDetector(
                    onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => CountryPage()));},
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.circular(15.0),

                      ),
                      child: new Text('Regional',style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),

                ],

              ),
            ),
            worldData == null ? Center(child: CircularProgressIndicator()) : worldWidePanel(worldData: worldData),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                child: new Text(
                  'Most Affected Countries',
                  style: new TextStyle(
                      fontSize: 22,fontWeight: FontWeight.bold),)
            ),SizedBox(height: 10.0,),
           countryData == null ? Center(child: CircularProgressIndicator()) : MostAffectedPanel(countryData: countryData),
            infoPanel(),
            SizedBox(height: 20,),
            Center(child: new Text('WE ARE TOGETHER IN THE FIGHT',style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
            SizedBox(height: 50.0,),
            
          ],
        ),
      ),
    );
  }
}
