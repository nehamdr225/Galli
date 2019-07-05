import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:flutter/material.dart';
//import '../UI/signup.dart';
const API_URI = "https://tmsbackend.herokuapp.com/";

class Register{
  String name;
  String email;
  String password;
  double id;
  
  Register({
    this.name,
    this. email, 
    this.password, 
    this.id
    
  });

  factory Register.fromJson(Map<String, dynamic> json)=> Register(
      name:json['name'],
      email: json['email'],
      password: json['password'],    
      id: json['id'],  
  );

  Map<String, dynamic> toJson()=>{
     "id":id,
     "email": email,
     "name": name,
     "password": password
   };
}


String postToJson(Register data){
  final dyn = data.toJson();
  return json.encode(dyn);
}

String allPostsToJson(List<Register> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

Future<Register> fetchDB() async{
  final response = await http.get(API_URI + 'user',
    headers: {
    "Accept": "application/json"
  });
  final jsonresponse = json.decode(response.body);
    
    if(response.statusCode == 200){
      return Register.fromJson(jsonresponse[0]);
    }else{
      throw Exception('Failed to load data');
    }
}
 
Future<http.Response> createPost(List reg) async{
  final response = await http.post('API_URI'+ 'user',
    headers: {
      "Content-Type": 'application/json',
      //HttpHeaders.authorizationHeaders:'',
    },
    body: allPostsToJson(reg)

  );
  return response;
}
