import 'package:flutter/material.dart';
import 'package:todo/datasource.dart';

class FaqsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('FAQs'),
      ),
      body: new ListView.builder(itemCount: dataSource.questionAnswer.length,itemBuilder: (context,index) {
        return ExpansionTile(
          title: new Text(dataSource.questionAnswer[index]['question'],style: new TextStyle(fontWeight: FontWeight.bold),),
          children: <Widget>[
              new Text(dataSource.questionAnswer[index]['answer']),
          ],
        );
      }),
    );
  }
}
