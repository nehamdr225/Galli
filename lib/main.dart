import 'package:flutter/material.dart';
import './maps/geolocation.dart';
import './UI/drawer.dart';
import 'package:galli/UI/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: MyApps(),
      
    );
  }
}


class MyApps extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(  
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            actions: <Widget>[
              //SearchWidget(),
              IconButton( 
                icon: Icon(Icons.search) ,
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder:(context) => SearchWidget()),
                  );
                 
                },
              )
            ],
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black)
            
          ),
        ),      
        body: CurrentLocationWidget(),
        drawer: DrawerApp(),        //child: new Center(child: const Text('Drawer'),),
        //),        
      )
    );  
      
  }
}
  