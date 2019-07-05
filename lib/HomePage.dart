import 'package:flutter/material.dart';
import './maps/geolocation.dart';
import './UI/drawer.dart';
import './UI/search.dart';
import './UI/colors.dart';
//import './UI/user.dart';
//import './backend/RESTapi.dart';
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
                icon: Icon(Icons.search, color: Colors.white,) ,
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder:(context) => SearchWidget()),
                  );
                 
                },
              )
            ],
            backgroundColor: appBarcolor,
            iconTheme: IconThemeData(color: iconcolor),
            
          ),
        ),      
        body: Stack(
          children: <Widget>[
            //SigninApp(),
            CurrentLocationWidget(), 
             

          ],
        ), 
        drawer: DrawerApp(),        //child: new Center(child: const Text('Drawer'),),
        //),        
      )
    );  
      
  }
}
  