import 'package:flutter/material.dart';
import 'package:todo/datasource.dart';
import 'package:todo/pages/faqs.dart';
import 'package:url_launcher/url_launcher.dart';

class infoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20.0),
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            color: primaryBlack,
            child: GestureDetector(
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => FaqsPage())); },
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('FAQS',
                    style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),
                  Icon(Icons.arrow_forward,color: Colors.white,)

                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {launch('https://covid-19responsefund.org/');},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20.0),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              color: primaryBlack,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('DONATE',
                    style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),
                  Icon(Icons.arrow_forward,color: Colors.white,)

                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20.0),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              color: primaryBlack,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text("MYTH BUSTERS",
                    style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),
                  Icon(Icons.arrow_forward,color: Colors.white,),

                ],
              ),

            ),
          ),

        ],
      ),
    );
  }
}
