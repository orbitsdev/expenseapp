import 'package:expenseapp/welcome.dart';
import 'package:flutter/material.dart';


void main()=> runApp(MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.green,
    fontFamily: 'OpenSans',
 
    textTheme: ThemeData.light().textTheme.copyWith(
      headline1: TextStyle(fontWeight: FontWeight.bold, fontSize:18, color: Colors.white),
    ),
  ),
  home: Welcome()
));