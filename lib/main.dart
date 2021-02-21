import 'package:flutter/material.dart';
import 'package:graduation_project/Models/user.dart';
import 'package:graduation_project/services/auth.dart';
import 'package:provider/provider.dart';
import 'screens/welcome-screen.dart';
import 'screens/scan-qr.dart';
import 'screens/data-screen.dart';
import 'screens/report-screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: AuthServices().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color(0xFF143642),
          primaryColorLight: Color(0xFF26667d),
          primaryColorDark: Color(0xFF08161b),
          primaryColorBrightness: Brightness.dark,
          accentColor: Colors.white,
        ),
        initialRoute: '/',
        routes: {
          '/':(context) => WelcomeScreen(),
          '/scan':(context) => Scanner(),
          '/data':(context) =>ShowData(),
          '/report':(context) =>Report(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(



    );
  }
}









