import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'package:covid19_gateway/novelcovid/novelinfo.dart';
import 'package:covid19_gateway/novelcovid/novelquote.dart';
import 'package:covid19_gateway/novelcovid/novelcountry.dart';
import 'package:covid19_gateway/novelcovid/novelcasualty.dart';
import 'package:covid19_gateway/novelcovid/novelglobal.dart';
import 'package:covid19_gateway/feed-usa/statefeed.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map globalData;

  _HomeState();
  fetchNovelGlobalData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/all');
    setState(() {
      globalData = json.decode(response.body);
    });
  }

  List countryData;
  fetchNovelCountryData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override 
  void initState() {
    fetchNovelGlobalData();
    fetchNovelCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('NovelCOVID API'),      
      ),
      body: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: <Widget>[
          Container(
            height: 250,
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            color: Colors.blue[200],
            child: Text(Motif.quote, style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold, fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Global', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NovelCountry()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryBlack,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text('Regional', style: TextStyle(fontSize: 20, color:Colors.white, fontWeight: FontWeight.bold),)),
                ),                
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StateFeed()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryBlack,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text('States', style: TextStyle(fontSize: 20, color:Colors.white, fontWeight: FontWeight.bold),)),
                ),                
              ],
            ),
          ),
          globalData == null ? CircularProgressIndicator() : NovelGlobal(globalData: globalData),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('Countries w/ Highest Casualties', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 10),
          countryData == null ? Container() : NovelCasualty(countryData: countryData),
          NovelInfo(),
          Center(child: Text('UNITED AGAINST COVID-19', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
        ],
      )),
    );
  }
}

