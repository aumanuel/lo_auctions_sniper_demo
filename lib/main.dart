import 'package:flutter/material.dart';
import 'package:lo_auctions_sniper/DatabaseSettings.dart';
import 'package:lo_auctions_sniper/Pages/HomePage.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    getSettings();
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}