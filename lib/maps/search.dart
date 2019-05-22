import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
//import 'package:async/async.dart';


const kGoogleApiKey = "AIzaSyDZjNbaS5r2O9QegMZt1peg4TjIbr7FYXY";

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: Search(),
      
    );
  }
}
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () async{
            Prediction p = await PlacesAutocomplete.show(
              context: context, apiKey: kGoogleApiKey);
            displayPrediction(p);
          },
          child: Text('Find Address'),
        )
      ),
      );
  }
  Future<Null> displayPrediction(Prediction p) async {
    if (p != null){
      PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
      var placeId = p.placeId;
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      var address = await Geocoder.local.findAddressesFromQuery(p.description);
      print(lat);
      print(lng);

    }
  }
}

  