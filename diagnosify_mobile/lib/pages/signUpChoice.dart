import 'package:diagnosify2/pages/login.dart';
import 'package:flutter/material.dart';

class Choice extends StatefulWidget {
  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    ThemeData(fontFamily: '');
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 251, 254, 7),
      body: Stack(
        children: <Widget>[
          Ink.image(
              fit: BoxFit.fill, image: AssetImage('assets/images/back.png')),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Image.asset(
                      'assets/images/logo2.png',
                      width: deviceSize.width / 3.0,
                    ),
                  ),
                  SizedBox(height: deviceSize.height / 4),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())),
                    },
                    child: Container(
                      width: deviceSize.width / 1.8,
                      height: 45,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 150),
                              blurRadius:
                                  3.0, // has the effect of softening the shadow
                              offset: Offset(
                                0.0, // horizontal, move right 10
                                3.0, // vertical, move down 10
                              ),
                            )
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () => {Navigator.pushNamed(context, '/signupPage')},
                    child: Container(
                      width: deviceSize.width / 1.8,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 150),
                              blurRadius:
                                  3.0, // has the effect of softening the shadow
                              offset: Offset(
                                0.0, // horizontal, move right 10
                                3.0, // vertical, move down 10
                              ),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: deviceSize.width / 5.5,
                        height: 1.0,
                        color: Color.fromRGBO(0, 0, 0, -30),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'OR',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: deviceSize.width / 5.5,
                        height: 1.0,
                        color: Color.fromRGBO(0, 0, 0, -30),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/Facebook.png',
                        height: 60,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Image.asset(
                        'assets/images/gmail.png',
                        height: 60,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
