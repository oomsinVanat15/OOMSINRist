import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Explicit
  String resultCode = '';


  // Method
  Widget autenButton() {
    return RaisedButton(
      color: Colors.orange[700],
      child: Text(
        'Authentication',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You Click Authen');
        readQRcode();
      },
    );
  }



  Future<void>readQRcode()async{

    try {

      resultCode = await BarcodeScanner.scan();
      print('resultCode = $resultCode');
      
      
    } catch (e) {
    }

  }




  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/iconbarcode.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Oomsin Rist',
      style: TextStyle(
          color: Colors.red.shade900,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, Colors.pink],
              radius: 1.0,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                showAppName(),
                autenButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
