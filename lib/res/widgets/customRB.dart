import 'package:admin/res/colors.dart';
import 'package:flutter/material.dart';

class CustomRB extends StatelessWidget {
  CustomRB({@required this.onPressed, this.buttonTitle = 'click'});

  final GestureTapCallback onPressed;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 15, 30,15),
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
          buttonTitle,
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
