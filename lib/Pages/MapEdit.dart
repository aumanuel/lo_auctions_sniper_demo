import 'package:flutter/material.dart';
import 'package:lo_auctions_sniper/DataBaseMaps.dart';
import 'package:lo_auctions_sniper/Pages/MapEditMore.dart';

class MapEdit extends StatefulWidget
{
  final LoMap loMap;

  MapEdit({Key key, @required this.loMap}) : super(key: key);

  @override
  _MapEditState createState() => _MapEditState();
}

class _MapEditState extends State<MapEdit>
{
  String _chosenType = "";
  int _itemNumber = 0;

  @override
  void initState()
  {
    super.initState();
    _chosenType = widget.loMap.auctionItem;
    _itemNumber = widget.loMap.itemNumber;
  }

  void _updateMap()
  {
    LoMap updatedMap = LoMap
      (
      id: widget.loMap.id,
      mapName: widget.loMap.mapName,
      area: widget.loMap.area,
      auctionCycleEnd: widget.loMap.auctionCycleEnd,
      mapBurnTimer: widget.loMap.mapBurnTimer,
      auctionItem: _chosenType,
      itemNumber: _chosenType != "" && _itemNumber ==0 ? widget.loMap.itemNumber :_itemNumber,
    );
    updateMap(updatedMap);
  }

  @override
  Widget build(BuildContext context)
  {
    return Dialog
    (
      child: Container
      (
        height: 300,
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
          [
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buttonList(),
            ),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                ElevatedButton
                (
                  child: Text("More"),
                  style: ElevatedButton.styleFrom
                  (
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  onPressed: ()
                  {
                    Navigator.pop(context);
                    showDialog
                    (
                      context: context,
                      builder: (context){return MapEditMore(loMap: widget.loMap);}
                    );
                  },
                ),
                ElevatedButton
                (
                  child: Text("Cancel"),
                  style: ElevatedButton.styleFrom
                  (
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {Navigator.pop(context);},
                ),
                ElevatedButton
                (
                  child: Text("Save"),
                  style: ElevatedButton.styleFrom
                  (
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {_updateMap(); Navigator.pop(context);},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget>buttonList()
  {
    List<Widget> _list = [];

    if (_chosenType == "")
    {
      _list.add
      (
        Column
        (
          children:
          [
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                IconButton
                (
                  icon: Image.asset("assets/Strongboxes/armor_1.png"),
                  iconSize: MediaQuery.of(context).size.width * 0.20,
                  onPressed: (){_chosenType = "armor"; _updateMap(); setState(() {});},
                ),
                IconButton
                (
                  icon: Image.asset("assets/Strongboxes/equipment_1.png"),
                  iconSize: MediaQuery.of(context).size.width * 0.20,
                  onPressed: (){_chosenType = "equipment"; _updateMap(); setState(() {});},
                ),
                IconButton
                (
                  icon: Image.asset("assets/Strongboxes/tablets_1.png"),
                  iconSize: MediaQuery.of(context).size.width * 0.20,
                  onPressed: (){_chosenType = "tablets"; _updateMap(); setState(() {});},
                ),
              ],
            ),
            SizedBox(height: 7),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                IconButton
                (
                  icon: Image.asset("assets/Strongboxes/tools_1.png"),
                  iconSize: MediaQuery.of(context).size.width * 0.20,
                  onPressed: (){_chosenType = "tools"; _updateMap(); setState(() {});},
                ),
                IconButton
                (
                  icon: Image.asset("assets/Strongboxes/weapons_1.png"),
                  iconSize: MediaQuery.of(context).size.width * 0.20,
                  onPressed: (){_chosenType = "weapons"; _updateMap(); setState(() {});},
                ),
                IconButton
                (
                  icon: Image.asset("assets/Strongboxes/modules_1.png"),
                  iconSize: MediaQuery.of(context).size.width * 0.20,
                  onPressed: (){_chosenType = "modules"; _updateMap(); setState(() {});},
                ),
              ],
            ),
          ],
        )
      );
    }
    else if (_itemNumber == 0)
    {
      _list.add
      (
        Column
        (
          children: <Widget>
          [
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                IconButton
                (
                  icon: Image.asset("assets/Strongboxes/${_chosenType}_1.png"),
                  iconSize: MediaQuery.of(context).size.width * 0.20,
                  onPressed: (){_itemNumber = 1; _updateMap(); Navigator.pop(context);},
                ),
                IconButton
                (
                  icon: Image.asset("assets/Strongboxes/${_chosenType}_2.png"),
                  iconSize: MediaQuery.of(context).size.width * 0.20,
                  onPressed: (){_itemNumber = 2; _updateMap(); Navigator.pop(context);},
                ),
              ],
            ),
            SizedBox(height: 7),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                IconButton
                (
                  icon: Image.asset("assets/Strongboxes/${_chosenType}_3.png"),
                  iconSize: MediaQuery.of(context).size.width * 0.20,
                  onPressed: (){_itemNumber = 3; _updateMap(); Navigator.pop(context);},
                ),
                _chosenType !="equipment" ?
                IconButton
                (
                  icon: Image.asset("assets/Strongboxes/${_chosenType}_4.png"),
                  iconSize: MediaQuery.of(context).size.width * 0.20,
                  onPressed: (){_itemNumber = 4; _updateMap(); Navigator.pop(context);},
                ):
                SizedBox(),
                _chosenType !="equipment" && _chosenType !="modules" && _chosenType !="tablets" ?
                IconButton
                (
                  icon: Image.asset("assets/Strongboxes/${_chosenType}_5.png"),
                  iconSize: MediaQuery.of(context).size.width * 0.20,
                  onPressed: (){_itemNumber = 5; _updateMap(); Navigator.pop(context);},
                ):
                SizedBox(),
              ],
            ),
          ],
        ),
      );
    }
    else
    {
      _list.add
      (
        IconButton
        (
          icon: Image.asset("assets/Strongboxes/${_chosenType}_$_itemNumber.png"),
          iconSize: MediaQuery.of(context).size.width * 0.20,
          onPressed: ()
          {
            _chosenType = "";
            _itemNumber = 0;
            setState(() {});
          },
        ),
      );
    }
    return _list;
  }
}

