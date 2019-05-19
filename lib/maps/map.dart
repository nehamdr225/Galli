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
          children: [Container(child:GoogleMap(
                initialCameraPosition: CameraPosition(
                  
                  target: LatLng(lat, long),
                  //target: LatLng(lati, lang),
                  zoom: 20,
                ),
                markers: Set.from(allMarkers),     
                mapType: MapType.normal,
                  // onMapCreated: (GoogleMapController controller){
                  //   _controller.complete(controller);
                  // },
                  onMapCreated: mapCreated,
                ),   
              ),    
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: movetoLocation,
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                    color: Colors.teal
                    ),
                    child: Icon(Icons.forward, color:Colors.white),
                  ),
                ),)
          ]),
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
