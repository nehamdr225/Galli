import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'dart:async';


class MapWidget extends StatelessWidget {
  const MapWidget(this.title, this.lat, this.long);
  final String title;
  final double lat;
  final double long;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Maps(lat, long),     
    );
  }
}

class Maps extends StatefulWidget {
  const Maps(this.lat, this.long);
  final double lat;
  final double long;  
  @override
  _MapsState createState() => _MapsState(lat, long);
}

class _MapsState extends State<Maps> {  
  _MapsState(this.lat, this.long);
  final double lat;
  final double long;

  List<Marker> allMarkers =[];
  
  GoogleMapController _controller;

  @override
  void initState(){
    super.initState();
    allMarkers.add(
      Marker(
        markerId:MarkerId('myMarker'),
        draggable: true,
        onTap: (){
          print('marker tapped');
        },
        position: LatLng(lat, long),
      )
    );
  }
  //Completer<GoogleMapController> _controller = Completer();

  
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: <Widget>[Container(child:GoogleMap(
                initialCameraPosition: CameraPosition(                  
                  target: LatLng(lat, long),        
                  zoom: 20,
                ),
                markers: Set.from(allMarkers),     
                mapType: MapType.normal,
                onMapCreated: mapCreated,
                ),   
              ), 

              Container(
                height: 100,
                width: 400,
                color: Color.fromRGBO(255, 255, 255, 0.8),
                alignment: Alignment(-0.0, 0.9),
                child: TextField(         
                        decoration: InputDecoration(
                          labelText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          )
                        ),                   
                      ),
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


// Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text(title, style: TextStyle(color: Colors.black, fontSize: 32.0) ),
//           Text(message, style: TextStyle(color: Colors.black, fontSize: 32.0) ),
//         ],
//       ),
      
//     )

// Align(
//                 alignment: Alignment.bottomCenter,
//                 child: InkWell(
//                   onTap: movetoLocation,
//                   child: Container(
//                     height: 40.0,
//                     width: 40.0,
//                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
//                     color: Colors.teal
//                     ),
//                     child: Icon(Icons.forward, color:Colors.white),
//                   ),
//                 ),)