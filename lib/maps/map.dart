import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../backend/RESTapi.dart';
import '../UI/drawer.dart';
import '../UI/search.dart';
import '../UI/colors.dart';

//import 'assets';
class MapWidget extends StatelessWidget {
  const MapWidget(this.title, this.lat, this.long, );
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
        infoWindow: InfoWindow(title: 'Your current location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
         position: LatLng(lat, long),
        
        // onTap: (){
        //   Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => StatusAlert()),//place, count, density)),
        //   );
        //}, 
        //position: LatLng(27.6915,85.342),//lat, long),
      )
    );
  }
  
  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(   
          appBar: GradientAppBar(),
          body: Stack(
            children: <Widget>[//Container(            
            GoogleMap(
                initialCameraPosition: CameraPosition( 
                  target: LatLng(lat, long),                         
                  //target: LatLng(27.6915,85.342),//lat, long),        
                  zoom: 30,
                ),
                markers: Set.from(allMarkers),     
                mapType: MapType.terrain,
                onMapCreated: mapCreated,
                ),
                _buildContainer(),
          ],
      ),
      drawer: DrawerApp(),
     )  
    );   
  }
  Widget _buildContainer(){
    return SafeArea(
      child: Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        child: Icon(Icons.my_location),
        backgroundColor: Colors.green,
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
      CameraPosition(target: LatLng(28.2333333, 83.9833333),
                      zoom: 12.0, bearing: 45.0,tilt:45.0),
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
              Colors.green,
              Colors.red[800],
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