import 'package:flutter/material.dart';
import 'maps/geolocation.dart';
import 'UI/messageView.dart';
import 'UI/settings.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
      
    );
  }
}

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedPage = 0;
  final _pageOptions = [
    CurrentLocationWidget(),
    //Map(),
    MessageApp(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (int index){
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
            BottomNavigationBarItem(
              icon: IconTheme(
                child: Icon(Icons.map),
                data: IconThemeData(color: Colors.grey),
              ),
              title: Text('Map'),
          ),
          BottomNavigationBarItem(
            icon: IconTheme(
                child: Icon(Icons.message),
                data: IconThemeData(color: Colors.grey),
                
              ),
            title: Text('Message'),
            
          ),
          BottomNavigationBarItem(
            icon: IconTheme(
                child: Icon(Icons.settings),
                data: IconThemeData(color: Colors.grey),
              ),
            title: Text('Settings'),
            
          ),

        ],

      ),
  
    );
  }
}