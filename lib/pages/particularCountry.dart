import 'package:flutter/material.dart';
import 'package:todo/datasource.dart';

class particularCountry extends StatelessWidget {

  final int index;
  final String confirmed;
  final String active;
  final String recovered;
  final String death;
  final String countryName;


  particularCountry(this.index, this.confirmed, this.active, this.recovered,
      this.death,this.countryName);

  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(countryName),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            _countryWisePanel('CONFIRMED CASES', confirmed, Colors.white, Colors.blue),
          ],
        ),



      ),

    );
  }
}

Widget _countryWisePanel(String title,String count,Color textColor,Color boxColor) {

  return Padding(
    padding: EdgeInsets.only(left: 65,top:20),
    child: new Container(
      margin: EdgeInsets.all(5.0),
      color: boxColor,
      height: 80,
      width: 220,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(title,style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: textColor),),
          SizedBox(height: 5.0,),
          new Text(count,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: textColor),),
        ],
      ),
    ),
  );
}