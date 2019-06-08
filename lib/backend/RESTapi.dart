//import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

const API_URI = "https://tmsbackend.herokuapp.com/";

class DB{
  final String place;
  final String count;
  final String density;

  DB({this.place,this.count, this.density});
  factory DB.fromJson(Map<String,dynamic> json){
    return DB(
      place:json['place'],
      count: json['count'],
      density: json['density']
    );
  }
  final appData = DB();

}
Future<DB> fetchData() async{
  final response = await http.get(API_URI + 'traffic/location'); //traffic ko satta user ni rakhna milne
  
  if(response.statusCode == 200){
    return DB.fromJson(json.decode(response.body));
  }else{
    throw Exception('Failed to load data');
  }
}


class StatusAlert extends StatelessWidget {
  final Future<DB> db;

  StatusAlert({Key key, this.db, this.place, this.count, this.density}) : super(key: key);
  final String place;
  final String count;
  final String density;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Place: $place'),
      content: Text('Traffic Count: $count, Traffic Density: $density'),
      backgroundColor: Colors.grey,
    );
  }
}