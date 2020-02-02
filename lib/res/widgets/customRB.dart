import 'package:admin/res/colors.dart';
import 'package:flutter/material.dart';

class CustomRB extends StatelessWidget {
  CustomRB({@required this.onPressed, @required this.txt});

  final GestureTapCallback onPressed;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 25, 30, 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: onPressed,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: mBtn,
        child: Text(
          txt,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
