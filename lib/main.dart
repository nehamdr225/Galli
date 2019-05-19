import 'package:flutter/material.dart';
//import './maps/map.dart';
import './maps/geolocation.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // int _selectedPage=0;
  // final _pageOption= [LocationPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: null, //showMenu({ BuildContext context,  }),
        //body: _pageOption[_selectedPage],
        body: CurrentLocationWidget(),
      ),
    );
  }
}