import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lo_auctions_sniper/DataBaseMaps.dart';
import 'package:lo_auctions_sniper/Pages/MapEdit.dart';
import 'package:lo_auctions_sniper/globals.dart';

class MapListing extends StatefulWidget
{
  final bool sniping;

  MapListing({Key key, @required this.sniping}) : super(key: key);

  @override
  _MapListingState createState() => _MapListingState();
}

class _MapListingState extends State<MapListing>
{
  List<Widget> _mapsToDisplay = [];
  Timer _everyMinute;

  @override
  void initState()
  {
    super.initState();
    updateList();
    _everyMinute = Timer.periodic(Duration(minutes: 1), (timer) {updateList();});
  }

  @override
  void dispose()
  {
    super.dispose();
    _everyMinute.cancel();
  }

  Future<void> updateList () async
  {
    await disposeBurnedMaps();
    await updateAuctionsCycle();
    _mapsToDisplay = await mapListGenerator();
    setState(() {});
  }

  Future<List> mapListGenerator () async
  {
    List<Widget> _mapList = [];
    List<LoMap> _maps = [];

    for (String area in areas)
    {
      _maps = [];
      if (!widget.sniping && toDisplay(area))
      {
        _maps = await maps(area);
      }
      else if (widget.sniping)
      {
        _maps = await maps(area);
        _maps.removeWhere((element) => !toSnipe(element.auctionItem));
      }
      _maps.sort((a,b) => a.auctionCycleEnd.compareTo(b.auctionCycleEnd));
      _maps.forEach((element)
      {
        _mapList.add(Card
        (
          elevation: 5,
          child: Container
          (
            height: 90,
            child: TextButton
            (
              style: TextButton.styleFrom(primary: Colors.black),
              onPressed: ()
              {
                showDialog
                (
                  context: context,
                  builder: (context){return MapEdit(loMap: element);}
                ).then((value) {updateList();});
              },
              child: Column
              (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                [
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      Container
                      (
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Text(element.area, style: TextStyle(fontSize: 18)),
                      ),
                      Container
                      (
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: Text(element.mapName, style: TextStyle(fontSize: 18), overflow: TextOverflow.ellipsis),
                      ),
                      Container
                      (
                        width: MediaQuery.of(context).size.width * 0.15,
                        child:
                        element.auctionItem != "" ?
                        Image.asset("assets/Strongboxes/${element.auctionItem}_${element.itemNumber}.png", scale: 2):
                        Text(""),
                      ),
                    ],
                  ),
                  Row
                    (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      Text
                      (
                        "End: ${DateFormat("HH:mm").format(
                            DateTime.fromMillisecondsSinceEpoch(
                                element.auctionCycleEnd))}",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text
                      (
                        "Remaining: ${DateFormat("HH:mm").format(
                            DateTime.fromMillisecondsSinceEpoch(
                                element.auctionCycleEnd - DateTime
                                    .now()
                                    .millisecondsSinceEpoch - 3600000))}",
                        // regler l'heure de différence UTC + 1
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
      });
    }
    return _mapList;
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: DateTime.now().millisecondsSinceEpoch - (gbID + 3600000) < 0 ?
      ListView
      (
        children: <Widget>
        [
          Container
          (
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView
            (
              child: Column
              (
                children: _mapsToDisplay,
              ),
            ),
          ),
        ],
      ):
      Center(child: Text("Thanks for trying the demo version")),
    );
  }
}