import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class StateFeed extends StatefulWidget {
  StateFeed({Key key}) : super(key: key);

  @override
  _StateFeedState createState() => _StateFeedState();
}

class _StateFeedState extends State<StateFeed> {
  List stateData;
  fetchStateFeedData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/states');
    setState(() {
      stateData = json.decode(response.body);
    });
  }

  @override 
  void initState() {
    fetchStateFeedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('50 States in the US'),
      ),
      body: stateData == null ? Center(child: CircularProgressIndicator()) : ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 130,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.grey[100], blurRadius: 10, offset: Offset(0, 10)),
            ]),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(stateData[index]['state'], style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  )
                ),
                Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('CONFIRMED:' + stateData[index]['cases'].toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),          
                      Text('ACTIVE:' + stateData[index]['active'].toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                      Text('DEATHS:' + stateData[index]['deaths'].toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[800]),),
                      Text('TESTS:' + stateData[index]['tests'].toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange),),
                    ],
                  ),
                )),
              ],
            ),
          );
        },
        itemCount: stateData == null ? 0 : stateData.length,
      ),
    );
  }
}
