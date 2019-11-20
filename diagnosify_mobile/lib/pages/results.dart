import 'dart:io';

import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  final File imageFile;
  Results(this.imageFile);
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    var devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Results',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.file(widget.imageFile),
                    width: 240,
                    height: 230,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Scan Complete',
                      style: TextStyle(color: Colors.redAccent, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Card(
                      elevation: 0,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/donor.png',
                          width: 35,
                          height: 35,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Melanoma',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Card(
                      elevation: 0,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/aware.png',
                          width: 35,
                          height: 35,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'A skin condition caused by blocked sweat ducts and trapped sweat beneath the skin.',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Card(
                      elevation: 0,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/steth.png',
                          width: 35,
                          height: 35,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'The rash may appear as blisters or red lumps. Heat rash may cause itchiness or a prickly feeling.',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Card(
                      elevation: 0,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: ListTile(
                          leading: Image.asset(
                            'assets/images/first_aid.png',
                            width: 35,
                            height: 35,
                          ),
                          title: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: RichText(
                                text: TextSpan(
                                  // Note: Styles for TextSpans must be explicitly defined.
                                  // Child text spans will inherit styles from parent
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            'For further diagnosis and treatment tap the'),
                                    TextSpan(
                                        text: ' book appointment button',
                                        style: TextStyle(color: Colors.blue)),
                                    TextSpan(
                                        text:
                                            ' to book an appointment with a doctor.')
                                  ],
                                ),
                              ))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 30),
                    child: MaterialButton(
                      child: Text('Book Appointment',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      color: Colors.blue,
                      height: 50,
                      minWidth: 200,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
