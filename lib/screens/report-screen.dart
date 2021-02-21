import 'package:flutter/material.dart';


class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {

  static const menu=<String> [
    ' الشريحة الاولي  100-200',
    'الشريحة الثانية 200-400',
    'الشريحة الثالثة 400-800'
  ];
final List <DropdownMenuItem<String>> _drop = menu.map(
    (String value)=>DropdownMenuItem<String>(
      value: value,
      child: Text (value),
    )
).toList();
String _btn1,_btn2,_btn3;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[400],

          title: Text('Report Car'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(

            //maintainBottomViewPadding: true,
            child: Center(
              child: Column(

                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  DropdownButton (
                    value: _btn2,
                    hint: Text('Choose'),
                    onChanged: ( (String newval) {
                      setState(() {
                        _btn2=newval;
                      });
                    }),
                    items: _drop,
                  ),
                  TextField(
                    style: TextStyle (
                      color: Colors.white
                    ),
                  maxLines: 10,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      labelText: 'Report',
                      labelStyle: TextStyle(
                          color: Colors.white
                      ),
                      hintText: 'Type Something....'
                    ),
                    onChanged: (text){
                    setState(() {

                    });
                    },
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
