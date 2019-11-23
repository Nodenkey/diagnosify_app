import 'dart:io';

import 'package:diagnosify2/pages/results.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  final File imageFile;
  ScanPage(this.imageFile);
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var devWidth = MediaQuery.of(context).size.width;
    var devHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          Center(
            child: Container(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                width: 45.00,
                height: 45.00,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  image: new DecorationImage(
                    image: ExactAssetImage('assets/images/girl.jpg'),
                    fit: BoxFit.fitHeight,
                  ),
                )),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Scan your image',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: Stack(
                    children: <Widget>[
                      Center(child: Image.asset('assets/images/Scanner.png')),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Center(
                          child: Container(
                              child: Image.file(
                            widget.imageFile,
                            width: 280,
                            height: 243,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70.0,
                ),
                MaterialButton(
                  minWidth: 150.0,
                  color: Colors.blue,
                  child: Text('Scan Image',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Results(widget.imageFile),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
