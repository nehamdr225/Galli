//import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

const API_URI = "https://tmsbackend.herokuapp.com/";

class DB{
  final String place;
  final String status;
  final int count;
  final int density;

  DB({
    this.place,
    this. status, 
    this.count, 
    this.density 
  });

  factory DB.fromJson(Map<String, dynamic> json){
    return DB(
      place:json['pos'],
      status: json['status'],
      count: json['count'],
      density: json['density'],      
    );
  }
}

Future<DB> fetchDB() async{
  final response = await http.get(API_URI + 'traffic',
    headers: {
    "Accept": "application/json"
  });//traffic ko satta user ni rakhna milne

  final jsonresponse = json.decode(response.body);
  
  if(response.statusCode == 200){
    return DB.fromJson(jsonresponse[0]);
  }else{
    throw Exception('Failed to load data');
  }
}

class StatusAlert extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DB>(
      future: fetchDB(),

      builder: (context, snapshot){
        if (snapshot.hasData){
          return Material(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 300.0,
                width: 300.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    style: BorderStyle.solid,
                    width: 5.0,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Row(children: <Widget>[
                        Container(
                          width: 220,
                          height: 50,
                          child: Text("Place: ${snapshot.data.place}", 
                            textAlign: TextAlign.center, 
                            style: TextStyle(fontSize: 18.0, fontFamily: 'Montserrat', ),),
                            ),
                        Container(
                          width: 50.0,
                          height: 50.0,
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(Icons.close),
                            tooltip: 'close',
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                        ),       
                          ],)
                      
                    ),
                    Container(
                      width: 270,
                      height: 50,
                      child: Text("Status: ${snapshot.data.status}", textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0, fontFamily: 'Montserrat'),),
                    ),
                    Container(
                      width: 270,
                      height: 50,
                      child: Text("Density: ${snapshot.data.density}", textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0, fontFamily: 'Montserrat'),),
                    ),
                    Container(
                      width: 270,
                      height: 50,
                      child: Text("Count: ${snapshot.data.count}", textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0, fontFamily: 'Montserrat'),),
                    ),
                  ],
                ),  
            ),
            ) 
          );   
          }
        else if (snapshot.hasError){
          return Text("Error ${snapshot.error}");
        }
      return Container(
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    width: 300.0,
                    height: 300.0,
                    alignment: AlignmentDirectional.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: SizedBox(
                            height: 50.0,
                            width: 50.0,
                            child: CircularProgressIndicator(
                              value: null,
                              strokeWidth: 5.0,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25.0),
                          child: Center(
                            child: Text("Loading data, please wait.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              
          //CircularProgressIndicator();
    );
    });
  }
}


