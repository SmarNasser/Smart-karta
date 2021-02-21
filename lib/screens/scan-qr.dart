import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class Scanner extends StatefulWidget {

  //static const String id='/scan';
  @override
  ScannerState createState() {
    return new ScannerState();
  }
}

class ScannerState extends State<Scanner> {
  String Res="Scan Your Code";
  Future scanQr () async{
    try {
      String res= await BarcodeScanner.scan();
      setState(() {
        Res=res;
      });
    }
    on PlatformException catch(ex){
      if(ex.code==BarcodeScanner.CameraAccessDenied) {
        setState(() {
          Res = 'Camera Access is denied';
        });

      }
      else
      {
        setState(() {
          Res='UNknown Error $ex';
        });
      }
    }
    on FormatException{
      setState(() {
        Res="YOU Pressed the back Button";
      });
    }
    catch (ex)
    {
      setState(() {
        Res='UNknown Error';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(

          backgroundColor: Colors.blueGrey[400],
          title: Text('QR Scanner'),

        ),
        body: Center(

          child: Text('Scan your Code',
            style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20.0,

          ),),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xFF26667d),

            onPressed: (){
            setState(() {
              scanQr();
            });
              Navigator.pushNamed(context, '/data');
            },
            icon: Icon(Icons.camera_alt),
            label: Text('Scan', style: TextStyle(color: Colors.white),)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
