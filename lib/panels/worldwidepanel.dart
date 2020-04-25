import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;

class worldWidePanel extends StatelessWidget {

  final Map worldData;

  const worldWidePanel({Key key,this.worldData}) : super(key : key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(title: 'CONFIRMED',panelColor: Colors.red[100],textColor: Colors.red,count: worldData['cases'].toString(),),
          StatusPanel(title: 'ACTIVED',panelColor: Colors.blue[100],textColor: Colors.blue,count: worldData['active'].toString(),),
          StatusPanel(title: 'RECOVERED',panelColor: Colors.green[100],textColor: Colors.green,count: worldData['recovered'].toString(),),
          StatusPanel(title: 'DEATH',panelColor: Colors.grey,textColor: Colors.white,count: worldData['deaths'].toString(),),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(5.0),
      color: panelColor,
      height: 80,
      width: width/2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(title,style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: textColor),),
          new Text(count,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: textColor),),
        ],
      ),
    );
  }
}
