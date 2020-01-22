import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graduation_project/search-service.dart';


class ShowData extends StatefulWidget {

  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {


  var queryResult=[];

  retrieve (id)
  {
    ScanSearch().searchByID(id).then((QuerySnapshot docs)
    {
      queryResult.forEach((element)
      {
       if (element['id'].isEqualTo(res))
       {
         queryResult.add(element);
       }
      });
    }
    );
  }




  Widget input(String s) {
    return Container(
      decoration: BoxDecoration(
        color:  Colors.blueGrey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),

      ),
      //alignment: Alignment(1.0, 0.0),
      //color: Colors.grey.shade300,
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 3.0),
      padding: EdgeInsets.all(10.0),
      child: Text(s,
        style: TextStyle(
          color:Colors.white,
          fontSize: 16.0,

          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blueGrey[800],
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[400],

            title: Text('Car details'),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    input('Car\'s Owner'),
                    input('525-36-565-4442'),
                    input('Gate Name'),
                    input('Licence Data'),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color:Colors.red[800],
                      onPressed: () {},

                      child: Text(
                        'Button 1',
                        style: TextStyle(

                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.green,
                      onPressed: () {},
                      child: Text(

                        'Button 2',
                        style: TextStyle(
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
