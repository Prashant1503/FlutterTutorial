import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo/pages/country.dart';
import 'package:todo/pages/particularCountry.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

  Widget customSearchBar = Text('Country Stats');
  Icon customIcon = Icon(Icons.search);

     List _countryData;

    getCoutryData() => _countryData;

//  List get countryData => _countryData;

  List getCountryData() => _countryData;



  fetchCountryData() async {
      http.Response response = await http.get(
          'https://corona.lmao.ninja/v2/countries');

      setState(() {
        _countryData = json.decode(response.body);
      });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountryData();


  }

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        title: customSearchBar,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search,color: Colors.white,),onPressed: () { showSearch(context: context, delegate: DataSearch());})
        ],
      ),
      body: _countryData == null? Center(child: CircularProgressIndicator()) :
      new ListView.builder(
        itemCount: _countryData.length,
          itemBuilder: (context,index) {

        return Container(
          height: 130,
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey[100],blurRadius: 10,offset: Offset(0,10))]
          ),
          child: new Row(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(_countryData[index]['country'],style: new TextStyle(fontWeight: FontWeight.bold),),
                    Image.network(_countryData[index]['countryInfo']['flag'],height: 50.0,width: 60.0,),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => particularCountry(
                      index,
                      _countryData[index]['cases'].toString(),
                      _countryData[index]['active'].toString(),
                      _countryData[index]['recovered'].toString(),
                      _countryData[index]['deaths'].toString(),
                      _countryData[index]['country'].toString(),
                    )))
                  },
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new Text('CONFIRMED: ' + _countryData[index]['cases'].toString(),style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                        new Text('ACTIVE: ' + _countryData[index]['active'].toString(),style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
                        new Text('RECOVERED: ' + _countryData[index]['recovered'].toString(),style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
                        new Text('DEATHS: ' + _countryData[index]['deaths'].toString(),style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[800])),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      })
    );

  }

}

class DataFetch extends StatefulWidget {
  @override
  _DataFetchState createState() => _DataFetchState();
}

class _DataFetchState extends State<DataFetch> {

  @override
  Widget build(BuildContext context) {

    List _data;

    initState();

    fetchData() async {
      http.Response response = await http.get(
          'https://corona.lmao.ninja/v2/countries');

      setState(() {
        _data = json.decode(response.body);
        print(_data);


      });


    return Container();
  }
}



}


class DataSearch extends SearchDelegate<String> {

  final countryUrl = 'https://corona.lmao.ninja/v2/countries';



  final countries = [

    'Dhar',
    'Dhamnod',
    'Akola',
    'dharavi',
    'rajmahal',
    'Akola',
    'Maharasthra',
    'Ambala',
    'Delhi',
    'Mumbai',
    'Alirajpur',
    'dharavi',
  ];

  final recentCities = [
    'Delhi',
    'Mumbai',
    'Alirajpur',
    'dharavi',
    'Dhar',
    'Dhamnod',
    'Akola',
    'dharavi',
    'rajmahal',
  ];


  @override
  Widget buildSuggestions(BuildContext context) {


    final suggestionList = query.isEmpty ? recentCities : countries.where((p) => p.startsWith(query)).toList();

   return new ListView.builder(itemBuilder: (context,index) =>ListTile (
     onTap: () { showResults(context);},
     leading: Icon(Icons.location_city),
     title: RichText(text: TextSpan(
       text: suggestionList[index].substring(0,query.length),
       style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
       children: [TextSpan(
         text: suggestionList[index].substring(query.length),
         style: new TextStyle(color: Colors.grey)
       )]
     ),),
   ),itemCount: suggestionList.length,
   );

  }


  @override
  List<Widget> buildActions(BuildContext context) {

    return [IconButton(icon: Icon(Icons.clear),onPressed: () {
      query = "";
    } ,)];

  }

  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );

  }

  @override
  Widget buildResults(BuildContext context) {

    List _countryData;






  }

}
