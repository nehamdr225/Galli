import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
import './colors.dart';
import './chatscreen.dart';
import '../maps/geolocation.dart';

// final ThemeData iOSTheme = ThemeData(
//   primaryColor: Colors.grey[400],
//   primarySwatch: Colors.red,
//   primaryColorBrightness: Brightness.dark,
// );

// final ThemeData androidTheme = ThemeData(
//   primarySwatch: Colors.blue[800],
//   accentColor: Colors.green[100],
// );

class GradientAppBar extends StatelessWidget implements PreferredSize{
  build(BuildContext context)=> Stack(
    children: <Widget> [
      Positioned(
        child:  DecoratedBox(
          child: Container(width: 400.0, height: 100.0,),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.greenAccent[200],
              Colors.greenAccent[200],
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight)
          ),
        )
      ),
      AppBar(
      backgroundColor: appBarcolor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white,),
        onPressed: (){
             Navigator.push(
                    context, 
                    MaterialPageRoute(builder:(context) => CurrentLocationWidget()),
              );
          },
      ),  
      actions: <Widget>[
        IconButton( 
          icon: Icon(Icons.search, color: Colors.white,),
          onPressed: (){
             Navigator.push(
                    context, 
                    MaterialPageRoute(builder:(context) => CurrentLocationWidget()),
              );
          },
          
        )
      ],
      title: Text(" Messages",
        style: TextStyle(
          fontFamily: "Montserrat" )),
      iconTheme: IconThemeData(color: iconcolor),
      )
    ]); 
    
  Widget get child => null;

    final preferredSize = const Size.fromHeight(40.0);
  
}


class MessageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: defaultTargetPlatform == TargetPlatform.iOS
      //   ?iOSTheme
      //   :androidTheme,
      home: Scaffold(
        appBar: GradientAppBar(),
        body: ChatScreenState(),
      ),        
       
    );
  }
}



