import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'scan-qr.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _auth = FirebaseAuth.instance;
final AuthServices _auth2 = AuthServices();

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  String userID,password;
  bool save=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: ModalProgressHUD(
        inAsyncCall: save,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 150.0,
                    ),
                  ),
                  Text(
                    'smart KARta',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                //style: new TextStyle(color: Colors.black),
                textAlign: TextAlign.center,

                onChanged: (value) {
                  userID=value;

                },
                decoration: InputDecoration(
                  //labelStyle:  new TextStyle(color: Colors.black),
                  labelText: 'Enter your ID',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF26667d), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF26667d), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                //style: new TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password=value;
                },
                decoration: InputDecoration(
                  labelText: 'Enter your password',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF26667d), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF26667d), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Color(0xFF26667d),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      final login =_auth.signInWithEmailAndPassword(email: userID, password: password);
                      try {
                        if (await FirebaseAuth.instance.currentUser()!=null)
                        {
                          Navigator.pushNamed(context,'/scan');
                        }
                        else
                          {
                            Fluttertoast.showToast(

                              msg: "Invalid credentials",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,

                            );
                          }
                      } catch (e) {
                        print('no');
                      }
                      setState(() {
                        save = false;
                      });
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Log In',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


