import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 16 : 8.0,
      width: isActive ? 16 : 8.0,
      decoration: BoxDecoration(
          color: isActive ? Color.fromRGBO(169, 180, 244, 50) : Colors.white,
          border: !isActive
              ? Border.all(
                  color: Color.fromRGBO(169, 180, 244, 50),
                  width: 2,
                  style: BorderStyle.solid)
              : Border.all(color: Color.fromRGBO(0, 0, 0, 0)),
          borderRadius: BorderRadius.circular(100)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {
                    _pageController.animateToPage(3,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  child: _currentPage != _numPages - 1
                      ? Text(
                          "Skip",
                          style: TextStyle(
                              color: Color.fromRGBO(169, 180, 244, 50),
                              fontSize: 20.0),
                        )
                      : Text(''),
                ),
              ),
              Container(
                height: deviceSize.height - 200,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: SvgPicture.asset(
                              'assets/images/phone.svg',
                              height: deviceSize.height - 400.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Diagnosis',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: 'Pacifico',
                                letterSpacing: 1.5),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Instantly diagnose skin infections with your camera',
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 18.0,
                                height: 1.4,
                                fontFamily: 'Roboto'),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: SvgPicture.asset(
                              'assets/images/doctors.svg',
                              height: deviceSize.height - 400.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Doctors',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: 'Pacifico',
                                letterSpacing: 1.5),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Directly connect with specialists\nafter skin diseases diagnosis',
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 18.0,
                                height: 1.4,
                                fontFamily: 'Roboto'),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: SvgPicture.asset(
                              'assets/images/report.svg',
                              height: deviceSize.height - 400.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Medical History',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: 'Pacifico',
                                letterSpacing: 1.5),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Have all medical reports\nrelating to your skin at one place',
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 18.0,
                                height: 1.4,
                                fontFamily: 'Roboto'),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: SvgPicture.asset(
                              'assets/images/feed.svg',
                              height: deviceSize.height - 400.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Tips',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: 'Pacifico',
                                letterSpacing: 1.5),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Receive health tips\nto aid you live healthier',
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 18.0,
                                height: 1.4,
                                fontFamily: 'Roboto'),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              _currentPage != _numPages - 1
                  ? Expanded(
                      child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Color.fromRGBO(169, 180, 244, 50),
                                      fontSize: 20.0),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Color.fromRGBO(169, 180, 244, 50),
                                  size: 25.0,
                                )
                              ],
                            ),
                          )),
                    )
                  : Text(''),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 60.0,
              width: double.infinity,
              child: GestureDetector(
//                onTap: () => Navigator.push(
//                    context, MaterialPageRoute(builder: (context) => Signup())),
                onTap: () =>
                    Navigator.pushReplacementNamed(context, '/choicePage'),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              color: Color.fromRGBO(169, 180, 244, 50),
            )
          : Text(''),
    );
  }
}
