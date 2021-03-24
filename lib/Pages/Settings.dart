import 'package:flutter/material.dart';
import 'package:lo_auctions_sniper/DatabaseSettings.dart';
import 'package:lo_auctions_sniper/globals.dart';

class Settings extends StatefulWidget
{
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: SingleChildScrollView
      (
        padding: EdgeInsets.all(10),
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
            Card
            (
              child: Padding
              (
                padding: EdgeInsets.all(20),
                child: Column
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [
                    Card
                    (
                      child: Padding
                      (
                        padding: EdgeInsets.all(10),
                        child: Center
                        (
                          child: Text("Areas to display", style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>
                      [
                        Text("EU", style: TextStyle(fontSize: 16)),
                        Switch
                        (
                          onChanged: (bool value) {setState(() => gbEU = value); updateSettings();},
                          value: gbEU,
                        ),
                      ],
                    ),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>
                      [
                        Text("NA-E", style: TextStyle(fontSize: 16)),
                        Switch
                        (
                          onChanged: (bool value) {setState(() => gbNAE = value); updateSettings();},
                          value: gbNAE,
                        ),
                      ],
                    ),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>
                      [
                        Text("NA-W", style: TextStyle(fontSize: 16)),
                        Switch
                        (
                          onChanged: (bool value) {setState(() => gbNAW = value); updateSettings();},
                          value: gbNAW,
                        ),
                      ],
                    ),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>
                      [
                        Text("SA", style: TextStyle(fontSize: 16)),
                        Switch
                        (
                          onChanged: (bool value) {setState(() => gbSA = value); updateSettings();},
                          value: gbSA,
                        ),
                      ],
                    ),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>
                      [
                        Text("ASIA", style: TextStyle(fontSize: 16)),
                        Switch
                        (
                          onChanged: (bool value) {setState(() => gbASIA = value); updateSettings();},
                          value: gbASIA,
                        ),
                      ],
                    ),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>
                      [
                        Text("OCE", style: TextStyle(fontSize: 16)),
                        Switch
                        (
                          onChanged: (bool value) {setState(() => gbOCE = value); updateSettings();},
                          value: gbOCE,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card
            (
              child: Padding
              (
                padding: EdgeInsets.all(20),
                child: Column
                (
                  children:
                  [
                    Card
                    (
                      child: Padding
                      (
                        padding: EdgeInsets.all(10),
                        child: Center
                        (
                          child: Text("Items to snipe", style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>
                      [
                        Image
                        (
                          image: AssetImage("assets/Strongboxes/tablets_1.png"),
                          height: 50,
                          width: 50,
                        ),
                        Switch
                        (
                          onChanged: (bool value) {setState(() => gbTablets = value); updateSettings();},
                          value: gbTablets,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>
                      [
                        Image
                        (
                          image: AssetImage("assets/Strongboxes/modules_1.png"),
                          height: 50,
                          width: 50,
                        ),
                        Switch
                        (
                          onChanged: (bool value) {setState(() => gbModules = value); updateSettings();},
                          value: gbModules,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>
                      [
                        Image
                        (
                          image: AssetImage("assets/Strongboxes/weapons_1.png"),
                          height: 50,
                          width: 50,
                        ),
                        Switch
                        (
                          onChanged: (bool value) {setState(() => gbWeapons = value); updateSettings();},
                          value: gbWeapons,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>
                      [
                        Image
                        (
                          image: AssetImage("assets/Strongboxes/armor_1.png"),
                          height: 50,
                          width: 50,
                        ),
                        Switch
                        (
                          onChanged: (bool value) {setState(() => gbArmor = value); updateSettings();},
                          value: gbArmor,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>
                      [
                        Image
                        (
                          image: AssetImage("assets/Strongboxes/tools_1.png"),
                          height: 50,
                          width: 50,
                        ),
                        Switch
                        (
                          onChanged: (bool value) {setState(() => gbTools = value); updateSettings();},
                          value: gbTools,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>
                      [
                        Image
                        (
                          image: AssetImage("assets/Strongboxes/equipment_1.png"),
                          height: 50,
                          width: 50,
                        ),
                        Switch
                        (
                          onChanged: (bool value) {setState(() => gbEquipment = value); updateSettings();},
                          value: gbEquipment,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}