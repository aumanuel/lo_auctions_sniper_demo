import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lo_auctions_sniper/DataBaseMaps.dart';

class MapEditMore extends StatefulWidget
{
  final LoMap loMap;

  MapEditMore({Key key, @required this.loMap}) : super(key: key);

  @override
  _MapEditMoreState createState() => _MapEditMoreState();
}

class _MapEditMoreState extends State<MapEditMore>
{
  bool _validInformations = false;
  var _mapName = TextEditingController();
  var _auctionHours = TextEditingController();
  var _auctionMin = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    _mapName.text = widget.loMap.mapName;
    final int _hours = ((widget.loMap.auctionCycleEnd - DateTime.now().millisecondsSinceEpoch) / 3600000).floor();
    _auctionHours.text = _hours.toString();
    final int _min = (((widget.loMap.auctionCycleEnd - DateTime.now().millisecondsSinceEpoch) % 3600000) / 60000).floor();
    _auctionMin.text = _min.toString();

    return Dialog
    (
      child: Container
      (
        height: 300,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            TextFormField
            (
              controller: _mapName,
              decoration: const InputDecoration
              (
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.map),
                hintText: "Name of the map",
              )
            ),
            SizedBox(height: 20),
            Text("Auction time left"),
            SizedBox(height: 5),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>
              [
                Icon(Icons.hardware, color: Colors.brown),
                SizedBox(width: 10),
                SizedBox
                (
                  width: 65,
                  child: TextField
                  (
                    controller: _auctionHours,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration
                    (
                      labelText: "hours",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox
                (
                  width: 65,
                  child: TextField
                  (
                    controller: _auctionMin,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration
                    (
                      labelText: "min",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
              ]
            ),
            SizedBox(height: 20),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                ElevatedButton
                (
                  child: Text("Delete"),
                  style: ElevatedButton.styleFrom
                  (
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  onPressed: ()
                  {
                    deleteMap(widget.loMap.id, widget.loMap.area);
                    Navigator.pop(context);
                  }
                ),
                ElevatedButton
                (
                  child: Text("Cancel"),
                  style: ElevatedButton.styleFrom
                  (
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {Navigator.pop(context);}
                ),
                ElevatedButton
                (
                  child: Text("Save"),
                  style: ElevatedButton.styleFrom
                  (
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  onPressed: ()
                  {
                    _validInformations= true;
                    if ( _mapName.text.length <= 0)
                      _validInformations= false;
                    if (_validInformations)
                    {
                      final v = int.tryParse(_auctionHours.text);
                      if (!(v != null && v <= 5 && v >= 0))
                        _validInformations = false;
                    }
                    if (_validInformations)
                    {
                      final v = int.tryParse(_auctionMin.text);
                      if (!(v != null && v <= 59 && v >= 0))
                        _validInformations = false;
                    }
                    if (_validInformations)
                    {
                      FocusScope.of(context).unfocus();
                      Fluttertoast.showToast(msg: "Map successfully saved");
                      LoMap updatedMap = LoMap
                      (
                        id: widget.loMap.id,
                        area: widget.loMap.area,
                        mapName: _mapName.text,
                        auctionCycleEnd: (DateTime.now().add(Duration(
                            hours: int.parse(_auctionHours.text),
                            minutes: int.parse(_auctionMin.text)))
                            .millisecondsSinceEpoch),
                        mapBurnTimer: widget.loMap.mapBurnTimer,
                        auctionItem: widget.loMap.auctionItem,
                        itemNumber: widget.loMap.itemNumber,
                      );
                      updateMap(updatedMap);
                      Navigator.pop(context);
                    }
                    else
                      Fluttertoast.showToast(msg: "Invalid informations");
                  }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}