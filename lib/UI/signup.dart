import 'package:flutter/material.dart';
import '../backend/http-service.dart';


void main()=> runApp(SignupPage());

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page(),
    );
  }
}

class Page extends StatefulWidget {
  @override
  PageState createState() => PageState();
}

class PageState extends State<Page> {

  @override
  Widget build(BuildContext context) {

    final name = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
                    labelText: 'FULL NAME',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                    )
                  ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                    )
                  ),
                );
    

    // final number = TextFormField(
    //   keyboardType: TextInputType.emailAddress,
    //   autofocus: false,
    //   decoration: InputDecoration(
    //     icon: Icon(Icons.call),
    //     labelText: 'Mobile No.',
    //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //   ),
    // );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
       decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                    )
                  ),
    );

     List pjson = [email, name, password];

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text("SIGN", 
                    style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                  child: Text("UP", 
                    style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left:20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                email,
                SizedBox(height: 20.0,),
                 name,
                SizedBox(height: 20.0,),
               password,
                SizedBox(height: 40.0,),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: (){
                        createPost(pjson);
                        //Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            color:Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily:'Montserrat'
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  height: 40.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0
                      ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Icon(Icons.people),
                        ),
                        SizedBox(width: 20.0,),
                        Center(
                          child: Text('Log in with google',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'
                          ),),
                        )
                      ],),
                    
                  ),
                )

              ],
            ) ,),
            
        ],
      ),
      
    );
  }
}