import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

//void main() => runApp(StorageApp());

class StorageApp extends StatelessWidget {
   const StorageApp(this.title, this.latlong); //this.long);
    final String title;
    final String latlong;
    //final String long;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StorageWidget(
        storage:  Storage(),
      ),
      
    );
  }
}
class StorageWidget extends StatefulWidget {
    const StorageWidget({Key key, @ required this. storage, this.title, this.latlong}): super(key:key);
    final String title;
    final String latlong;
    //final String long;
    final Storage storage;
  //StorageWidget({Key key, @required this.storage}): super(key:key);
  @override
  _StorageWidgetState createState() => _StorageWidgetState(latlong);
}

class _StorageWidgetState extends State<StorageWidget> {
  _StorageWidgetState(this.latlong);//, this.long);
  final String latlong;
 // final String long;
 // TextEditingController controller = TextEditingController();
  String state;

  //Future<Directory> _appDocDir;

  @override
  void initState(){
    super.initState();
    widget.storage.readData().then((String value){
       //.then((String value)){
      setState((){
        state = value;
      });
    });
  }
  Future<File> writeData() async{
    setState(() {
      //state = controller.text;
      state = (latlong);
      //controller.text = '';
    });
    return widget.storage.writeData(state);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: Column(
      //     children: <Widget>[
      //       Text('${state ?? "File is Empty"}'),
      //       TextField(
      //         controller: controller,
      //       ),
      //       RaisedButton(
      //         onPressed: (){},
      //           child: Text('write to file'),
              
      //       ),
      //       FutureBuilder<Directory>(
      //         future: _appDocDir,
      //         builder: (BuildContext context, AsyncSnapshot<Directory> snapshot){
      //           Text text = Text('');
      //           if (snapshot.connectionState = ConnectionState.done){
      //             if (snapshot.hasError){
      //               text = Text('Error: ${snapshot.error}');
      //             } else if (snapshot.hasData){
      //               text = Text('Path: ${snapshot.data.path}');
      //             } else {
      //               text = Text('Unavailable');
      //             }
      //           }
      //         return new Container(
      //           child:  text,
      //         );
      //         }
      //       )
      //     ],
      //   ),
      // ),
      );
      
    
  }
}

class Storage {

  Future<String> get localPath async{
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }


  Future<File> get localFile async{
    final path = await localPath;
    return File('$path/location.txt');
  }
  Future<String> readData() async{
    try{
      final file = await localFile;
      String body =await file.readAsString();
      return body;
    }catch(e){
      return e.toString();
    }
  }

  Future<File> writeData(String data) async{
    final file = await localFile;
    return file.writeAsString("$data");
  }
}