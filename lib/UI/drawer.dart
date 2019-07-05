import 'package:flutter/material.dart';
import './signin.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
              child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Color(0xff5938),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Account'),
              onTap: () {                
                Navigator.push(
                    context, 
                    MaterialPageRoute(builder:(context) => MyApp()),
                  );
              },
            ),
          ],
        ),
      
    );
  }
}

      //key: key,
      // Scaffold.of(context).openDrawer(
      //   Drawer()
      // ),