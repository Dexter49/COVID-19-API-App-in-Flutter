import 'package:flutter/material.dart';
import 'package:covid19_gateway/home.dart';
import 'package:covid19_gateway/novelcovid/novelquote.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Circular',
      primaryColor: primaryBlack,
    ),
    home: Home(),
  ));
}
