import 'package:flutter/material.dart';
import 'package:lo_auctions_sniper/Pages/MapAdd.dart';
import 'package:lo_auctions_sniper/Pages/MapListing.dart';
import 'package:lo_auctions_sniper/Pages/Settings.dart';

class HomePage extends StatefulWidget
{
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context)
  {
    final _kTabPages = <Widget>
    [
      MapListing(sniping: true),
      MapListing(sniping: false),
      Settings(),
      MapAdd(),
    ];
    final _kTabs = <Tab>
    [
      Tab(icon: Icon(Icons.shutter_speed), text: 'Sniping'),
      Tab(icon: Icon(Icons.timer), text: 'Timers'),
      Tab(icon: Icon(Icons.settings), text: 'Settings'),
      Tab(icon: Icon(Icons.add), text: 'Add map'),
    ];

    return DefaultTabController
    (
      length: _kTabs.length,
      child: Scaffold
      (
        appBar: PreferredSize
        (
          preferredSize: Size.fromHeight(80),
          child: AppBar
          (
            backgroundColor: Colors.blueAccent,
            bottom: TabBar
            (
              tabs: _kTabs,
            ),
          ),
        ),
        body: TabBarView
        (
          children: _kTabPages,
        ),
      ),
    );
  }
}