import 'dart:io';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
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
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text("Feed")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("Logs")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.person,
                color: Colors.indigo,
              ),
              title: Text("Profile")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.settings,
                color: Colors.green,
              ),
              title: Text("Settings"))
        ],
      ),
    );
  }
}
