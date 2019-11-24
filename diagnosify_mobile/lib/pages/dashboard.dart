import 'dart:io';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:diagnosify2/pages/scanpage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'loader.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 400), curve: Curves.ease);
    });
  }

  //
  Future<void> _showChoiceDialog(BuildContext context) {
    File imageFile;

    _openCamera(BuildContext context) async {
      imageFile = await ImagePicker.pickImage(
          source: ImageSource.camera, maxWidth: 500, maxHeight: 500);
      Navigator.of(context).pop();
      this.setState(() {
        if (imageFile == null) {
          print('nothing selected');
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ScanPage(imageFile)));
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Loader(1)));
        }
      });
    }

    _openGallery(BuildContext context) async {
      imageFile = await ImagePicker.pickImage(
          source: ImageSource.gallery, maxWidth: 500, maxHeight: 500);
      Navigator.of(context).pop();
      this.setState(() {
        if (imageFile == null) {
          print('nothing selected');
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ScanPage(imageFile)));
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Loader(1)));
        }
      });
    }

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Make a choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: ListTile(
                      leading: Icon(Icons.camera),
                      title: Text('Camera'),
                    ),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                  Divider(
                    thickness: 1.2,
                    indent: 20.0,
                    endIndent: 20.0,
                  ),
                  GestureDetector(
                    child: ListTile(
                      leading: Icon(Icons.image),
                      title: Text('Gallery'),
                    ),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var devWidth = MediaQuery.of(context).size.width;
    var devHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Health Tips',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/scanpage');
              },
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
          ),
        ],
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: <Widget>[
          ListView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(30.0),
            children: <Widget>[
              CustomCard(
                  topic: '12 of the best hip strenghtening exercises',
                  subTopic:
                      "The hips are one of those body parts that most of us don't really think about until "
                      "they're...",
                  pic: 'assets/images/run.jpg'),
              CustomCard(
                  topic: 'How to get a glowing skin',
                  subTopic:
                      "A major component— and signal— of healthy skin is a natural glow. But causes like lack of sleep, stress",
                  pic: 'assets/images/fruits.jpg'),
//          CustomCard(
//            topic: "5 fruits you should eat for glowing skin",
//            subTopic:
//                "These 5 fruits are the fruits to take if you want to get a glowing...",
//            pic: 'assets/images/blackwoman.jpg',
//          ),
//          CustomCard(
//            topic:
//                "23 Best Skincare Products That Will Give You the Most Amazing Skin of Your Life",
//            subTopic:
//                "Each year in the Good Housekeeping Institute Beauty Lab, we rigorously test skincare products, from moisturizers to cleansers...",
//            pic: 'assets/images/skincare.jpg',
//          ),
//          CustomCard(
//            topic:
//                "23 Best Skincare Products That Will Give You the Most Amazing Skin of Your Life",
//            subTopic:
//                "Each year in the Good Housekeeping Institute Beauty Lab, we rigorously test skincare products, from moisturizers to cleansers...",
//            pic: 'assets/images/pine.jpg',
//          ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Oops!',
                style: TextStyle(fontFamily: 'Pacifico', fontSize: 40),
              ),
              Image.asset(
                'assets/images/sad.png',
                width: devWidth / 1.7,
              ),
              Text(
                'Watch out for Logs page in Future updates',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Oops!',
                style: TextStyle(fontFamily: 'Pacifico', fontSize: 40),
              ),
              Image.asset(
                'assets/images/sad.png',
                width: devWidth / 1.7,
              ),
              Text(
                'Watch out for Profile page in Future updates',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Oops!',
                style: TextStyle(fontFamily: 'Pacifico', fontSize: 40),
              ),
              Image.asset(
                'assets/images/sad.png',
                width: devWidth / 1.7,
              ),
              Text(
                'Watch out for Settings page in Future updates',
                style: TextStyle(fontSize: 16),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showChoiceDialog(context);
        },
        child: Icon(Icons.search),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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

class CustomCard extends StatelessWidget {
  final pic;
  final topic;
  final subTopic;
  const CustomCard({
    Key key,
    @required this.topic,
    @required this.subTopic,
    @required this.pic,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var devWidth = MediaQuery.of(context).size.width;
    var devHeight = MediaQuery.of(context).size.height;
    return Card(
      margin: EdgeInsets.only(bottom: 25.0),
      elevation: 1.0,
      child: Column(
        children: <Widget>[
          Container(
              width: devWidth - 40,
              child: Image.asset(
                pic,
                height: devHeight / 3.2,
                fit: BoxFit.fitWidth,
              )),
          ListTile(
            title: Text(topic),
            subtitle: Text(
              subTopic,
              style: TextStyle(fontSize: 11),
            ),
            trailing: Icon(
              Icons.more_horiz,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}

//TODO avatar changer
