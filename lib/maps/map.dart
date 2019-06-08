import 'package:flutter/material.dart';
//import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../backend/RESTapi.dart';


class MapWidget extends StatelessWidget {
  const MapWidget(this.title, this.lat, this.long, );//this.count, this.density);
  final String title;
  final double lat;
  final double long;
  
  // final double count;
  // final double density;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: true,
      home: Maps(lat, long),     
    );
  }
}

class Maps extends StatefulWidget {
  const Maps(this.lat, this.long);//this.count, this.density);
  final double lat;
  final double long;  
  // final double count;
  // final double density;
  @override
  _MapsState createState() => _MapsState(lat, long);
}

class _MapsState extends State<Maps> {  
  _MapsState(this.lat, this.long);// this.count, this.density);
  final double lat;
  final double long;
  // final double place;
  // final double count;
  // final double density;

  List<Marker> allMarkers =[];
  
  GoogleMapController _controller;

  @override
  void initState(){
    super.initState();
    allMarkers.add(
      Marker(
        markerId:MarkerId('myMarker'),
        draggable: true,
        infoWindow: InfoWindow(title: 'Status'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
        onTap: (){
          //_dialogcall(context);
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => StatusAlert()),//place, count, density)),
          );
          //createAlertDialog(context);//, place, count, density);  
        },
        position: LatLng(lat, long),
        //position: LatLng(27.6915,85.342),//lat, long),
      )
    );
  }
  createAlertDialog(BuildContext context){//, place, density, count){
    return showDialog(context: context, builder: (context){
      return AlertDialog(  
        title: Text('Alert Dialog'),
        // title: Text('Place: $place'),
        // content: Text('Traffic Count: $count, Traffic Density: $density'),
        backgroundColor: Colors.grey ,
        //child: Text("Count : $context"),        
     );
    });
  }
  
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
            children: <Widget>[//Container(
            GoogleMap(
                initialCameraPosition: CameraPosition( 
                  target: LatLng(lat, long),                         
                  //target: LatLng(27.6915,85.342),//lat, long),        
                  zoom: 30,
                ),
                markers: Set.from(allMarkers),     
                mapType: MapType.normal,
                onMapCreated: mapCreated,
                ),
          ],
      ),
      
    );    
  }
  void mapCreated(controller){
    setState(() {
      _controller = controller;
    });
  }
  movetoLocation(){
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(28.2333333, 83.9833333),
                      zoom: 12.0, bearing: 45.0,tilt:45.0),
    ));
  }
}

