import 'package:flutter/material.dart';
import 'screens/welcome-screen.dart';
import 'screens/scan-qr.dart';
import 'screens/data-screen.dart';
import 'screens/data-screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var queryResultSet=[];
  var tempSearchStore=[];


  initialSearch (value)
  {

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        title: Text('Search'),

      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value)
              {
                retrieve(value);
              },

              decoration: InputDecoration(
                prefixIcon: IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.arrow_back),
                  iconSize: 20.0,
                  onPressed: ()
                  {
                    Navigator.of(context).pop();
                  },
                ),
                contentPadding: EdgeInsets.only(left: 25.0),
                hintText: 'search',
                border: OutlineInputBorder(borderRadius:BorderRadius.circular(4.0)),
              ),

            ),
          )
        ],
      ),
    );
  }
}









//title: 'Flutter Demo',
//theme: ThemeData(
//brightness: Brightness.dark,
//primaryColor: Color(0xFF143642),
//primaryColorLight: Color(0xFF26667d),
//primaryColorDark: Color(0xFF08161b),
//primaryColorBrightness: Brightness.dark,
//accentColor: Colors.white,
//),
//initialRoute: '/scan' ,
//routes: {
//'/':(context) => WelcomeScreen(),
//'/scan':(context) => Scanner(),
//'/data':(context) =>ShowData(),
//},