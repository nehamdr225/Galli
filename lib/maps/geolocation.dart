import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../backend/RESTapi.dart';
import '../UI/drawer.dart';
import '../UI/search.dart';
import '../UI/colors.dart';



class CurrentLocationWidget extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<CurrentLocationWidget> {
   Geolocator geolocator = Geolocator();

  Position userLocation;
    List<Marker> allMarkers =[];      
  GoogleMapController _controller;


  @override
  void initState() {
    super.initState();
    _getLocation().then((position) {
      userLocation = position;
      allMarkers.add(
      Marker(
        markerId:MarkerId('myMarker'),
        draggable: true,
        infoWindow: InfoWindow(title: 'Your current location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: LatLng(userLocation.latitude.toDouble(), userLocation.longitude.toDouble()),
      )
    );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(),
      drawer: DrawerApp(),
      body: Center(
        child: 
          userLocation == null
            ? CircularProgressIndicator(
                backgroundColor: Colors.grey[400],
              )
            : Stack(
              children: <Widget> [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(userLocation.latitude.toDouble(), userLocation.longitude.toDouble()),
                    zoom: 30
                  ),
                  markers: Set.from(allMarkers),     
                  mapType: MapType.normal,
                  onMapCreated: mapCreated,
                ),
                _buildContainer(),  
                IconButton(
                  icon: Icon(Icons.add_location),
                  onPressed: (){
                    movetoLocation();
                  },
                )          

              ]),
            ),
          );
  }

  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  Widget _buildContainer(){
    return SafeArea(
      child: Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        child: Icon(Icons.my_location),
        backgroundColor: Colors.red[800],
        onPressed: (){
           Navigator.push(
            context, MaterialPageRoute(builder: (context) => StatusAlert()),//place, count, density)),
          );
        },
      ),
    )
    );
  }
  void mapCreated(controller){
    setState(() {
      _controller = controller;
    });
  }
    movetoLocation(){
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(userLocation.latitude.toDouble(), userLocation.longitude.toDouble()),
                      zoom: 30.0, bearing: 45.0,tilt:45.0),
    ));
  }
}


class GradientAppBar extends StatelessWidget implements PreferredSize{

  build(BuildContext context)=> Stack(
    children: <Widget> [
      Positioned(
        child:  DecoratedBox(
          child: Container(width: 400.0, height: 100.0,),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.red[200],
              Colors.red,
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight)
          ),
        )
      ),
      AppBar(
      backgroundColor: appBarcolor,
      iconTheme: IconThemeData(color: iconcolor),
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
      ])
    ]); 
    
  Widget get child => null;

    final preferredSize = const Size.fromHeight(40.0);
  
}