import 'package:flutter/material.dart';
//import './maps/map.dart';
import './maps/geolocation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApps(),
    );
  }
}


class MyApps extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {

  // int _selectedPage=0;
  // final _pageOption= [LocationPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        appBar: null, 
  //       AppBar(
  //  // backgroundColor: Color(fillColor: MaterialType.transparency),
  //         leading: IconButton(
  //           icon: Icon(
  //             Icons.menu, semanticLabel: 'menu',
  //           ),
  //           onPressed: (){
  //             print('menu button');
  //           },
  //         ),
  //         actions: <Widget>[
  //           // TextField(
  //           //   decoration: InputDecoration(
  //           //     filled: true,
  //           //     labelText: 'Search'
  //           //   ),
              
  //           // ),
  //           IconButton(
  //             icon: Icon(Icons.search,
  //             semanticLabel: 'search'),
  //             onPressed: (){

  //               print('Search button');
  //             },
              
  //           ),
  //         ],
          
  //       ), //showMenu({ BuildContext context,  }),
  //       //body: _pageOption[_selectedPage],
        body: CurrentLocationWidget(),
      ),
    );
  }
}