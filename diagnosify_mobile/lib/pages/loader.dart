import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatefulWidget {
  final int number;
  Loader(this.number);
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    if (widget.number == 1.toInt()) {
      Future.delayed(Duration(seconds: 5), () {
        Navigator.of(context).pop('/loader');
      });
    }
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}
