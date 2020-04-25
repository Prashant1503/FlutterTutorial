import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {

  final List countryData;

  const MostAffectedPanel({Key key,this.countryData}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
          itemCount: 5,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index) {

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child: new Row(
            children: <Widget>[
              Image.network(countryData[index]['countryInfo']['flag'],height: 25.0,),
              SizedBox(width: 10.0,),
              new Text(countryData[index]['country'],style: new TextStyle(
                fontWeight: FontWeight.bold,
              ),),              SizedBox(width: 10.0,),

              new Text('Deaths: ' + countryData[index]['deaths'].toString(),style: new TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        );
      }),
    );
  }
}
